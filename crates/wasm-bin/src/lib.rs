use std::{
    iter,
    ops::{Index, IndexMut},
};

use decoder::WasmDecoder;
use instr::{BlockType, Instr, MemArg};
use section::*;
use types::{FuncType, Limits, ValType};

mod decoder;
mod error;
mod instr;
mod section;
mod types;
mod values;

pub fn decode_bytes(mut b: &[u8]) -> Result<WasmFile, String> {
    b = b
        .strip_prefix(&[0x00, 0x61, 0x73, 0x6d])
        .ok_or("missing magic bytes")?;
    b = b
        .strip_prefix(&[0x01, 0x00, 0x00, 0x00])
        .ok_or("missing version number")?;

    let mut raw_sections = Vec::new();

    let mut b = WasmDecoder::new(b);

    while !b.is_empty() {
        let section_id = b.read_byte();
        let section_size = b.read_u32() as usize;
        raw_sections.push((section_id, b.read_bytes(section_size)));
    }

    let mut wasm_file = WasmFile::empty();

    for (id, bytes) in raw_sections.iter().cloned() {
        let mut bytes = WasmDecoder::new(bytes);
        let section = Section::decode(id, &mut bytes)?;
        wasm_file.add_section(section);
    }

    Ok(wasm_file)
}

#[derive(Debug, PartialEq, Eq)]
pub struct WasmFile {
    pub custom_sections: Vec<CustomSection>,
    pub type_section: Option<TypeSection>,
    pub import_section: Option<ImportSection>,
    pub function_section: Option<FunctionSection>,
    pub table_section: Option<TableSection>,
    pub memory_section: Option<MemorySection>,
    pub global_section: Option<GlobalSection>,
    pub export_section: Option<ExportSection>,
    pub start_section: Option<StartSection>,
    pub element_section: Option<ElementSection>,
    pub code_section: Option<CodeSection>,
    pub data_section: Option<DataSection>,
    pub data_count_section: Option<DataCountSection>,
}

impl WasmFile {
    fn empty() -> Self {
        Self {
            custom_sections: Vec::new(),
            type_section: None,
            import_section: None,
            function_section: None,
            table_section: None,
            memory_section: None,
            global_section: None,
            export_section: None,
            start_section: None,
            element_section: None,
            code_section: None,
            data_section: None,
            data_count_section: None,
        }
    }

    fn add_section(&mut self, section: Section) {
        match section {
            Section::Custom(custom_section) => self.custom_sections.push(custom_section),
            Section::Type(type_section) => self.type_section = Some(type_section),
            Section::Import(import_section) => self.import_section = Some(import_section),
            Section::Function(function_section) => self.function_section = Some(function_section),
            Section::Table(table_section) => self.table_section = Some(table_section),
            Section::Memory(memory_section) => self.memory_section = Some(memory_section),
            Section::Global(global_section) => self.global_section = Some(global_section),
            Section::Export(export_section) => self.export_section = Some(export_section),
            Section::Start(start_section) => self.start_section = Some(start_section),
            Section::Element(element_section) => self.element_section = Some(element_section),
            Section::Code(code_section) => self.code_section = Some(code_section),
            Section::Data(data_section) => self.data_section = Some(data_section),
            Section::DataCount(data_count_section) => {
                self.data_count_section = Some(data_count_section)
            }
        }
    }
}

struct ExternalFunctionBinding {
    signature: FuncType,
    handler: fn(&[i32]) -> Vec<i32>,
}

pub struct WasmMemory {
    bytes: Vec<u8>,
    limits: Limits,
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
            panic!("memory read out of bounds");
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

    fn size(&self) -> u32 {
        self.bytes.len() as u32
    }

    fn try_grow(&mut self, num_bytes: u32) -> bool {
        if let Some(max) = self.limits.max() {
            if self.size() + num_bytes > max << 16 {
                return false;
            }
        }
        self.bytes.extend(iter::repeat(0).take(num_bytes as usize));
        true
    }
}

pub struct WasmInterpreter {
    wasm: WasmFile,
    imports: Vec<ExternalFunctionBinding>,
}

impl WasmInterpreter {
    pub fn new(wasm: WasmFile) -> Self {
        Self {
            wasm,
            imports: Vec::new(),
        }
    }

    pub fn create_memories(wasm: &WasmFile) -> Vec<WasmMemory> {
        let mut memories = Vec::new();
        if let Some(ref mem) = wasm.memory_section {
            for m in mem.memories.iter() {
                let limits = m.0.clone();
                memories.push(WasmMemory {
                    bytes: iter::repeat(0).take((limits.min() as usize) << 16).collect(),
                    limits,
                });
            }
        }
        if let Some(ref data) = wasm.data_section {
            for d in data.datas.iter() {
                if let DataMode::Active { memory, offset } = &d.mode {
                    if offset.0.len() != 1 {
                        panic!("expected single instr");
                    }
                    let offset = match offset.0[0].clone() {
                        Instr::I32Const(v) => v,
                        instr => panic!("unexpected instr: {:?}", instr),
                    };
                    let offset = offset as u32;
                    for (i, v) in d.init.iter().enumerate() {
                        memories[*memory as usize].write_byte(offset + i as u32, *v);
                    }
                }
            }
        }
        memories
    }

    pub fn bind_external_function(
        &mut self,
        mod_name: &str,
        name: &str,
        handler: fn(&[i32]) -> Vec<i32>,
    ) {
        let imports = self
            .wasm
            .import_section
            .clone()
            .map_or(Vec::new(), |s| s.imports);

        let Some(import) = imports
            .iter()
            .find(|import| import.mod_name == mod_name && import.name == name)
        else {
            panic!("unknown import");
        };

        let f = match import.desc {
            ImportDesc::TypeIdx(t_idx) => {
                self.wasm.type_section.clone().unwrap().functions[t_idx as usize].clone()
            }
            _ => panic!("import must be for a function"),
        };

        self.imports.push(ExternalFunctionBinding {
            signature: f,
            handler,
        });
    }

    pub fn execute(
        &mut self,
        function_name: &str,
        parameters: Vec<&str>,
        memories: &mut [WasmMemory],
    ) -> String {
        let types_section = self.wasm.type_section.clone().unwrap_or(TypeSection {
            functions: Vec::new(),
        });

        let functions_section = self
            .wasm
            .function_section
            .clone()
            .unwrap_or(FunctionSection {
                type_ids: Vec::new(),
            });

        let ExportSection { exports } = self.wasm.export_section.clone().unwrap();
        let ExportDesc::Func(exported_function_idx) = exports
            .iter()
            .find(|e| e.name == function_name)
            .unwrap()
            .desc
        else {
            panic!("not a function");
        };

        let function = types_section.functions[exported_function_idx as usize].clone();

        let param_types = function.params.0.clone();
        if param_types.len() != parameters.len() {
            panic!(
                "expected {} parameters, but got {}",
                param_types.len(),
                parameters.len()
            );
        }

        let param_values: Vec<i32> = param_types
            .iter()
            .zip(parameters.iter())
            .map(|(t, s)| {
                if *t != ValType::Num(types::NumType::I32) {
                    panic!("only i32 parameters are supported at this point");
                }
                s.parse::<i32>().unwrap()
            })
            .collect();

        let return_types = function.returns.0.clone();

        let code_idx = functions_section
            .type_ids
            .iter()
            .position(|&type_idx| type_idx == exported_function_idx)
            .unwrap();
        let Code {
            func: (locals, body),
            size: _,
        } = self.wasm.code_section.clone().unwrap().codes[code_idx].clone();
        let res = self.run_code(&locals, &body.0, param_values, return_types.len(), memories);

        res.into_iter()
            .map(|n| n.to_string())
            .collect::<Vec<_>>()
            .join(", ")
    }

    fn run_code(
        &self,
        locals: &[Locals],
        body: &[Instr],
        parameters: Vec<i32>,
        num_returns_values: usize,
        memories: &mut [WasmMemory],
    ) -> Vec<i32> {
        let mut frame = StackFrame::new();
        frame.push_all(parameters);
        frame.push_all(
            locals
                .iter()
                .flat_map(|l| iter::repeat(l.t.clone()).take(l.n as usize))
                .map(|_| 0),
        );

        for op in body {
            if let Some(l_idx) = frame.run_instruction(op, self, memories, 0) {
                if l_idx != 0 {
                    panic!("cannot branch out of function, expected 0, got {}", l_idx);
                }
                break;
            }
        }

        frame.split_off(frame.len() - num_returns_values)
    }
}

struct StackFrame {
    frame: Vec<i32>,
}

impl StackFrame {
    fn new() -> Self {
        Self { frame: Vec::new() }
    }

    fn push(&mut self, value: i32) {
        self.frame.push(value);
    }

    fn push_all(&mut self, values: impl IntoIterator<Item = i32>) {
        for p in values {
            self.frame.push(p);
        }
    }

    fn pop(&mut self) -> Option<i32> {
        self.frame.pop()
    }

    fn pop_many(&mut self, count: usize) -> Vec<i32> {
        self.split_off(self.len() - count)
    }

    fn top(&self) -> Option<i32> {
        self.frame.last().cloned()
    }

    fn split_off(&mut self, at: usize) -> Vec<i32> {
        self.frame.split_off(at)
    }

    fn len(&self) -> usize {
        self.frame.len()
    }

    fn run_instruction(
        &mut self,
        op: &Instr,
        context: &WasmInterpreter,
        memories: &mut [WasmMemory],
        depth: u32
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
            Instr::I32Const(val) => {
                self.push(*val);
            }
            Instr::I32Load(MemArg { align, offset }) => {
                if *align > 2 {
                    panic!("alignment may not exceed 2, got {}", align);
                }
                let i = self.pop().unwrap();
                let ea = i as i64 + *offset as i64;
                if ea & ((1 << *align) - 1) != 0 {
                    eprintln!(
                        "WARNING: unaligned memory access: i32.load, align: {}, address: {}",
                        align, ea
                    );
                }
                let b = memories[0].read_bytes_fixed::<4>(ea as u32);
                self.push(i32::from_le_bytes(b));
            }
            Instr::I32Store(MemArg { align, offset }) => {
                if *align > 2 {
                    panic!("alignment may not exceed 2, got {}", align);
                }
                let c = self.pop().unwrap();
                let i = self.pop().unwrap();
                let ea = i as i64 + *offset as i64;
                if ea & ((1 << *align) - 1) != 0 {
                    eprintln!(
                        "WARNING: unaligned memory access: i32.store, align: {}, address: {}",
                        align, ea
                    );
                }
                memories[0].write_bytes_fixed::<4>(ea as u32, c.to_le_bytes());
            }
            Instr::I32Load8U(MemArg { align, offset }) => {
                if *align != 0 {
                    unimplemented!();
                }
                let i = self.pop().unwrap();
                let ea = i as i64 + *offset as i64;
                let b = memories[0].read_byte(ea as u32);
                self.push(b as i32);
            }
            Instr::I32Add => {
                let c2 = self.pop().unwrap();
                let c1 = self.pop().unwrap();
                self.push(c1 + c2);
            }
            Instr::I32Sub => {
                let c2 = self.pop().unwrap();
                let c1 = self.pop().unwrap();
                self.push(c1 - c2);
            }
            Instr::I32Mul => {
                let c2 = self.pop().unwrap();
                let c1 = self.pop().unwrap();
                self.push(c1 * c2);
            }
            Instr::I32Eqz => {
                let c1 = self.pop().unwrap() as u32;
                let c = if c1 == 0 { 1 } else { 0 };
                self.push(c);
            }
            Instr::I32Eq => {
                let c2 = self.pop().unwrap() as u32;
                let c1 = self.pop().unwrap() as u32;
                let c = if c1 == c2 { 1 } else { 0 };
                self.push(c);
            }
            Instr::I32Ne => {
                let c2 = self.pop().unwrap() as u32;
                let c1 = self.pop().unwrap() as u32;
                let c = if c1 != c2 { 1 } else { 0 };
                self.push(c);
            }
            Instr::I32GtU => {
                let c2 = self.pop().unwrap() as u32;
                let c1 = self.pop().unwrap() as u32;
                let c = if c1 > c2 { 1 } else { 0 };
                self.push(c);
            }
            Instr::I32GeU => {
                let c2 = self.pop().unwrap() as u32;
                let c1 = self.pop().unwrap() as u32;
                let c = if c1 >= c2 { 1 } else { 0 };
                self.push(c);
            }
            Instr::I32LtU => {
                let c2 = self.pop().unwrap() as u32;
                let c1 = self.pop().unwrap() as u32;
                let c = if c1 < c2 { 1 } else { 0 };
                self.push(c);
            }
            Instr::I32LeU => {
                let c2 = self.pop().unwrap() as u32;
                let c1 = self.pop().unwrap() as u32;
                let c = if c1 <= c2 { 1 } else { 0 };
                self.push(c);
            }
            Instr::I32And => {
                let c2 = self.pop().unwrap();
                let c1 = self.pop().unwrap();
                let c = c1 & c2;
                self.push(c);
            }
            Instr::I32Or => {
                let c2 = self.pop().unwrap();
                let c1 = self.pop().unwrap();
                let c = c1 | c2;
                self.push(c);
            }
            Instr::I32Xor => {
                let c2 = self.pop().unwrap();
                let c1 = self.pop().unwrap();
                let c = c1 ^ c2;
                self.push(c);
            }
            Instr::I32ShrU => {
                let c2 = self.pop().unwrap() as u32;
                let c1 = self.pop().unwrap() as u32;
                let c = c1 >> c2;
                self.push(c as i32);
            }
            Instr::I32Shl => {
                let c2 = self.pop().unwrap();
                let c1 = self.pop().unwrap();
                let c = c1 << c2;
                self.push(c);
            }
            Instr::Branch(l_idx) => {
                return Some(*l_idx);
            }
            Instr::BranchIf(l_idx) => {
                let c = self.pop().unwrap();
                if c != 0 {
                    return Some(*l_idx);
                }
            }
            Instr::Return => {
                return Some(depth);
            }
            Instr::Drop => {
                self.pop().unwrap();
            }
            Instr::Select => {
                let c = self.pop().unwrap();
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
                    if let Some(l_idx) = self.run_instruction(op, context, memories, depth + 1) {
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
                    let t_idx = context.wasm.function_section.as_ref().unwrap().type_ids[f_idx] as usize;
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
                    let returns =
                        context.run_code(locals, &expr.0, params, func.returns.0.len(), memories);
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
            Instr::MemoryGrow => {
                let sz = (memories[0].bytes.len() / PAGE_SIZE as usize) as u32;
                let n = self.pop().unwrap() as u32;
                if memories[0].try_grow(n * PAGE_SIZE) {
                    self.push(sz as i32);
                } else {
                    self.push(-1);
                }
            }
            op => todo!("instr {:?} not handled yet in interpreter", op),
        }
        None
    }
}

const PAGE_SIZE: u32 = 1 << 16;

impl Index<u32> for StackFrame {
    type Output = i32;

    fn index(&self, index: u32) -> &Self::Output {
        &self.frame[index as usize]
    }
}

impl IndexMut<u32> for StackFrame {
    fn index_mut(&mut self, index: u32) -> &mut Self::Output {
        &mut self.frame[index as usize]
    }
}
