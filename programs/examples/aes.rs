#![cfg(target_arch = "wasm32")]

use programs::aes as lib;

#[no_mangle]
pub extern "C" fn new_array(size: u32) -> *mut u8 {
    lib::new_array(size)
}

#[no_mangle]
pub extern "C" fn drop_array(ptr: *mut u8) {
    lib::drop_array(ptr);
}

#[no_mangle]
pub extern "C" fn encrypt_128(data: *mut u8, key: *mut u8) -> *mut u8 {
    lib::encrypt_128(data, key)
}

#[no_mangle]
pub extern "C" fn decrypt_128(data: *mut u8, key: *mut u8) -> *mut u8 {
    lib::decrypt_128(data, key)
}
