mod cipher;
use cipher::*;

#[cfg(test)]
mod tests;

use std::{iter, sync::{LazyLock, Mutex}};

static mut ARENA: LazyLock<Mutex<Arena>> = LazyLock::new(|| Mutex::new(Arena::new()));

pub fn new_array(size: u32) -> *mut u8 {
    let mut arena = unsafe { ARENA.lock().unwrap() };
    arena.allocate(size as usize)
}

pub fn drop_array(ptr: *mut u8) {
    let mut arena = unsafe { ARENA.lock().unwrap() };
    arena.deallocate(ptr);
}

pub fn encrypt_128(data: *mut u8, key: *mut u8) -> *mut u8 {
    let mut arena = unsafe { ARENA.lock().unwrap() };

    let data = arena.access(data, |a| to_block(a));
    let key = arena.access(key, |a| to_block(a));

    let aes = Aes::with_128_bit_key(key);
    let res = aes.encrypt(data);

    let output = arena.allocate(16);
    arena.access(output, |a| {
        a.copy_from_slice(&res);
    });
    output
}

pub fn decrypt_128(data: *mut u8, key: *mut u8) -> *mut u8 {
    let mut arena = unsafe { ARENA.lock().unwrap() };

    let data = arena.access(data, |a| to_block(a));
    let key = arena.access(key, |a| to_block(a));

    let aes = Aes::with_128_bit_key(key);
    let res = aes.decrypt(data);

    let output = arena.allocate(16);
    arena.access(output, |a| {
        a.copy_from_slice(&res);
    });
    output
}

fn to_block(slice: &[u8]) -> Block<16> {
    let mut block = [0u8; 16];
    block.copy_from_slice(slice);
    block
}

// ---- A wrapper for all the memory returned from extern functions ----

struct Arena<'a> {
    arrays: Vec<&'a mut [u8]>,
}

impl<'a> Arena<'a> {
    pub fn new() -> Self {
        Self { arrays: Vec::new() }
    }

    pub fn allocate(&mut self, size: usize) -> *mut u8 {
        let bytes = iter::repeat(0).take(size).collect::<Vec<u8>>().leak();
        let ptr = bytes.as_mut_ptr();
        self.arrays.push(bytes);
        ptr
    }

    pub fn access<T>(&mut self, ptr: *mut u8, m: impl FnOnce(&mut [u8]) -> T) -> T {
        let pos = self
            .arrays
            .iter_mut()
            .position(|k| k.as_mut_ptr() == ptr)
            .expect("cannot access non-existent array");
        m(self.arrays[pos])
    }

    pub fn deallocate(&mut self, ptr: *mut u8) {
        let key_pos = self
            .arrays
            .iter_mut()
            .position(|k| k.as_mut_ptr() == ptr)
            .expect("cannot drop non-existent array");
        let data = self.arrays.swap_remove(key_pos);

        // drop the memory
        let key: Vec<u8> =
            unsafe { Vec::from_raw_parts(data.as_mut_ptr(), data.len(), data.len()) };
        drop(key);
    }
}
