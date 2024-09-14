pub struct WasmDecoder<'a>(pub &'a [u8]);

impl<'a> WasmDecoder<'a> {
    pub fn assert_next_byte(&mut self, expected: u8) -> Result<(), String> {
        let res = self.next_byte();
        if res != expected {
            return Err(format!("expected {:x}, found: {:x}", expected, res));
        }
        Ok(())
    }

    pub fn read_vec<T>(&mut self, f: impl Fn(&mut Self) -> Result<T, String>) -> Result<Vec<T>, String> {
        let len = self.next_byte() as usize;

        let mut items = Vec::with_capacity(len);

        for _ in 0..len {
            items.push(f(self)?);
        }

        Ok(items)
    }

    pub fn read_until<T>(&mut self, f: impl Fn(&mut Self) -> Result<T, String>, done: impl Fn(u8) -> bool) -> Result<Vec<T>, String> {
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
