use std::{
    fmt::Display,
    ops::{Index, IndexMut},
};

use crate::wasm::instr::{
    BlockType, FBinOp, FRelOp, FUnOp, FloatType, IBinOp, IRelOp, IShape, ITestOp, IUnOp, Instr,
    IntType, MemArg, Signedness, VIBinOp, VIMinMaxOp, VIRelOp, VVUnOp,
};

use super::{
    error::{ErrorReason, InterpreterError, StackError},
    ExternalFunctionBinding, Ref, Store, WasmInterpreter,
};

const PAGE_SIZE: u32 = 1 << 16;

#[derive(Debug, PartialEq, Clone, Copy)]
pub enum Value {
    I32(i32),
    I64(i64),
    F32(f32),
    F64(f64),
    V128(i128),
}

impl Value {
    fn bool_to_i32(b: bool) -> Value {
        Value::I32(if b { 1 } else { 0 })
    }

    fn type_name(&self) -> &'static str {
        match self {
            Value::I32(_) => "i32",
            Value::I64(_) => "i64",
            Value::F32(_) => "f32",
            Value::F64(_) => "f64",
            Value::V128(_) => "v128",
        }
    }

    pub fn as_i32(self) -> Result<i32, StackError> {
        if let Value::I32(v) = self {
            Ok(v)
        } else {
            Err(StackError::WrongValueType {
                actual: self.type_name(),
                expected: "i32",
            })
        }
    }

    pub fn as_i64(self) -> Result<i64, StackError> {
        if let Value::I64(v) = self {
            Ok(v)
        } else {
            Err(StackError::WrongValueType {
                actual: self.type_name(),
                expected: "i64",
            })
        }
    }

    pub fn as_f32(self) -> Result<f32, StackError> {
        if let Value::F32(v) = self {
            Ok(v)
        } else {
            Err(StackError::WrongValueType {
                actual: self.type_name(),
                expected: "f32",
            })
        }
    }

    pub fn as_f64(self) -> Result<f64, StackError> {
        if let Value::F64(v) = self {
            Ok(v)
        } else {
            Err(StackError::WrongValueType {
                actual: self.type_name(),
                expected: "f64",
            })
        }
    }

    pub fn as_v128(self) -> Result<i128, StackError> {
        if let Value::V128(v) = self {
            Ok(v)
        } else {
            Err(StackError::WrongValueType {
                actual: self.type_name(),
                expected: "v128",
            })
        }
    }
}

impl Display for Value {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            Value::I32(v) => write!(f, "{}", v),
            Value::I64(v) => write!(f, "{}", v),
            Value::F32(v) => write!(f, "{}", v),
            Value::F64(v) => write!(f, "{}", v),
            Value::V128(v) => write!(f, "{}", v),
        }
    }
}

pub struct StackFrame {
    frame: Vec<Value>,
}

impl StackFrame {
    pub fn new() -> Self {
        Self { frame: Vec::new() }
    }

    pub fn push(&mut self, value: Value) {
        self.frame.push(value);
    }

    pub fn push_all(&mut self, values: impl IntoIterator<Item = Value>) {
        for p in values {
            self.frame.push(p);
        }
    }

    pub fn pop(&mut self) -> Result<Value, StackError> {
        self.frame.pop().ok_or(StackError::TooFewValues {
            actual: 0,
            needed: 1,
        })
    }

    pub fn pop_many(&mut self, count: usize) -> Result<Vec<Value>, StackError> {
        if count > self.len() {
            return Err(StackError::TooFewValues {
                actual: self.len(),
                needed: count,
            });
        }
        Ok(self.frame.split_off(self.len() - count))
    }

    pub fn top(&self) -> Result<Value, StackError> {
        self.frame.last().cloned().ok_or(StackError::TooFewValues {
            actual: 0,
            needed: 1,
        })
    }

    pub fn split_off(&mut self, at: usize) -> Result<Vec<Value>, StackError> {
        if at > self.len() {
            return Err(StackError::TooFewValues {
                actual: self.len(),
                needed: at,
            });
        }
        Ok(self.frame.split_off(at))
    }

    pub fn len(&self) -> usize {
        self.frame.len()
    }
}

impl Index<u32> for StackFrame {
    type Output = Value;

    fn index(&self, index: u32) -> &Self::Output {
        &self.frame[index as usize]
    }
}

impl IndexMut<u32> for StackFrame {
    fn index_mut(&mut self, index: u32) -> &mut Self::Output {
        &mut self.frame[index as usize]
    }
}

impl StackFrame {
    fn run_unop_i32_s(&mut self, op: impl FnOnce(i32) -> Value) -> Result<(), InterpreterError> {
        let c = self.pop()?.as_i32()?;
        self.push(op(c));
        Ok(())
    }

    fn run_unop_i64_s(&mut self, op: impl FnOnce(i64) -> Value) -> Result<(), InterpreterError> {
        let c = self.pop()?.as_i64()?;
        self.push(op(c));
        Ok(())
    }

    fn run_unop_f32(&mut self, op: impl FnOnce(f32) -> Value) -> Result<(), InterpreterError> {
        let c = self.pop()?.as_f32()?;
        self.push(op(c));
        Ok(())
    }

    fn run_unop_f64(&mut self, op: impl FnOnce(f64) -> Value) -> Result<(), InterpreterError> {
        let c = self.pop()?.as_f64()?;
        self.push(op(c));
        Ok(())
    }

    fn run_unop_v128(&mut self, op: impl FnOnce(i128) -> Value) -> Result<(), InterpreterError> {
        let c = self.pop()?.as_v128()?;
        self.push(op(c));
        Ok(())
    }

    fn run_binop_i32_s(
        &mut self,
        op: impl FnOnce(i32, i32) -> Value,
    ) -> Result<(), InterpreterError> {
        let c2 = self.pop()?.as_i32()?;
        let c1 = self.pop()?.as_i32()?;
        self.push(op(c1, c2));
        Ok(())
    }

    fn run_binop_i64_s(
        &mut self,
        op: impl FnOnce(i64, i64) -> Value,
    ) -> Result<(), InterpreterError> {
        let c2 = self.pop()?.as_i64()?;
        let c1 = self.pop()?.as_i64()?;
        self.push(op(c1, c2));
        Ok(())
    }

    fn run_binop_i32_u(
        &mut self,
        op: impl FnOnce(u32, u32) -> Value,
    ) -> Result<(), InterpreterError> {
        let c2 = self.pop()?.as_i32()? as u32;
        let c1 = self.pop()?.as_i32()? as u32;
        self.push(op(c1, c2));
        Ok(())
    }

    fn run_binop_i64_u(
        &mut self,
        op: impl FnOnce(u64, u64) -> Value,
    ) -> Result<(), InterpreterError> {
        let c2 = self.pop()?.as_i64()? as u64;
        let c1 = self.pop()?.as_i64()? as u64;
        self.push(op(c1, c2));
        Ok(())
    }

    fn run_binop_f32(
        &mut self,
        op: impl FnOnce(f32, f32) -> Value,
    ) -> Result<(), InterpreterError> {
        let c2 = self.pop()?.as_f32()?;
        let c1 = self.pop()?.as_f32()?;
        self.push(op(c1, c2));
        Ok(())
    }

    fn run_binop_f64(
        &mut self,
        op: impl FnOnce(f64, f64) -> Value,
    ) -> Result<(), InterpreterError> {
        let c2 = self.pop()?.as_f64()?;
        let c1 = self.pop()?.as_f64()?;
        self.push(op(c1, c2));
        Ok(())
    }

    fn run_binop_v128_i32x4(
        &mut self,
        op: impl Fn(i32, i32) -> i32,
    ) -> Result<(), InterpreterError> {
        let c2 = self.pop()?.as_v128()?;
        let c1 = self.pop()?.as_v128()?;

        let c2 = c2.to_le_bytes();
        let c1 = c1.to_le_bytes();

        let mut c: [u8; 16] = [0; 16];
        for i in 0..4 {
            let idx = i * 4;
            let n2 = i32::from_le_bytes(<[u8; 4]>::try_from(&c2[idx..idx + 4]).unwrap());
            let n1 = i32::from_le_bytes(<[u8; 4]>::try_from(&c1[idx..idx + 4]).unwrap());

            let n = op(n1, n2);

            c[idx..idx + 4].copy_from_slice(&n.to_le_bytes());
        }
        let c = i128::from_le_bytes(c);

        self.push(Value::V128(c));
        Ok(())
    }
}

impl StackFrame {
    pub fn run_instruction(
        &mut self,
        op: &Instr,
        context: &WasmInterpreter,
        store: &mut Store,
        depth: u32,
    ) -> Result<Option<u32>, InterpreterError> {
        let memories = store.memories.as_mut_slice();
        let globals = store.globals.as_mut_slice();
        let tables = store.tables.as_mut_slice();

        match op {
            Instr::LocalGet(idx) => self.push(self[idx.0]),
            Instr::LocalSet(idx) => self[idx.0] = self.pop()?,
            Instr::LocalTee(idx) => self[idx.0] = self.top()?,
            Instr::GlobalGet(idx) => {
                let global = &globals[idx.0 as usize];
                self.push(global.value);
            }
            Instr::GlobalSet(idx) => {
                let global = &mut globals[idx.0 as usize];
                if !global.mutable {
                    panic!("may not set value of immutable global");
                }
                let value = self.pop()?;
                global.value = value;
            }
            Instr::I32Const(val) => self.push(Value::I32(*val as i32)),
            Instr::I64Const(val) => self.push(Value::I64(*val as i64)),
            Instr::F32Const(val) => self.push(Value::F32(*val)),
            Instr::F64Const(val) => self.push(Value::F64(*val)),
            Instr::V128Const(val) => self.push(Value::V128(*val)),
            Instr::ILoad(int_type, MemArg { align, offset }) => match int_type {
                IntType::I32 => {
                    if *align > 2 {
                        panic!("alignment may not exceed 2, got {}", align);
                    }
                    let i = self.pop()?.as_i32()?;
                    let ea = i as i64 + *offset as i64;
                    if ea & ((1 << *align) - 1) != 0 {
                        eprintln!(
                            "WARNING: unaligned memory access: i32.load, align: {}, address: {}",
                            align, ea
                        );
                    }
                    let b = memories[0].read_bytes_fixed::<4>(ea as u32);
                    self.push(Value::I32(i32::from_le_bytes(b)));
                }
                IntType::I64 => {
                    if *align > 3 {
                        panic!("alignment may not exceed 3, got {}", align);
                    }
                    let i = self.pop()?.as_i32()?;
                    let ea = i as i64 + *offset as i64;
                    if ea & ((1 << *align) - 1) != 0 {
                        eprintln!(
                            "WARNING: unaligned memory access: i64.load, align: {}, address: {}",
                            align, ea
                        );
                    }
                    let b = memories[0].read_bytes_fixed::<8>(ea as u32);
                    self.push(Value::I64(i64::from_le_bytes(b)));
                }
            },
            Instr::FLoad(float_type, MemArg { align, offset }) => match float_type {
                FloatType::F32 => {
                    if *align > 2 {
                        panic!("alignment may not exceed 2, got {}", align);
                    }
                    let i = self.pop()?.as_i32()?;
                    let ea = i as i64 + *offset as i64;
                    if ea & ((1 << *align) - 1) != 0 {
                        eprintln!(
                            "WARNING: unaligned memory access: f32.load, align: {}, address: {}",
                            align, ea
                        );
                    }
                    let b = memories[0].read_bytes_fixed::<4>(ea as u32);
                    self.push(Value::F32(f32::from_le_bytes(b)));
                }
                FloatType::F64 => {
                    if *align > 3 {
                        panic!("alignment may not exceed 3, got {}", align);
                    }
                    let i = self.pop()?.as_i32()?;
                    let ea = i as i64 + *offset as i64;
                    if ea & ((1 << *align) - 1) != 0 {
                        eprintln!(
                            "WARNING: unaligned memory access: f64.load, align: {}, address: {}",
                            align, ea
                        );
                    }
                    let b = memories[0].read_bytes_fixed::<8>(ea as u32);
                    self.push(Value::F64(f64::from_le_bytes(b)));
                }
            },
            Instr::ILoad8(int_type, MemArg { align, offset }, signedness) => match int_type {
                IntType::I32 => match signedness {
                    Signedness::S => {
                        if *align != 0 {
                            unimplemented!();
                        }
                        let i = self.pop()?.as_i32()?;
                        let ea = i as i64 + *offset as i64;
                        let b = memories[0].read_byte(ea as u32) as i8;
                        self.push(Value::I32(b as i32));
                    }
                    Signedness::U => {
                        if *align != 0 {
                            unimplemented!();
                        }
                        let i = self.pop()?.as_i32()?;
                        let ea = i as i64 + *offset as i64;
                        let b = memories[0].read_byte(ea as u32);
                        self.push(Value::I32(b as i32));
                    }
                },
                IntType::I64 => todo!(),
            },
            Instr::IStore(int_type, MemArg { align, offset }) => match int_type {
                IntType::I32 => {
                    if *align > 2 {
                        panic!("alignment may not exceed 2, got {}", align);
                    }
                    let c = self.pop()?.as_i32()?;
                    let i = self.pop()?.as_i32()?;
                    let ea = i as i64 + *offset as i64;
                    if ea & ((1 << *align) - 1) != 0 {
                        eprintln!(
                            "WARNING: unaligned memory access: i32.store, align: {}, address: {}",
                            align, ea
                        );
                    }
                    memories[0].write_bytes_fixed::<4>(ea as u32, c.to_le_bytes());
                }
                IntType::I64 => {
                    if *align > 3 {
                        panic!("alignment may not exceed 3, got {}", align);
                    }
                    let c = self.pop()?.as_i64()?;
                    let i = self.pop()?.as_i32()?;
                    let ea = i as i64 + *offset as i64;
                    if ea & ((1 << *align) - 1) != 0 {
                        eprintln!(
                            "WARNING: unaligned memory access: i64.store, align: {}, address: {}",
                            align, ea
                        );
                    }
                    memories[0].write_bytes_fixed::<8>(ea as u32, c.to_le_bytes());
                }
            },
            Instr::IStore8(int_type, MemArg { align, offset }) => match int_type {
                IntType::I32 => {
                    if *align > 2 {
                        panic!("alignment may not exceed 2, got {}", align);
                    }
                    let c = (self.pop()?.as_i32()? & 0xff) as u8;
                    let i = self.pop()?.as_i32()?;
                    let ea = i as i64 + *offset as i64;
                    if ea & ((1 << *align) - 1) != 0 {
                        eprintln!(
                            "WARNING: unaligned memory access: i32.store8, align: {}, address: {}",
                            align, ea
                        );
                    }
                    memories[0].write_byte(ea as u32, c);
                }
                IntType::I64 => todo!(),
            },
            Instr::IStore16(int_type, MemArg { align, offset }) => match int_type {
                IntType::I32 => {
                    if *align > 2 {
                        panic!("alignment may not exceed 2, got {}", align);
                    }
                    let c = (self.pop()?.as_i32()? & 0xffff) as u16;
                    let i = self.pop()?.as_i32()?;
                    let ea = i as i64 + *offset as i64;
                    if ea & ((1 << *align) - 1) != 0 {
                        eprintln!(
                            "WARNING: unaligned memory access: i32.store16, align: {}, address: {}",
                            align, ea
                        );
                    }
                    memories[0].write_bytes_fixed::<2>(ea as u32, c.to_le_bytes());
                }
                IntType::I64 => todo!(),
            },
            Instr::IUnOp(int_type, op) => match int_type {
                IntType::I32 => match op {
                    IUnOp::Clz => {
                        self.run_unop_i32_s(|c1| Value::I32(c1.leading_zeros() as i32))?
                    }
                    IUnOp::Ctz => {
                        self.run_unop_i32_s(|c1| Value::I32(c1.trailing_zeros() as i32))?
                    }
                    IUnOp::PopCnt => todo!(),
                },
                IntType::I64 => todo!(),
            },
            Instr::FUnOp(float_type, op) => match float_type {
                FloatType::F32 => match op {
                    FUnOp::Abs => self.run_unop_f32(|c1| Value::F32(c1.abs()))?,
                    FUnOp::Neg => self.run_unop_f32(|c1| Value::F32(-c1))?,
                    _ => todo!(),
                },
                FloatType::F64 => match op {
                    FUnOp::Abs => self.run_unop_f64(|c1| Value::F64(c1.abs()))?,
                    FUnOp::Neg => self.run_unop_f64(|c1| Value::F64(-c1))?,
                    _ => todo!(),
                },
            },
            Instr::IBinOp(int_type, op) => match int_type {
                IntType::I32 => match op {
                    IBinOp::Add => {
                        self.run_binop_i32_s(|c1, c2| Value::I32(c1.wrapping_add(c2)))?
                    }
                    IBinOp::Sub => {
                        self.run_binop_i32_s(|c1, c2| Value::I32(c1.wrapping_sub(c2)))?
                    }
                    IBinOp::Mul => {
                        self.run_binop_i32_s(|c1, c2| Value::I32(c1.wrapping_mul(c2)))?
                    }
                    IBinOp::Div(_) => todo!(),
                    IBinOp::Rem(_) => todo!(),
                    IBinOp::And => self.run_binop_i32_s(|c1, c2| Value::I32(c1 & c2))?,
                    IBinOp::Or => self.run_binop_i32_s(|c1, c2| Value::I32(c1 | c2))?,
                    IBinOp::Xor => self.run_binop_i32_s(|c1, c2| Value::I32(c1 ^ c2))?,
                    IBinOp::Shl => self.run_binop_i32_s(|c1, c2| Value::I32(c1 << (c2 & 31)))?,
                    IBinOp::Shr(s) => match s {
                        Signedness::S => todo!(),
                        Signedness::U => {
                            self.run_binop_i32_u(|c1, c2| Value::I32((c1 >> (c2 & 31)) as i32))?
                        }
                    },
                    IBinOp::Rotl => {
                        self.run_binop_i32_s(|c1, c2| Value::I32(c1.rotate_left(c2 as u32 & 31)))?
                    }
                    IBinOp::Rotr => todo!(),
                },
                IntType::I64 => match op {
                    IBinOp::Add => {
                        self.run_binop_i64_s(|c1, c2| Value::I64(c1.wrapping_add(c2)))?
                    }
                    IBinOp::Sub => {
                        self.run_binop_i64_s(|c1, c2| Value::I64(c1.wrapping_sub(c2)))?
                    }
                    IBinOp::Mul => {
                        self.run_binop_i64_s(|c1, c2| Value::I64(c1.wrapping_mul(c2)))?
                    }
                    IBinOp::Div(_) => todo!(),
                    IBinOp::Rem(_) => todo!(),
                    IBinOp::And => self.run_binop_i64_s(|c1, c2| Value::I64(c1 & c2))?,
                    IBinOp::Or => self.run_binop_i64_s(|c1, c2| Value::I64(c1 | c2))?,
                    IBinOp::Xor => self.run_binop_i64_s(|c1, c2| Value::I64(c1 ^ c2))?,
                    IBinOp::Shl => self.run_binop_i64_s(|c1, c2| Value::I64(c1 << (c2 & 63)))?,
                    IBinOp::Shr(s) => match s {
                        Signedness::S => todo!(),
                        Signedness::U => {
                            self.run_binop_i64_u(|c1, c2| Value::I64((c1 >> (c2 & 63)) as i64))?
                        }
                    },
                    IBinOp::Rotl => todo!(),
                    IBinOp::Rotr => todo!(),
                },
            },
            Instr::FBinOp(float_type, op) => match float_type {
                FloatType::F32 => match op {
                    FBinOp::Add => self.run_binop_f32(|c1, c2| Value::F32(c1 + c2))?,
                    FBinOp::Sub => self.run_binop_f32(|c1, c2| Value::F32(c1 - c2))?,
                    FBinOp::Mul => self.run_binop_f32(|c1, c2| Value::F32(c1 * c2))?,
                    FBinOp::Div => self.run_binop_f32(|c1, c2| Value::F32(c1 / c2))?,
                    _ => todo!(),
                },
                FloatType::F64 => match op {
                    FBinOp::Add => self.run_binop_f64(|c1, c2| Value::F64(c1 + c2))?,
                    FBinOp::Sub => self.run_binop_f64(|c1, c2| Value::F64(c1 - c2))?,
                    FBinOp::Mul => self.run_binop_f64(|c1, c2| Value::F64(c1 * c2))?,
                    FBinOp::Div => self.run_binop_f64(|c1, c2| Value::F64(c1 / c2))?,
                    _ => todo!(),
                },
            },
            Instr::ITestOp(int_type, op) => match int_type {
                IntType::I32 => match op {
                    ITestOp::Eqz => self.run_unop_i32_s(|c1| Value::bool_to_i32(c1 == 0))?,
                },
                IntType::I64 => match op {
                    ITestOp::Eqz => todo!(),
                },
            },
            Instr::IRelOp(int_type, op) => match int_type {
                IntType::I32 => match op {
                    IRelOp::Eq => self.run_binop_i32_s(|c1, c2| Value::bool_to_i32(c1 == c2))?,
                    IRelOp::Ne => self.run_binop_i32_s(|c1, c2| Value::bool_to_i32(c1 != c2))?,
                    IRelOp::Gt(s) => match s {
                        Signedness::S => {
                            self.run_binop_i32_s(|c1, c2| Value::bool_to_i32(c1 > c2))?
                        }
                        Signedness::U => {
                            self.run_binop_i32_u(|c1, c2| Value::bool_to_i32(c1 > c2))?
                        }
                    },
                    IRelOp::Ge(s) => match s {
                        Signedness::S => {
                            self.run_binop_i32_s(|c1, c2| Value::bool_to_i32(c1 >= c2))?
                        }
                        Signedness::U => {
                            self.run_binop_i32_u(|c1, c2| Value::bool_to_i32(c1 >= c2))?
                        }
                    },
                    IRelOp::Lt(s) => match s {
                        Signedness::S => {
                            self.run_binop_i32_s(|c1, c2| Value::bool_to_i32(c1 < c2))?
                        }
                        Signedness::U => {
                            self.run_binop_i32_u(|c1, c2| Value::bool_to_i32(c1 < c2))?
                        }
                    },
                    IRelOp::Le(s) => match s {
                        Signedness::S => {
                            self.run_binop_i32_s(|c1, c2| Value::bool_to_i32(c1 <= c2))?
                        }
                        Signedness::U => {
                            self.run_binop_i32_u(|c1, c2| Value::bool_to_i32(c1 <= c2))?
                        }
                    },
                },
                IntType::I64 => match op {
                    IRelOp::Eq => todo!(),
                    IRelOp::Ne => todo!(),
                    _ => todo!(),
                },
            },
            Instr::FRelOp(float_type, op) => match float_type {
                FloatType::F32 => match op {
                    FRelOp::Eq => todo!(),
                    FRelOp::Ne => self.run_binop_f32(|c1, c2| Value::bool_to_i32(c1 != c2))?,
                    FRelOp::Gt => self.run_binop_f32(|c1, c2| Value::bool_to_i32(c1 > c2))?,
                    FRelOp::Ge => self.run_binop_f32(|c1, c2| Value::bool_to_i32(c1 >= c2))?,
                    FRelOp::Lt => self.run_binop_f32(|c1, c2| Value::bool_to_i32(c1 < c2))?,
                    FRelOp::Le => self.run_binop_f32(|c1, c2| Value::bool_to_i32(c1 <= c2))?,
                },
                FloatType::F64 => match op {
                    FRelOp::Eq => todo!(),
                    FRelOp::Ne => self.run_binop_f64(|c1, c2| Value::bool_to_i32(c1 != c2))?,
                    FRelOp::Gt => self.run_binop_f64(|c1, c2| Value::bool_to_i32(c1 > c2))?,
                    FRelOp::Ge => self.run_binop_f64(|c1, c2| Value::bool_to_i32(c1 >= c2))?,
                    FRelOp::Lt => self.run_binop_f64(|c1, c2| Value::bool_to_i32(c1 < c2))?,
                    FRelOp::Le => self.run_binop_f64(|c1, c2| Value::bool_to_i32(c1 <= c2))?,
                },
            },
            Instr::I32Extend8S => self.run_unop_i32_s(|c1| Value::I32(c1 as i8 as i32))?,
            Instr::I64ExtendI32(s) => match s {
                Signedness::S => todo!(),
                Signedness::U => self.run_unop_i32_s(|c1| Value::I64(c1 as u32 as i64))?,
            },
            Instr::I32WrapI64 => self.run_unop_i64_s(|c1| Value::I32(c1 as i32))?,
            Instr::Trunc(int_type, float_type, s) => match int_type {
                IntType::I32 => match float_type {
                    FloatType::F32 => todo!(),
                    FloatType::F64 => match s {
                        Signedness::S => self.run_unop_f64(|c1| {
                            let c = c1.trunc() as i64;
                            assert!(c >= i32::MIN as i64, "I32TruncF64S: value is too low");
                            assert!(c <= i32::MAX as i64, "I32TruncF64S: value is too high");
                            Value::I32(c as i32)
                        })?,
                        Signedness::U => todo!(),
                    },
                },
                IntType::I64 => todo!(),
            },
            Instr::FConvertI(float_type, int_type, s) => match float_type {
                FloatType::F32 => todo!(),
                FloatType::F64 => match int_type {
                    IntType::I32 => match s {
                        Signedness::S => self.run_unop_i32_s(|c1| Value::F64(c1 as f64))?,
                        Signedness::U => todo!(),
                    },
                    IntType::I64 => todo!(),
                },
            },
            Instr::IReinterpretF(int_type, float_type) => match int_type {
                IntType::I32 => match float_type {
                    FloatType::F32 => self.run_unop_f32(|c1| Value::I32(c1.to_bits() as i32))?,
                    FloatType::F64 => todo!(),
                },
                IntType::I64 => match float_type {
                    FloatType::F32 => todo!(),
                    FloatType::F64 => self.run_unop_f64(|c1| Value::I64(c1.to_bits() as i64))?,
                },
            },
            Instr::FReinterpretI(float_type, int_type) => match float_type {
                FloatType::F32 => match int_type {
                    IntType::I32 => {
                        self.run_unop_i32_s(|c1| Value::F32(f32::from_bits(c1 as u32)))?
                    }
                    IntType::I64 => todo!(),
                },
                FloatType::F64 => match int_type {
                    IntType::I32 => todo!(),
                    IntType::I64 => {
                        self.run_unop_i64_s(|c1| Value::F64(f64::from_bits(c1 as u64)))?
                    }
                },
            },
            Instr::I32X4ExtractLane(x) => {
                assert!(x.0 < 4);
                let c1 = self.pop()?.as_v128()?;
                let c1 = c1.to_le_bytes();

                let x = x.0 as usize;
                let c2 = <[u8; 4]>::try_from(&c1[(x * 4)..(x * 4 + 4)]).unwrap();
                let c2 = i32::from_le_bytes(c2);

                self.push(Value::I32(c2));
            }
            Instr::IReplaceLane(shape, x) => match shape {
                IShape::I32X4 => {
                    assert!(x.0 < 4);
                    let c2 = self.pop()?.as_i32()?;
                    let c1 = self.pop()?.as_v128()?;

                    let x = x.0 as usize;
                    let mut c = c1.to_le_bytes();
                    c[(x * 4)..(x * 4 + 4)].copy_from_slice(&c2.to_le_bytes());
                    let c = i128::from_le_bytes(c);

                    self.push(Value::V128(c));
                }
                _ => todo!(),
            },
            Instr::I8X16Shuffle(xs) => {
                for x in xs {
                    assert!(x.0 < 32);
                }
                let c2 = self.pop()?.as_v128()?;
                let c1 = self.pop()?.as_v128()?;

                let c2 = c2.to_le_bytes();
                let c1 = c1.to_le_bytes();

                let mut c: [u8; 16] = [0; 16];
                for i in 0..16 {
                    let x = xs[i].0 as usize;
                    if x < 16 {
                        c[i] = c1[x];
                    } else {
                        c[i] = c2[x - 16];
                    }
                }
                let c = i128::from_le_bytes(c);

                self.push(Value::V128(c));
            }
            Instr::VIBinOp(shape, op) => match shape {
                IShape::I32X4 => match op {
                    VIBinOp::Add => self.run_binop_v128_i32x4(|n1, n2| n1.wrapping_add(n2))?,
                    VIBinOp::Sub => self.run_binop_v128_i32x4(|n1, n2| n1.wrapping_sub(n2))?,
                },
                _ => todo!(),
            },
            Instr::I32X4Mul => self.run_binop_v128_i32x4(|n1, n2| n1.wrapping_mul(n2))?,
            Instr::I32X4VIRelOp(op) => match op {
                VIRelOp::Eq => todo!(),
                _ => todo!(),
            },
            Instr::I32X4VIMinMaxOp(op) => match op {
                VIMinMaxOp::Min(s) => match s {
                    Signedness::S => todo!(),
                    Signedness::U => {
                        self.run_binop_v128_i32x4(|n1, n2| (n1 as u32).min(n2 as u32) as i32)?
                    }
                },
                VIMinMaxOp::Max(_) => todo!(),
            },
            Instr::VVUnOp(op) => match op {
                VVUnOp::Not => self.run_unop_v128(|c1| Value::V128(!c1))?,
            },
            Instr::Br(l_idx) => {
                return Ok(Some(l_idx.0));
            }
            Instr::BrIf(l_idx) => {
                let c = self.pop()?.as_i32()?;
                if c != 0 {
                    return Ok(Some(l_idx.0));
                }
            }
            Instr::BrTable(labels, default_label) => {
                let case = self.pop()?.as_i32()?;
                let label = if case < 0 || case as usize >= labels.len() {
                    *default_label
                } else {
                    labels[case as usize]
                };
                return Ok(Some(label.0));
            }
            Instr::Return => {
                return Ok(Some(depth));
            }
            Instr::Drop => {
                self.pop()?;
            }
            Instr::Select(choices) => {
                if choices.is_empty() {
                    let c = self.pop()?.as_i32()?;
                    let val2 = self.pop()?;
                    let val1 = self.pop()?;
                    if c != 0 {
                        self.push(val1);
                    } else {
                        self.push(val2);
                    }
                } else {
                    todo!()
                }
            }
            Instr::Block(block_type, instructions) => {
                let n = match block_type {
                    BlockType::Val(None) => 0,
                    BlockType::Val(Some(t)) => unimplemented!("{:?}", t),
                    BlockType::Type(t) => unimplemented!("{}", t.0),
                };

                let frame_size = self.frame.len();
                for (i, op) in instructions.iter().enumerate() {
                    if let Some(l_idx) = self
                        .run_instruction(op, context, store, depth + 1)
                        .map_err(|e| {
                            e.wrap(ErrorReason::FailedInstruction {
                                step: i,
                                instr: op.clone(),
                            })
                        })?
                    {
                        if l_idx != 0 {
                            return Ok(Some(l_idx - 1));
                        }
                        let result = self.pop_many(n)?;
                        self.split_off(frame_size)?;
                        self.push_all(result);
                        return Ok(None);
                    }
                }
                let result = self.pop_many(n)?;
                self.split_off(frame_size)?;
                self.push_all(result);
            }
            Instr::Loop(block_type, instructions) => {
                let n = match block_type {
                    BlockType::Val(None) => 0,
                    BlockType::Val(Some(t)) => unimplemented!("{:?}", t),
                    BlockType::Type(t) => unimplemented!("{}", t.0),
                };

                let frame_size = self.frame.len();
                loop {
                    let mut should_loop = false;
                    for (i, op) in instructions.iter().enumerate() {
                        if let Some(l_idx) = self
                            .run_instruction(op, context, store, depth + 1)
                            .map_err(|e| {
                                e.wrap(ErrorReason::FailedInstruction {
                                    step: i,
                                    instr: op.clone(),
                                })
                            })?
                        {
                            if l_idx != 0 {
                                return Ok(Some(l_idx - 1));
                            }
                            let result = self.pop_many(n)?;
                            self.split_off(frame_size)?;
                            self.push_all(result);
                            should_loop = true;
                            break;
                        }
                    }
                    if !should_loop {
                        break;
                    }
                }
            }
            Instr::Call(f_idx) => {
                if (f_idx.0 as usize) < context.imports.len() {
                    let ExternalFunctionBinding {
                        signature: ref t,
                        handler: f,
                    } = &context.imports[f_idx.0 as usize];

                    let num_params = t.params.len();
                    let num_returns = t.returns.len();

                    let params = self.split_off(self.len() - num_params)?;
                    let returns = f(&params);

                    if returns.len() != num_returns {
                        panic!(
                            "expected {} returns values, but got {}",
                            num_returns,
                            returns.len()
                        );
                    }
                    self.push_all(returns);
                } else {
                    let f_idx = f_idx.0;
                    let f = context.wasm.funcs.get(f_idx as usize).unwrap();
                    let func = context
                        .wasm
                        .types
                        .get(f.type_idx.0 as usize - context.wasm.imports.len())
                        .expect("no functions exist");

                    let params = self.pop_many(func.params.len())?;
                    let returns = context
                        .run_code(&f.locals, &f.body, params, func.returns.len(), store)
                        .map_err(|e| e.wrap(ErrorReason::FailedFunction { f_idx, name: None }))?;
                    if returns.len() != func.returns.len() {
                        panic!(
                            "wrong number of return values, expected: {}, got: {}",
                            func.returns.len(),
                            returns.len()
                        );
                    }
                    self.push_all(returns);
                }
            }
            Instr::CallIndirect(x, _y) => {
                let tab = &tables[x.0 as usize];

                let i = self.pop()?.as_i32()?;
                match tab.elems[i as usize] {
                    Ref::Func(a) => {
                        let f = context.wasm.funcs.get(a as usize).unwrap();
                        let t_idx = f.type_idx;
                        let func = context
                            .wasm
                            .types
                            .get(t_idx.0 as usize - context.wasm.imports.len())
                            .unwrap();

                        let params = self.pop_many(func.params.len())?;
                        let returns = context
                            .run_code(&f.locals, &f.body, params, func.returns.len(), store)
                            .map_err(|e| {
                                e.wrap(ErrorReason::FailedFunction {
                                    f_idx: a,
                                    name: None,
                                })
                            })?;
                        if returns.len() != func.returns.len() {
                            panic!(
                                "wrong number of return values, expected: {}, got: {}",
                                func.returns.len(),
                                returns.len()
                            );
                        }
                        self.push_all(returns);
                    } // r => panic!("call_indirect must act on a func ref, got {:?}", r),
                }
            }
            Instr::MemoryGrow => {
                let sz = (memories[0].bytes.len() / PAGE_SIZE as usize) as u32;
                let n = self.pop()?.as_i32()? as u32;
                if memories[0].try_grow(n * PAGE_SIZE) {
                    self.push(Value::I32(sz as i32));
                } else {
                    self.push(Value::I32(-1));
                }
            }
            Instr::Unreachable => {
                panic!("entered unreachable code");
            }
            op => {
                return Err(InterpreterError::new(ErrorReason::UnsupportedInstruction {
                    instr: op.clone(),
                }))
            }
        }
        Ok(None)
    }
}
