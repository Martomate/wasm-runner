use crate::error::DecodingError;

pub struct WasmDecoder<'a>(&'a [u8]);

impl<'a> WasmDecoder<'a> {
    pub fn new(bytes: &'a [u8]) -> Self {
        Self(bytes)
    }

    /// Runs the given function and only advances the buffer if no error occurred
    pub fn attempt<T>(&mut self, f: impl FnOnce(&mut Self) -> Result<T, DecodingError>) -> Result<T, DecodingError> {
        let mut bytes = Self::new(self.0);
        let res = f(&mut bytes);
        if res.is_ok() {
            self.0 = bytes.0;
        }
        res
    }
}

impl<'a> WasmDecoder<'a> {
    pub fn peek_byte(&self) -> u8 {
        self.0[0]
    }

    pub fn read_byte(&mut self) -> u8 {
        let res = self.0[0];
        self.0 = &self.0[1..];
        res
    }

    pub fn read_bytes(&mut self, count: usize) -> &'a [u8] {
        let res = &self.0[..count];
        self.0 = &self.0[count..];
        res
    }

    pub fn read_all_bytes(&mut self) -> &'a [u8] {
        let res = self.0;
        self.0 = &self.0[res.len()..];
        res
    }

    pub fn ensuring_size<T>(&mut self, expected_size: u32, f: impl FnOnce(&mut Self) -> Result<T, DecodingError>) -> Result<T, DecodingError> {
        let bytes = self.read_bytes(expected_size as usize);
        let mut decoder = Self(bytes);
        let res = f(&mut decoder)?;
        if !decoder.is_empty() {
            Err(format!("expected {} bytes to be read, but there are {} left", expected_size, decoder.0.len()))?;
        }
        Ok(res)
    }

    pub fn discard_byte(&mut self, expected: u8) -> Result<(), DecodingError> {
        let res = self.read_byte();
        if res != expected {
            Err(format!("expected {:x}, found: {:x}", expected, res))?;
        }
        Ok(())
    }

    pub fn read_vec<T>(&mut self, f: impl Fn(&mut Self) -> Result<T, DecodingError>) -> Result<Vec<T>, DecodingError> {
        let len = self.read_byte() as usize;

        let mut items = Vec::with_capacity(len);

        for _ in 0..len {
            items.push(f(self)?);
        }

        Ok(items)
    }

    pub fn read_until<T>(&mut self, f: impl Fn(&mut Self) -> Result<T, DecodingError>, done: impl Fn(u8) -> bool) -> Result<Vec<T>, DecodingError> {
        let mut items = Vec::new();

        loop {
            let b = self.0[0];
            if done(b) {
                break;
            }
            items.push(f(self)?);
        }

        Ok(items)
    }

    pub fn is_empty(&self) -> bool {
        self.0.is_empty()
    }
}
