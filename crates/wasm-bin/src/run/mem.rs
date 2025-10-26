use crate::wasm::Limits;


pub struct WasmMemory {
    pub bytes: Vec<u8>,
    pub limits: Limits,
}

impl WasmMemory {
    pub fn read_byte(&self, ptr: u32) -> u8 {
        if (ptr as usize) < self.bytes.len() {
            self.bytes[ptr as usize]
        } else {
            panic!("memory read out of bounds");
        }
    }

    pub fn read_bytes_fixed<const N: usize>(&self, ptr: u32) -> [u8; N] {
        if (ptr as usize + N) <= self.bytes.len() {
            let mut res = [0; N];
            res.copy_from_slice(&self.bytes[ptr as usize..][..N]);
            res
        } else {
            panic!("memory read out of bounds");
        }
    }

    pub fn write_bytes_fixed<const N: usize>(&mut self, ptr: u32, v: [u8; N]) {
        if (ptr as usize + N) <= self.bytes.len() {
            self.bytes[ptr as usize..][..N].copy_from_slice(&v);
        } else {
            panic!("memory write out of bounds, max: {}, ptr: {}, N: {}, limits: {:?}", self.bytes.len(), ptr, N, self.limits);
        }
    }

    pub fn write_bytes(&mut self, ptr: u32, v: &[u8]) {
        if (ptr as usize + v.len()) <= self.bytes.len() {
            self.bytes[ptr as usize..][..v.len()].copy_from_slice(v);
        } else {
            panic!("memory write out of bounds");
        }
    }

    pub fn write_byte(&mut self, ptr: u32, value: u8) {
        if (ptr as usize) < self.bytes.len() {
            self.bytes[ptr as usize] = value;
        } else {
            panic!("max memory size exceeded");
        }
    }

    pub fn read_c_string(&self, ptr: u32) -> &[u8] {
        let mut len = 0;
        while self.read_byte(ptr + len) != 0 {
            len += 1;
        }
        if len == 0 {
            b""
        } else {
            &self.bytes[(ptr as usize)..((ptr + len) as usize)]
        }
    }

    pub fn size(&self) -> u32 {
        self.bytes.len() as u32
    }

    pub fn try_grow(&mut self, num_bytes: u32) -> bool {
        if let Some(max) = self.limits.max() {
            if self.size() + num_bytes > max << 16 {
                return false;
            }
        }
        self.bytes.extend(std::iter::repeat_n(0, num_bytes as usize));
        true
    }
}
