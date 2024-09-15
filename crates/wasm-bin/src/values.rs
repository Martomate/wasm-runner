use crate::{decoder::WasmDecoder, error::DecodingError};

impl<'a> WasmDecoder<'a> {
    pub fn read_u32(&mut self) -> u32 {
        let b = self.read_byte();

        if b & 0b_1000_0000 == 0 {
            b as u32
        } else {
            ((b as u32) & !0b_1000_0000) | (self.read_u32() << 7)
        }
    }

    pub fn read_i32(&mut self) -> i32 {
        let b = self.read_byte();

        if b & 0b_1100_0000 == 0 {
            b as i32
        } else if b & 0b_1000_0000 == 0 {
            (b as i32) - 0b_1000_0000
        } else {
            ((b as i32) & !0b_1000_0000) | (self.read_i32() << 7)
        }
    }

    pub fn read_i64(&mut self) -> i64 {
        let b = self.read_byte();

        if b & 0b_1100_0000 == 0 {
            b as i64
        } else if b & 0b_1000_0000 == 0 {
            (b as i64) - 0b_1000_0000
        } else {
            ((b as i64) & !0b_1000_0000) | (self.read_i64() << 7)
        }
    }

    pub fn read_name(&mut self) -> Result<String, DecodingError> {
        let bytes = self.read_vec(|bytes| Ok(bytes.read_byte()))?;
        String::from_utf8(bytes).map_err(|err| format!("{}, bytes: {:?}", err.utf8_error(), err.as_bytes()).into())
    }
}

#[cfg(test)]
mod tests {
    mod read_u32 {
        use crate::WasmDecoder;

        #[test]
        fn small_positive() {
            let mut bytes = WasmDecoder::new(&[42, 0x7F]);
            assert_eq!(bytes.read_u32(), 42);
            assert_eq!(bytes.read_u32(), 0x7F);
            assert!(bytes.is_empty());
        }

        #[test]
        fn big_positive() {
            let mut bytes = WasmDecoder::new(&[0xE5, 0x8E, 0x26]);
            assert_eq!(bytes.read_u32(), 624485);
            assert!(bytes.is_empty());
        }
    }

    mod read_i32 {
        use crate::WasmDecoder;

        #[test]
        fn small_positive() {
            let mut bytes = WasmDecoder::new(&[42, 0x3F]);
            assert_eq!(bytes.read_i32(), 42);
            assert_eq!(bytes.read_i32(), 0x3F);
            assert!(bytes.is_empty());
        }

        #[test]
        fn small_negative() {
            let mut bytes = WasmDecoder::new(&[0x40, 0x7F]);
            assert_eq!(bytes.read_i32(), 0x40 - 0x80);
            assert_eq!(bytes.read_i32(), 0x7F - 0x80);
            assert!(bytes.is_empty());
        }

        #[test]
        fn big_positive() {
            let mut bytes = WasmDecoder::new(&[0x80, 42]);
            assert_eq!(bytes.read_i32(), 42 << 7);
            assert!(bytes.is_empty());

            let mut bytes = WasmDecoder::new(&[0x80 | 0x4F, 0x80 | 0x0A, 42]);
            assert_eq!(bytes.read_i32(), (42 << 14) | (0x0A << 7) | 0x4F);
            assert!(bytes.is_empty());
        }

        #[test]
        fn big_negative() {
            let mut bytes = WasmDecoder::new(&[0xC0, 0xBB, 0x78]);
            assert_eq!(bytes.read_i32(), -123456);
            assert!(bytes.is_empty());
        }

        #[test]
        fn example1() {
            let mut bytes = WasmDecoder::new(&[128, 128, 192, 0]);
            assert_eq!(bytes.read_i32(), 1048576);
            assert!(bytes.is_empty());
        }
    }
}
