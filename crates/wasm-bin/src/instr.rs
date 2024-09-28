use crate::decoder::WasmDecoder;
use crate::error::DecodingError;
use crate::types::ValType;

#[derive(Debug, PartialEq, Eq, Clone)]
pub struct Expr(pub Vec<Instr>);

#[derive(Debug, PartialEq, Eq, Clone)]
pub struct MemArg {
    pub align: u32,
    pub offset: u32,
}

#[derive(Debug, PartialEq, Eq, Clone)]
pub enum BlockType {
    Void,
    ValType(ValType),
    NewType(u64),
}

#[derive(Debug, PartialEq, Eq, Clone)]
pub enum Instr {
    Unreachable,
    Nop,
    Block(BlockType, Vec<Instr>),
    Loop(BlockType, Vec<Instr>),
    IfElse(BlockType, Vec<Instr>, Option<Vec<Instr>>),
    Branch(u32),
    BranchIf(u32),
    BranchTable(Vec<u32>, u32),
    Return,
    Call(u32),
    CallIndirect(u32, u32),
    Drop,
    Select,
    LocalGet(u32),
    LocalSet(u32),
    LocalTee(u32),
    GlobalGet(u32),
    GlobalSet(u32),

    MemorySize,
    MemoryGrow,

    I32Const(i32),
    I64Const(i64),

    I32Eqz,
    I32Eq,
    I32Ne,
    I32LtS,
    I32LtU,
    I32GtS,
    I32GtU,
    I32LeS,
    I32LeU,
    I32GeS,
    I32GeU,

    I64Eqz,
    I64Eq,
    I64Ne,
    I64LtS,
    I64LtU,
    I64GtS,
    I64GtU,
    I64LeS,
    I64LeU,
    I64GeS,
    I64GeU,

    F32Eq,
    F32Ne,
    F32Lt,
    F32Gt,
    F32Le,
    F32Ge,

    F64Eq,
    F64Ne,
    F64Lt,
    F64Gt,
    F64Le,
    F64Ge,

    I32Clz,
    I32Ctz,
    I32Popcnt,
    I32Add,
    I32Sub,
    I32Mul,
    I32DivS,
    I32DivU,
    I32RemS,
    I32RemU,
    I32And,
    I32Or,
    I32Xor,
    I32Shl,
    I32ShrS,
    I32ShrU,
    I32Rotl,
    I32Rotr,

    I64Clz,
    I64Ctz,
    I64Popcnt,
    I64Add,
    I64Sub,
    I64Mul,
    I64DivS,
    I64DivU,
    I64RemS,
    I64RemU,
    I64And,
    I64Or,
    I64Xor,
    I64Shl,
    I64ShrS,
    I64ShrU,
    I64Rotl,
    I64Rotr,

    I32WrapI64,
    I64ExtendI32U,

    I32Load(MemArg),
    I64Load(MemArg),
    F32Load(MemArg),
    F64Load(MemArg),
    I32Load8S(MemArg),
    I32Load8U(MemArg),
    I32Load16S(MemArg),
    I32Load16U(MemArg),
    I64Load8S(MemArg),
    I64Load8U(MemArg),
    I64Load16S(MemArg),
    I64Load16U(MemArg),
    I64Load32S(MemArg),
    I64Load32U(MemArg),
    I32Store(MemArg),
    I64Store(MemArg),
    F32Store(MemArg),
    F64Store(MemArg),
    I32Store8(MemArg),
    I32Store16(MemArg),
    I64Store8(MemArg),
    I64Store16(MemArg),
    I64Store32(MemArg),

    MemoryInit(u32),
    MemoryDrop(u32),
    MemoryCopy,
    MemoryFill,
}

impl<'a> WasmDecoder<'a> {
    pub fn read_expr(&mut self) -> Result<Expr, DecodingError> {
        let mut instructions = Vec::new();
        while self.peek_byte() != 0x0B {
            instructions.push(self.read_instr()?);
        }
        self.read_byte(); // skip the 0x0B byte (end marker)
        Ok(Expr(instructions))
    }

    fn read_memarg(&mut self) -> Result<MemArg, DecodingError> {
        let align = self.read_u32();
        let offset = self.read_u32();
        Ok(MemArg { align, offset })
    }

    fn read_blocktype(&mut self) -> Result<BlockType, DecodingError> {
        if self.peek_byte() == 0x40 {
            self.read_byte(); // consume the byte
            return Ok(BlockType::Void);
        }
        self.attempt(|bytes| bytes.read_val_type())
            .map(BlockType::ValType)
            .or_else(|_| {
                let x = self.read_i64();
                println!("x: {}", x);
                if x >= 0 {
                    Ok(BlockType::NewType(x as u64))
                } else {
                    Err("blocktype must be positive".into())
                }
            })
    }

    pub fn read_instr(&mut self) -> Result<Instr, DecodingError> {
        let opcode = self.read_byte();
        let instr = match opcode {
            0x00 => Instr::Unreachable,
            0x01 => Instr::Nop,
            0x02 => {
                let bt = self.read_blocktype()?;
                let ins = self.read_until(|bytes| bytes.read_instr(), |b| b == 0x0B)?;
                self.discard_byte(0x0B)?;
                Instr::Block(bt, ins)
            }
            0x03 => {
                let bt = self.read_blocktype()?;
                let ins = self.read_until(|bytes| bytes.read_instr(), |b| b == 0x0B)?;
                self.discard_byte(0x0B)?;
                Instr::Loop(bt, ins)
            }
            0x04 => {
                let bt = self.read_blocktype()?;
                let ins =
                    self.read_until(|bytes| bytes.read_instr(), |b| b == 0x05 || b == 0x0B)?;
                match self.read_byte() {
                    0x05 => {
                        let ins2 = self.read_until(|bytes| bytes.read_instr(), |b| b == 0x0B)?;
                        self.discard_byte(0x0B)?;
                        Instr::IfElse(bt, ins, Some(ins2))
                    }
                    0x08 => Instr::IfElse(bt, ins, None),
                    b => Err(format!("invalid if-else separator byte: {}", b))?,
                }
            }
            0x0C => Instr::Branch(self.read_u32()),
            0x0D => Instr::BranchIf(self.read_u32()),
            0x0E => Instr::BranchTable(
                self.read_vec(|bytes| Ok(bytes.read_u32()))?,
                self.read_u32(),
            ),
            0x0F => Instr::Return,
            0x10 => Instr::Call(self.read_u32()),
            0x11 => Instr::CallIndirect(self.read_u32(), self.read_u32()),

            0x1A => Instr::Drop,
            0x1B => Instr::Select,

            0x20 => Instr::LocalGet(self.read_u32()),
            0x21 => Instr::LocalSet(self.read_u32()),
            0x22 => Instr::LocalTee(self.read_u32()),
            0x23 => Instr::GlobalGet(self.read_u32()),
            0x24 => Instr::GlobalSet(self.read_u32()),

            0x28 => Instr::I32Load(self.read_memarg()?),
            0x29 => Instr::I64Load(self.read_memarg()?),
            0x2A => Instr::F32Load(self.read_memarg()?),
            0x2B => Instr::F64Load(self.read_memarg()?),
            0x2C => Instr::I32Load8S(self.read_memarg()?),
            0x2D => Instr::I32Load8U(self.read_memarg()?),
            0x2E => Instr::I32Load16S(self.read_memarg()?),
            0x2F => Instr::I32Load16U(self.read_memarg()?),
            0x30 => Instr::I64Load8S(self.read_memarg()?),
            0x31 => Instr::I64Load8U(self.read_memarg()?),
            0x32 => Instr::I64Load16S(self.read_memarg()?),
            0x33 => Instr::I64Load16U(self.read_memarg()?),
            0x34 => Instr::I64Load32S(self.read_memarg()?),
            0x35 => Instr::I64Load32U(self.read_memarg()?),
            0x36 => Instr::I32Store(self.read_memarg()?),
            0x37 => Instr::I64Store(self.read_memarg()?),
            0x38 => Instr::F32Store(self.read_memarg()?),
            0x39 => Instr::F64Store(self.read_memarg()?),
            0x3A => Instr::I32Store8(self.read_memarg()?),
            0x3B => Instr::I32Store16(self.read_memarg()?),
            0x3C => Instr::I64Store8(self.read_memarg()?),
            0x3D => Instr::I64Store16(self.read_memarg()?),
            0x3E => Instr::I64Store32(self.read_memarg()?),

            0x3F => {
                self.discard_byte(0x00)?;
                Instr::MemorySize
            }
            0x40 => {
                self.discard_byte(0x00)?;
                Instr::MemoryGrow
            }

            0x41 => Instr::I32Const(self.read_i32()),
            0x42 => Instr::I64Const(self.read_i64()),

            0x45 => Instr::I32Eqz,
            0x46 => Instr::I32Eq,
            0x47 => Instr::I32Ne,
            0x48 => Instr::I32LtS,
            0x49 => Instr::I32LtU,
            0x4A => Instr::I32GtS,
            0x4B => Instr::I32GtU,
            0x4C => Instr::I32LeS,
            0x4D => Instr::I32LeU,
            0x4E => Instr::I32GeS,
            0x4F => Instr::I32GeU,

            0x50 => Instr::I64Eqz,
            0x51 => Instr::I64Eq,
            0x52 => Instr::I64Ne,
            0x53 => Instr::I64LtS,
            0x54 => Instr::I64LtU,
            0x55 => Instr::I64GtS,
            0x56 => Instr::I64GtU,
            0x57 => Instr::I64LeS,
            0x58 => Instr::I64LeU,
            0x59 => Instr::I64GeS,
            0x5A => Instr::I64GeU,

            0x5B => Instr::F32Eq,
            0x5C => Instr::F32Ne,
            0x5D => Instr::F32Lt,
            0x5E => Instr::F32Gt,
            0x5F => Instr::F32Le,
            0x60 => Instr::F32Ge,

            0x61 => Instr::F64Eq,
            0x62 => Instr::F64Ne,
            0x63 => Instr::F64Lt,
            0x64 => Instr::F64Gt,
            0x65 => Instr::F64Le,
            0x66 => Instr::F64Ge,

            0x67 => Instr::I32Clz,
            0x68 => Instr::I32Ctz,
            0x69 => Instr::I32Popcnt,
            0x6A => Instr::I32Add,
            0x6B => Instr::I32Sub,
            0x6C => Instr::I32Mul,
            0x6D => Instr::I32DivS,
            0x6E => Instr::I32DivU,
            0x6F => Instr::I32RemS,
            0x70 => Instr::I32RemU,
            0x71 => Instr::I32And,
            0x72 => Instr::I32Or,
            0x73 => Instr::I32Xor,
            0x74 => Instr::I32Shl,
            0x75 => Instr::I32ShrS,
            0x76 => Instr::I32ShrU,
            0x77 => Instr::I32Rotl,
            0x78 => Instr::I32Rotr,

            0x79 => Instr::I64Clz,
            0x7A => Instr::I64Ctz,
            0x7B => Instr::I64Popcnt,
            0x7C => Instr::I64Add,
            0x7D => Instr::I64Sub,
            0x7E => Instr::I64Mul,
            0x7F => Instr::I64DivS,
            0x80 => Instr::I64DivU,
            0x81 => Instr::I64RemS,
            0x82 => Instr::I64RemU,
            0x83 => Instr::I64And,
            0x84 => Instr::I64Or,
            0x85 => Instr::I64Xor,
            0x86 => Instr::I64Shl,
            0x87 => Instr::I64ShrS,
            0x88 => Instr::I64ShrU,
            0x89 => Instr::I64Rotl,
            0x8A => Instr::I64Rotr,

            0xA7 => Instr::I32WrapI64,
            0xAD => Instr::I64ExtendI32U,

            0xFC => match self.read_u32() {
                8 => {
                    let x = self.read_u32();
                    self.discard_byte(0x00)?;
                    Instr::MemoryInit(x)
                }
                9 => {
                    let x = self.read_u32();
                    Instr::MemoryDrop(x)
                }
                10 => {
                    self.discard_byte(0x00)?;
                    self.discard_byte(0x00)?;
                    Instr::MemoryCopy
                }
                11 => {
                    self.discard_byte(0x00)?;
                    Instr::MemoryFill
                }
                b => Err(format!("unsupported byte after 0xFC: 0x{:x}", b))?,
            },

            // TODO: add the rest!
            _ => Err(format!("unknown opcode: 0x{:x}", opcode))?,
        };
        Ok(instr)
    }
}
