use crate::decoder::WasmDecoder;


impl<'a> WasmDecoder<'a> {
    pub fn next_byte(&mut self) -> u8 {
        let res = self.0[0];
        self.0 = &self.0[1..];
        res
    }
    
    pub fn next_bytes(&mut self, count: usize) -> &'a [u8] {
        let res = &self.0[..count];
        self.0 = &self.0[count..];
        res
    }

    pub fn next_u32(&mut self) -> u32 {
        let b = self.next_byte();

        if b & 0b_1000_0000 == 0 {
            b as u32
        } else {
            ((b as u32) & !0b_1000_0000) | (self.next_u32() << 7)
        }
    }

    pub fn next_i32(&mut self) -> i32 {
        let b = self.next_byte();

        if b & 0b_1100_0000 == 0 {
            b as i32
        } else if b & 0b_1000_0000 == 0 {
            (b as i32) - 0b_1000_0000
        } else {
            ((b as i32) & !0b_1000_0000) | (self.next_i32() << 7)
        }
    }

    pub fn next_i64(&mut self) -> i64 {
        let b = self.next_byte();

        if b & 0b_1100_0000 == 0 {
            b as i64
        } else if b & 0b_1000_0000 == 0 {
            (b as i64) - 0b_1000_0000
        } else {
            ((b as i64) & !0b_1000_0000) | (self.next_i64() << 7)
        }
    }

    pub fn next_name(&mut self) -> Result<String, String> {
        let bytes = self.read_vec(|bytes| Ok(bytes.next_byte()))?;
        String::from_utf8(bytes).map_err(|err| err.to_string())
    }
}

#[cfg(test)]
mod tests {
    mod next_u32 {
        use crate::WasmDecoder;

        #[test]
        fn small_positive() {
            let mut bytes = WasmDecoder(&[42, 0x7F]);
            assert_eq!(bytes.next_u32(), 42);
            assert_eq!(bytes.next_u32(), 0x7F);
            assert!(bytes.is_empty());
        }

        #[test]
        fn big_positive() {
            let mut bytes = WasmDecoder(&[0xE5, 0x8E, 0x26]);
            assert_eq!(bytes.next_u32(), 624485);
            assert!(bytes.is_empty());
        }
    }

    mod next_i32 {
        use crate::WasmDecoder;

        #[test]
        fn small_positive() {
            let mut bytes = WasmDecoder(&[42, 0x3F]);
            assert_eq!(bytes.next_i32(), 42);
            assert_eq!(bytes.next_i32(), 0x3F);
            assert!(bytes.is_empty());
        }

        #[test]
        fn small_negative() {
            let mut bytes = WasmDecoder(&[0x40, 0x7F]);
            assert_eq!(bytes.next_i32(), 0x40 - 0x80);
            assert_eq!(bytes.next_i32(), 0x7F - 0x80);
            assert!(bytes.is_empty());
        }

        #[test]
        fn big_positive() {
            let mut bytes = WasmDecoder(&[0x80, 42]);
            assert_eq!(bytes.next_i32(), 42 << 7);
            assert!(bytes.is_empty());
            
            let mut bytes = WasmDecoder(&[0x80 | 0x4F, 0x80 | 0x0A, 42]);
            assert_eq!(bytes.next_i32(), (42 << 14) | (0x0A << 7) | 0x4F);
            assert!(bytes.is_empty());
        }

        #[test]
        fn big_negative() {
            let mut bytes = WasmDecoder(&[0xC0, 0xBB, 0x78]);
            assert_eq!(bytes.next_i32(), -123456);
            assert!(bytes.is_empty());
        }

        #[test]
        fn example1() {
            let mut bytes = WasmDecoder(&[128, 128, 192, 0]);
            assert_eq!(bytes.next_i32(), 1048576);
            assert!(bytes.is_empty());
        }
    }
}
