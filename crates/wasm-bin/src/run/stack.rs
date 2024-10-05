use std::{
    fmt::Display,
    ops::{Index, IndexMut},
};

use crate::instr::{BlockType, Instr, MemArg};

use super::{ExternalFunctionBinding, Ref, WasmGlobal, WasmInterpreter, WasmMemory, WasmTable};

const PAGE_SIZE: u32 = 1 << 16;

#[derive(Debug, PartialEq, Eq, Clone, Copy)]
pub enum Value {
    I32(i32),
    I64(i64),
}

impl Value {
    pub fn as_i32(self) -> Option<i32> {
        if let Value::I32(v) = self {
            Some(v)
        } else {
            None
        }
    }

    pub fn as_i64(self) -> Option<i64> {
        if let Value::I64(v) = self {
            Some(v)
        } else {
            None
        }
    }
}

impl Display for Value {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            Value::I32(v) => write!(f, "{}", v),
            Value::I64(v) => write!(f, "{}", v),
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

    pub fn pop(&mut self) -> Option<Value> {
        self.frame.pop()
    }

    pub fn pop_many(&mut self, count: usize) -> Vec<Value> {
        self.split_off(self.len() - count)
    }

    pub fn top(&self) -> Option<Value> {
        self.frame.last().cloned()
    }

    pub fn split_off(&mut self, at: usize) -> Vec<Value> {
        self.frame.split_off(at)
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
    pub fn run_instruction(
        &mut self,
        op: &Instr,
        context: &WasmInterpreter,
        memories: &mut [WasmMemory],
        globals: &mut [WasmGlobal],
        tables: &mut [WasmTable],
        depth: u32,
    ) -> Option<u32> {
        match op {
            Instr::LocalGet(idx) => {
                let val = self[*idx];
                self.push(val);
            }
            Instr::LocalSet(idx) => {
                let val = self.pop().unwrap();
                self[*idx] = val;
            }
            Instr::LocalTee(idx) => {
                let val = self.top().unwrap();
                self[*idx] = val;
            }
            Instr::GlobalGet(idx) => {
                let global = &globals[*idx as usize];
                self.push(global.value);
            }
            Instr::GlobalSet(idx) => {
                let global = &mut globals[*idx as usize];
                if !global.mutable {
                    panic!("may not set value of immutable global");
                }
                let value = self.pop().unwrap();
                global.value = value;
            }
            Instr::I32Const(val) => {
                self.push(Value::I32(*val));
            }
            Instr::I64Const(val) => {
                self.push(Value::I64(*val));
            }
            Instr::I32Load(MemArg { align, offset }) => {
                if *align > 2 {
                    panic!("alignment may not exceed 2, got {}", align);
                }
                let i = self.pop().unwrap().as_i32().unwrap();
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
            Instr::I32Load8U(MemArg { align, offset }) => {
                if *align != 0 {
                    unimplemented!();
                }
                let i = self.pop().unwrap().as_i32().unwrap();
                let ea = i as i64 + *offset as i64;
                let b = memories[0].read_byte(ea as u32);
                self.push(Value::I32(b as i32));
            }
            Instr::I32Load8S(MemArg { align, offset }) => {
                if *align != 0 {
                    unimplemented!();
                }
                let i = self.pop().unwrap().as_i32().unwrap();
                let ea = i as i64 + *offset as i64;
                let b = memories[0].read_byte(ea as u32) as i8;
                self.push(Value::I32(b as i32));
            }
            Instr::I64Load(MemArg { align, offset }) => {
                if *align > 3 {
                    panic!("alignment may not exceed 3, got {}", align);
                }
                let i = self.pop().unwrap().as_i32().unwrap();
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
            Instr::I32Store(MemArg { align, offset }) => {
                if *align > 2 {
                    panic!("alignment may not exceed 2, got {}", align);
                }
                let c = self.pop().unwrap().as_i32().unwrap();
                let i = self.pop().unwrap().as_i32().unwrap();
                let ea = i as i64 + *offset as i64;
                if ea & ((1 << *align) - 1) != 0 {
                    eprintln!(
                        "WARNING: unaligned memory access: i32.store, align: {}, address: {}",
                        align, ea
                    );
                }
                memories[0].write_bytes_fixed::<4>(ea as u32, c.to_le_bytes());
            }
            Instr::I32Store8(MemArg { align, offset }) => {
                if *align > 2 {
                    panic!("alignment may not exceed 2, got {}", align);
                }
                let c = (self.pop().unwrap().as_i32().unwrap() & 0xff) as u8;
                let i = self.pop().unwrap().as_i32().unwrap();
                let ea = i as i64 + *offset as i64;
                if ea & ((1 << *align) - 1) != 0 {
                    eprintln!(
                        "WARNING: unaligned memory access: i32.store8, align: {}, address: {}",
                        align, ea
                    );
                }
                memories[0].write_byte(ea as u32, c);
            }
            Instr::I32Store16(MemArg { align, offset }) => {
                if *align > 2 {
                    panic!("alignment may not exceed 2, got {}", align);
                }
                let c = (self.pop().unwrap().as_i32().unwrap() & 0xffff) as u16;
                let i = self.pop().unwrap().as_i32().unwrap();
                let ea = i as i64 + *offset as i64;
                if ea & ((1 << *align) - 1) != 0 {
                    eprintln!(
                        "WARNING: unaligned memory access: i32.store16, align: {}, address: {}",
                        align, ea
                    );
                }
                memories[0].write_bytes_fixed::<2>(ea as u32, c.to_le_bytes());
            }
            Instr::I64Store(MemArg { align, offset }) => {
                if *align > 3 {
                    panic!("alignment may not exceed 3, got {}", align);
                }
                let c = self.pop().unwrap().as_i64().unwrap();
                let i = self.pop().unwrap().as_i32().unwrap();
                let ea = i as i64 + *offset as i64;
                if ea & ((1 << *align) - 1) != 0 {
                    eprintln!(
                        "WARNING: unaligned memory access: i64.store, align: {}, address: {}",
                        align, ea
                    );
                }
                memories[0].write_bytes_fixed::<8>(ea as u32, c.to_le_bytes());
            }
            Instr::I32Add => {
                let c2 = self.pop().unwrap().as_i32().unwrap();
                let c1 = self.pop().unwrap().as_i32().unwrap();
                self.push(Value::I32(c1.wrapping_add(c2)));
            }
            Instr::I64Add => {
                let c2 = self.pop().unwrap().as_i64().unwrap();
                let c1 = self.pop().unwrap().as_i64().unwrap();
                self.push(Value::I64(c1.wrapping_add(c2)));
            }
            Instr::I32Sub => {
                let c2 = self.pop().unwrap().as_i32().unwrap();
                let c1 = self.pop().unwrap().as_i32().unwrap();
                self.push(Value::I32(c1.wrapping_sub(c2)));
            }
            Instr::I64Sub => {
                let c2 = self.pop().unwrap().as_i64().unwrap();
                let c1 = self.pop().unwrap().as_i64().unwrap();
                self.push(Value::I64(c1.wrapping_sub(c2)));
            }
            Instr::I32Mul => {
                let c2 = self.pop().unwrap().as_i32().unwrap();
                let c1 = self.pop().unwrap().as_i32().unwrap();
                self.push(Value::I32(c1.wrapping_mul(c2)));
            }
            Instr::I64Mul => {
                let c2 = self.pop().unwrap().as_i64().unwrap();
                let c1 = self.pop().unwrap().as_i64().unwrap();
                self.push(Value::I64(c1.wrapping_mul(c2)));
            }
            Instr::I32Eqz => {
                let c1 = self.pop().unwrap().as_i32().unwrap() as u32;
                let c = if c1 == 0 { 1 } else { 0 };
                self.push(Value::I32(c));
            }
            Instr::I32Eq => {
                let c2 = self.pop().unwrap().as_i32().unwrap() as u32;
                let c1 = self.pop().unwrap().as_i32().unwrap() as u32;
                let c = if c1 == c2 { 1 } else { 0 };
                self.push(Value::I32(c));
            }
            Instr::I32Ne => {
                let c2 = self.pop().unwrap().as_i32().unwrap() as u32;
                let c1 = self.pop().unwrap().as_i32().unwrap() as u32;
                let c = if c1 != c2 { 1 } else { 0 };
                self.push(Value::I32(c));
            }
            Instr::I32GtU => {
                let c2 = self.pop().unwrap().as_i32().unwrap() as u32;
                let c1 = self.pop().unwrap().as_i32().unwrap() as u32;
                let c = if c1 > c2 { 1 } else { 0 };
                self.push(Value::I32(c));
            }
            Instr::I32GtS => {
                let c2 = self.pop().unwrap().as_i32().unwrap();
                let c1 = self.pop().unwrap().as_i32().unwrap();
                let c = if c1 > c2 { 1 } else { 0 };
                self.push(Value::I32(c));
            }
            Instr::I32GeU => {
                let c2 = self.pop().unwrap().as_i32().unwrap() as u32;
                let c1 = self.pop().unwrap().as_i32().unwrap() as u32;
                let c = if c1 >= c2 { 1 } else { 0 };
                self.push(Value::I32(c));
            }
            Instr::I32LtU => {
                let c2 = self.pop().unwrap().as_i32().unwrap() as u32;
                let c1 = self.pop().unwrap().as_i32().unwrap() as u32;
                let c = if c1 < c2 { 1 } else { 0 };
                self.push(Value::I32(c));
            }
            Instr::I32LtS => {
                let c2 = self.pop().unwrap().as_i32().unwrap();
                let c1 = self.pop().unwrap().as_i32().unwrap();
                let c = if c1 < c2 { 1 } else { 0 };
                self.push(Value::I32(c));
            }
            Instr::I32LeU => {
                let c2 = self.pop().unwrap().as_i32().unwrap() as u32;
                let c1 = self.pop().unwrap().as_i32().unwrap() as u32;
                let c = if c1 <= c2 { 1 } else { 0 };
                self.push(Value::I32(c));
            }
            Instr::I32LeS => {
                let c2 = self.pop().unwrap().as_i32().unwrap();
                let c1 = self.pop().unwrap().as_i32().unwrap();
                let c = if c1 <= c2 { 1 } else { 0 };
                self.push(Value::I32(c));
            }
            Instr::I32And => {
                let c2 = self.pop().unwrap().as_i32().unwrap();
                let c1 = self.pop().unwrap().as_i32().unwrap();
                let c = c1 & c2;
                self.push(Value::I32(c));
            }
            Instr::I64And => {
                let c2 = self.pop().unwrap().as_i64().unwrap();
                let c1 = self.pop().unwrap().as_i64().unwrap();
                let c = c1 & c2;
                self.push(Value::I64(c));
            }
            Instr::I32Or => {
                let c2 = self.pop().unwrap().as_i32().unwrap();
                let c1 = self.pop().unwrap().as_i32().unwrap();
                let c = c1 | c2;
                self.push(Value::I32(c));
            }
            Instr::I64Or => {
                let c2 = self.pop().unwrap().as_i64().unwrap();
                let c1 = self.pop().unwrap().as_i64().unwrap();
                let c = c1 | c2;
                self.push(Value::I64(c));
            }
            Instr::I32Xor => {
                let c2 = self.pop().unwrap().as_i32().unwrap();
                let c1 = self.pop().unwrap().as_i32().unwrap();
                let c = c1 ^ c2;
                self.push(Value::I32(c));
            }
            Instr::I64Xor => {
                let c2 = self.pop().unwrap().as_i64().unwrap();
                let c1 = self.pop().unwrap().as_i64().unwrap();
                let c = c1 ^ c2;
                self.push(Value::I64(c));
            }
            Instr::I32ShrU => {
                let c2 = self.pop().unwrap().as_i32().unwrap() as u32;
                let c1 = self.pop().unwrap().as_i32().unwrap() as u32;
                let c = c1 >> (c2 & 31);
                self.push(Value::I32(c as i32));
            }
            Instr::I64ShrU => {
                let c2 = self.pop().unwrap().as_i64().unwrap() as u64;
                let c1 = self.pop().unwrap().as_i64().unwrap() as u64;
                let c = c1 >> (c2 & 63);
                self.push(Value::I64(c as i64));
            }
            Instr::I32Shl => {
                let c2 = self.pop().unwrap().as_i32().unwrap();
                let c1 = self.pop().unwrap().as_i32().unwrap();
                let c = c1 << (c2 & 31);
                self.push(Value::I32(c));
            }
            Instr::I64Shl => {
                let c2 = self.pop().unwrap().as_i64().unwrap();
                let c1 = self.pop().unwrap().as_i64().unwrap();
                let c = c1 << (c2 & 63);
                self.push(Value::I64(c));
            }
            Instr::I32Rotl => {
                let c2 = self.pop().unwrap().as_i32().unwrap();
                let c1 = self.pop().unwrap().as_i32().unwrap();
                let c = c1.rotate_left(c2 as u32 & 31);
                self.push(Value::I32(c));
            }
            Instr::I32Clz => {
                let c1 = self.pop().unwrap().as_i32().unwrap();
                let c = c1.leading_zeros() as i32;
                self.push(Value::I32(c));
            }
            Instr::I32Ctz => {
                let c1 = self.pop().unwrap().as_i32().unwrap();
                let c = c1.trailing_zeros() as i32;
                self.push(Value::I32(c));
            }
            Instr::I32Extend8S => {
                let c1 = self.pop().unwrap().as_i32().unwrap() as i8;
                let c2 = c1 as i32;
                self.push(Value::I32(c2));
            }
            Instr::I64ExtendI32U => {
                let c1 = self.pop().unwrap().as_i32().unwrap() as u32;
                let c2 = c1 as i64;
                self.push(Value::I64(c2));
            }
            Instr::I32WrapI64 => {
                let c1 = self.pop().unwrap().as_i64().unwrap();
                let c2 = c1 as i32;
                self.push(Value::I32(c2));
            }
            Instr::Branch(l_idx) => {
                return Some(*l_idx);
            }
            Instr::BranchIf(l_idx) => {
                let c = self.pop().unwrap().as_i32().unwrap();
                if c != 0 {
                    return Some(*l_idx);
                }
            }
            Instr::BranchTable(labels, default_label) => {
                let case = self.pop().unwrap().as_i32().unwrap();
                let label = if case < 0 || case as usize >= labels.len() {
                    *default_label
                } else {
                    labels[case as usize]
                };
                return Some(label);
            }
            Instr::Return => {
                return Some(depth);
            }
            Instr::Drop => {
                self.pop().unwrap();
            }
            Instr::Select => {
                let c = self.pop().unwrap().as_i32().unwrap();
                let val2 = self.pop().unwrap();
                let val1 = self.pop().unwrap();
                if c != 0 {
                    self.push(val1);
                } else {
                    self.push(val2);
                }
            }
            Instr::Block(block_type, instructions) => {
                let n = match block_type {
                    BlockType::Void => 0,
                    BlockType::ValType(t) => unimplemented!("{:?}", t),
                    BlockType::NewType(t) => unimplemented!("{}", t),
                };

                let frame_size = self.frame.len();
                for op in instructions.iter() {
                    if let Some(l_idx) =
                        self.run_instruction(op, context, memories, globals, tables, depth + 1)
                    {
                        if l_idx != 0 {
                            return Some(l_idx - 1);
                        }
                        let result = self.pop_many(n);
                        self.split_off(frame_size);
                        self.push_all(result);
                        return None;
                    }
                }
                let result = self.pop_many(n);
                self.split_off(frame_size);
                self.push_all(result);
            }
            Instr::Loop(block_type, instructions) => {
                let n = match block_type {
                    BlockType::Void => 0,
                    BlockType::ValType(t) => unimplemented!("{:?}", t),
                    BlockType::NewType(t) => unimplemented!("{}", t),
                };

                let frame_size = self.frame.len();
                loop {
                    let mut should_loop = false;
                    for op in instructions.iter() {
                        if let Some(l_idx) =
                            self.run_instruction(op, context, memories, globals, tables, depth + 1)
                        {
                            if l_idx != 0 {
                                return Some(l_idx - 1);
                            }
                            let result = self.pop_many(n);
                            self.split_off(frame_size);
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
                if (*f_idx as usize) < context.imports.len() {
                    let ExternalFunctionBinding {
                        signature: ref t,
                        handler: f,
                    } = &context.imports[*f_idx as usize];

                    let num_params = t.params.0.len();
                    let num_returns = t.returns.0.len();

                    let params = self.split_off(self.len() - num_params);
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
                    let f_idx = *f_idx as usize;
                    let t_idx =
                        context.wasm.function_section.as_ref().unwrap().type_ids[f_idx] as usize;
                    let func = context
                        .wasm
                        .type_section
                        .as_ref()
                        .map(|s| &s.functions[t_idx])
                        .expect("no functions exist");
                    let (locals, expr) = context
                        .wasm
                        .code_section
                        .as_ref()
                        .map(|s| &s.codes[f_idx - context.imports.len()].func)
                        .expect("no functions exist");

                    let params = self.pop_many(func.params.0.len());
                    let returns = context.run_code(
                        locals,
                        &expr.0,
                        params,
                        func.returns.0.len(),
                        memories,
                        globals,
                        tables,
                    );
                    if returns.len() != func.returns.0.len() {
                        panic!(
                            "wrong number of return values, expected: {}, got: {}",
                            func.returns.0.len(),
                            returns.len()
                        );
                    }
                    self.push_all(returns);
                }
            }
            Instr::CallIndirect(x, _y) => {
                let tab = &tables[*x as usize];

                let i = self.pop().unwrap().as_i32().unwrap();
                match tab.elems[i as usize] {
                    Ref::Null => {
                        panic!("null dereference");
                    }
                    Ref::Func(a) => {
                        let t_idx =
                            context.wasm.function_section.as_ref().unwrap().type_ids[a as usize];
                        let func =
                            &context.wasm.type_section.as_ref().unwrap().functions[t_idx as usize];
                        let (locals, expr) = &context.wasm.code_section.as_ref().unwrap().codes
                            [a as usize - context.imports.len()]
                        .func;

                        let params = self.pop_many(func.params.0.len());
                        let returns = context.run_code(
                            locals,
                            &expr.0,
                            params,
                            func.returns.0.len(),
                            memories,
                            globals,
                            tables,
                        );
                        if returns.len() != func.returns.0.len() {
                            panic!(
                                "wrong number of return values, expected: {}, got: {}",
                                func.returns.0.len(),
                                returns.len()
                            );
                        }
                        self.push_all(returns);
                    }
                    r => panic!("call_indirect must act on a func ref, got {:?}", r),
                }
            }
            Instr::MemoryGrow => {
                let sz = (memories[0].bytes.len() / PAGE_SIZE as usize) as u32;
                let n = self.pop().unwrap().as_i32().unwrap() as u32;
                if memories[0].try_grow(n * PAGE_SIZE) {
                    self.push(Value::I32(sz as i32));
                } else {
                    self.push(Value::I32(-1));
                }
            }
            Instr::Unreachable => {
                panic!("entered unreachable code");
            }
            op => todo!("instr {:?} not handled yet in interpreter", op),
        }
        None
    }
}
