// ---- AES implementation copied from another project ----

use std::ops::{BitXor, Deref, DerefMut};

#[derive(Debug, PartialEq, Eq, Clone, Copy)]
pub struct Word(Block<4>);

impl Deref for Word {
    type Target = Block<4>;

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

impl DerefMut for Word {
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.0
    }
}

impl BitXor for Word {
    type Output = Word;

    fn bitxor(self, rhs: Self) -> Self::Output {
        let Word([a0, a1, a2, a3]) = self;
        let Word([b0, b1, b2, b3]) = rhs;
        Word([a0 ^ b0, a1 ^ b1, a2 ^ b2, a3 ^ b3])
    }
}

pub struct AesKeyExpander {
    sbox: Sbox,
    rcon: [Word; 11],
}

impl AesKeyExpander {
    pub const fn new() -> AesKeyExpander {
        const RC: [u8; 11] = AesKeyExpander::calculate_round_constants();

        let mut rcon: [Word; 11] = [Word([0; 4]); 11];
        let mut i = 0;
        while i < 11 {
            rcon[i] = Word([RC[i], 0, 0, 0]);
            i += 1;
        }

        AesKeyExpander { sbox: SBOX, rcon }
    }

    pub fn expand_key<const K: usize, const W: usize>(
        &self,
        key: Block<K>,
        num_keys: usize,
    ) -> Vec<Block<16>> {
        let key_words: Vec<Word> = key
            .chunks_exact(4)
            .map(|bytes| Word(bytes.try_into().unwrap()))
            .collect();
        let key_array = key_words.as_slice().try_into().unwrap();

        let result = self.expand_key_using_words::<W>(key_array, num_keys);

        let mut expanded_keys: Vec<Block<16>> = Vec::with_capacity(16 * num_keys);
        for words in result.chunks(4) {
            let mut block: Block<16> = Default::default();
            for wi in 0..4 {
                for bi in 0..4 {
                    block[wi * 4 + bi] = words[wi][bi];
                }
            }
            expanded_keys.push(block);
        }

        expanded_keys
    }

    pub fn expand_key_using_words<const N: usize>(
        &self,
        key: [Word; N],
        num_keys: usize,
    ) -> Vec<Word> {
        let mut w = Vec::with_capacity(16 * num_keys);
        for i in 0..(4 * num_keys) {
            let v = if i < N {
                key[i]
            } else if i % N == 0 {
                w[i - N] ^ self.substitute_word(Self::rotate_word(w[i - 1])) ^ self.rcon[i / N]
            } else if N > 6 && i % N == 4 {
                w[i - N] ^ self.substitute_word(w[i - 1])
            } else {
                w[i - N] ^ w[i - 1]
            };

            w.push(v);
        }
        w
    }

    const fn calculate_round_constants<const L: usize>() -> [u8; L] {
        let mut result = [0; L];

        let mut n = 1;
        let mut i = 1;
        while i < L {
            result[i] = n;
            n = AesField::mul2(n);
            i += 1;
        }

        result
    }

    fn rotate_word(w: Word) -> Word {
        Word([w[1], w[2], w[3], w[0]])
    }

    fn substitute_word(&self, w: Word) -> Word {
        Word([
            self.sbox.forward[w[0] as usize],
            self.sbox.forward[w[1] as usize],
            self.sbox.forward[w[2] as usize],
            self.sbox.forward[w[3] as usize],
        ])
    }
}

impl Default for AesKeyExpander {
    fn default() -> Self {
        Self::new()
    }
}

pub struct AesField;

impl AesField {
    pub const fn mul2(n: u8) -> u8 {
        (n << 1) ^ (if n & 0x80 != 0 { 0x1b } else { 0 })
    }

    pub const fn mul3(n: u8) -> u8 {
        n ^ (n << 1) ^ (if n & 0x80 != 0 { 0x1b } else { 0 })
    }

    pub const fn div3(mut n: u8) -> u8 {
        n ^= n << 1;
        n ^= n << 2;
        n ^= n << 4;
        n ^= if n & 0x80 != 0 { 0x09 } else { 0 };
        n
    }

    pub const fn mul(mut a: u8, mut b: u8) -> u8 {
        let mut r = 0;

        let mut i = 0;
        while i < 8 {
            if (b & 1) != 0 {
                r ^= a;
            }

            let hi = (a & 0x80) != 0;
            a <<= 1;
            if hi {
                a ^= 0x1b;
            }
            b >>= 1;

            i += 1;
        }

        r
    }
}

impl IntoIterator for AesField {
    type Item = (u8, u8);

    type IntoIter = AesFieldIterator;

    fn into_iter(self) -> Self::IntoIter {
        AesFieldIterator::start()
    }
}

pub struct AesFieldIterator {
    pub p: u8,
    pub q: u8, // inverse of p
}

impl AesFieldIterator {
    pub const fn start() -> Self {
        Self { p: 1, q: 1 }
    }

    pub const fn step(&self) -> Option<((u8, u8), (u8, u8))> {
        if self.p == 0 {
            // we're back at the start of the cycle
            return None;
        }

        let mut np = AesField::mul3(self.p);
        let nq = AesField::div3(self.q);

        if np == 1 {
            np = 0; // stop loop on next call
        }

        Some(((self.p, self.q), (np, nq)))
    }
}

impl Iterator for AesFieldIterator {
    type Item = (u8, u8);

    fn next(&mut self) -> Option<Self::Item> {
        if let Some(((n, inv), (np, nq))) = self.step() {
            self.p = np;
            self.q = nq;
            Some((n, inv))
        } else {
            None
        }
    }
}

pub const SBOX: Sbox = calculate_sbox();

pub struct Sbox {
    pub forward: [u8; 256],
    pub backward: [u8; 256],
}

const fn calculate_sbox() -> Sbox {
    let mut sbox = [0; 256];
    let mut inverse = [0; 256];

    // the field contains one cycle with all elements except 0
    sbox[0] = 0x63;
    inverse[0x63] = 0;

    // note: we do manual iteration here because iterators are not const yet
    let mut it = AesFieldIterator::start();
    while let Some(((n, inv), (np, nq))) = it.step() {
        it.p = np;
        it.q = nq;
        let s = transform_affine(inv);
        sbox[n as usize] = s;
        inverse[s as usize] = n;
    }

    Sbox {
        forward: sbox,
        backward: inverse,
    }
}

const fn transform_affine(b: u8) -> u8 {
    b ^ b.rotate_left(1) ^ b.rotate_left(2) ^ b.rotate_left(3) ^ b.rotate_left(4) ^ 0x63
}

pub type Block<const N: usize> = [u8; N];

struct State(Block<16>);

trait AesStep {
    fn forward(&self, state: &mut State);
    fn backward(&self, state: &mut State);
}

struct AddKey {
    key: Block<16>,
}

impl AesStep for AddKey {
    fn forward(&self, state: &mut State) {
        for (i, b) in state.0.iter_mut().enumerate() {
            *b ^= self.key[i];
        }
    }

    fn backward(&self, state: &mut State) {
        // it's the same as forward in this case
        self.forward(state)
    }
}

struct Substitute;

impl AesStep for Substitute {
    fn forward(&self, state: &mut State) {
        for b in state.0.iter_mut() {
            *b = SBOX.forward[*b as usize];
        }
    }

    fn backward(&self, state: &mut State) {
        for b in state.0.iter_mut() {
            *b = SBOX.backward[*b as usize];
        }
    }
}

struct ShiftRows;

impl AesStep for ShiftRows {
    fn forward(&self, state: &mut State) {
        state.shift_row_one_step(1);

        state.shift_row_one_step(2);
        state.shift_row_one_step(2);

        state.shift_row_one_step(3);
        state.shift_row_one_step(3);
        state.shift_row_one_step(3);
    }

    fn backward(&self, state: &mut State) {
        state.shift_row_one_step(1);
        state.shift_row_one_step(1);
        state.shift_row_one_step(1);

        state.shift_row_one_step(2);
        state.shift_row_one_step(2);

        state.shift_row_one_step(3);
    }
}

struct MixColumns;

impl AesStep for MixColumns {
    fn forward(&self, state: &mut State) {
        for c in 0..4 {
            let i1 = c * 4;
            let i2 = c * 4 + 4;
            mix_column(&mut state.0[i1..i2]);
        }
    }

    fn backward(&self, state: &mut State) {
        for c in 0..4 {
            let i1 = c * 4;
            let i2 = c * 4 + 4;
            unmix_column(&mut state.0[i1..i2]);
        }
    }
}

impl State {
    fn shift_row_one_step(&mut self, row: usize) {
        let temp = self.0[row];
        for i in 0..3 {
            self.0[row + i * 4] = self.0[row + (i + 1) * 4];
        }
        self.0[row + 3 * 4] = temp;
    }
}

fn mix_column(col: &mut [u8]) {
    use AesField as F;

    let d0 = F::mul2(col[0]) ^ F::mul3(col[1]) ^ col[2] ^ col[3];
    let d1 = F::mul2(col[1]) ^ F::mul3(col[2]) ^ col[3] ^ col[0];
    let d2 = F::mul2(col[2]) ^ F::mul3(col[3]) ^ col[0] ^ col[1];
    let d3 = F::mul2(col[3]) ^ F::mul3(col[0]) ^ col[1] ^ col[2];

    col[0] = d0;
    col[1] = d1;
    col[2] = d2;
    col[3] = d3;
}

fn unmix_column(col: &mut [u8]) {
    use AesField as F;

    let d0 = F::mul(col[0], 14) ^ F::mul(col[1], 11) ^ F::mul(col[2], 13) ^ F::mul(col[3], 9);
    let d1 = F::mul(col[1], 14) ^ F::mul(col[2], 11) ^ F::mul(col[3], 13) ^ F::mul(col[0], 9);
    let d2 = F::mul(col[2], 14) ^ F::mul(col[3], 11) ^ F::mul(col[0], 13) ^ F::mul(col[1], 9);
    let d3 = F::mul(col[3], 14) ^ F::mul(col[0], 11) ^ F::mul(col[1], 13) ^ F::mul(col[2], 9);

    col[0] = d0;
    col[1] = d1;
    col[2] = d2;
    col[3] = d3;
}

pub struct Aes {
    keys: Vec<Block<16>>,
    rounds: usize,
}

impl Aes {
    pub fn with_128_bit_key(key: Block<16>) -> Aes {
        let expander = AesKeyExpander::new();
        let keys = expander.expand_key::<16, 4>(key, 11);

        Aes { keys, rounds: 10 }
    }
}

impl Aes {
    pub fn encrypt(&self, plaintext: Block<16>) -> Block<16> {
        let mut state = State(plaintext);

        AddKey { key: self.keys[0] }.forward(&mut state);

        for k in 1..self.rounds {
            Substitute.forward(&mut state);
            ShiftRows.forward(&mut state);
            MixColumns.forward(&mut state);
            AddKey { key: self.keys[k] }.forward(&mut state);
        }

        Substitute.forward(&mut state);
        ShiftRows.forward(&mut state);
        // Note: MixColumns should not be called here
        AddKey {
            key: self.keys[self.rounds],
        }
        .forward(&mut state);

        state.0
    }

    pub fn decrypt(&self, ciphertext: Block<16>) -> Block<16> {
        let mut state = State(ciphertext);

        AddKey {
            key: self.keys[self.rounds],
        }
        .backward(&mut state);
        // Note: MixColumns should not be called here
        ShiftRows.backward(&mut state);
        Substitute.backward(&mut state);

        for k in (1..self.rounds).rev() {
            AddKey { key: self.keys[k] }.backward(&mut state);
            MixColumns.backward(&mut state);
            ShiftRows.backward(&mut state);
            Substitute.backward(&mut state);
        }

        AddKey { key: self.keys[0] }.backward(&mut state);

        state.0
    }
}
