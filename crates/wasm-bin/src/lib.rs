use std::{
    fmt::Display, iter, ops::{Index, IndexMut}
};

use decoder::WasmDecoder;
use instr::{BlockType, Instr, MemArg};
use section::*;
use types::{FuncType, Limits, NumType, RefType, TableType, ValType};

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
    handler: fn(&[Value]) -> Vec<Value>,
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

struct WasmGlobal {
    mutable: bool,
    value: Value,
}

struct WasmTable {
    t: TableType,
    elems: Vec<Ref>,
}

#[derive(Debug, PartialEq, Eq, Clone, Copy)]
enum Ref {
    Null,
    I32(u32),
    Func(u32),
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
                    bytes: iter::repeat(0)
                        .take((limits.min() as usize) << 16)
                        .collect(),
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
        handler: fn(&[Value]) -> Vec<Value>,
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
        let exported_function_idx = exported_function_idx - self.wasm.import_section.as_ref().map(|s| s.imports.len() as u32).unwrap_or(0);

        let function = types_section.functions
            [functions_section.type_ids[exported_function_idx as usize] as usize]
            .clone();

        let param_types = function.params.0.clone();
        if param_types.len() != parameters.len() {
            panic!(
                "expected {} parameters, but got {}",
                param_types.len(),
                parameters.len()
            );
        }

        let param_values: Vec<Value> = param_types
            .iter()
            .zip(parameters.iter())
            .map(|(t, s)| {
                if *t != ValType::Num(NumType::I32) {
                    panic!("only i32 parameters are supported at this point");
                }
                Value::I32(s.parse::<i32>().unwrap())
            })
            .collect();

        let return_types = function.returns.0.clone();

        let Code {
            func: (locals, body),
            size: _,
        } = self.wasm.code_section.clone().unwrap().codes[exported_function_idx as usize].clone();

        let mut globals: Vec<WasmGlobal> = self.wasm.global_section.clone().unwrap_or_else(|| GlobalSection { globals: vec![] }).globals.iter()
            .map(|(g, e)| {
                if e.0.len() != 1 {
                    panic!("global did not have exactly 1 instruction, which is not supported yet");
                }
                let value: Value = match &e.0[0] {
                    Instr::I32Const(v) => Value::I32(*v),
                    i => panic!("unsupported instr for global: {:?}", i),
                };
                WasmGlobal { mutable: g.mutable, value }
            }).collect();

        let tables = self.wasm.table_section.clone().unwrap_or_else(|| TableSection { tables: vec![] }).tables;

        let mut tables: Vec<WasmTable> = tables
            .iter().map(|table| {
                let TableType(t, l) = table;
                let value: Ref = match t {
                    RefType::FuncRef => Ref::Func(0),
                    t => todo!("{:?}", t),
                };
                WasmTable { t: table.clone(), elems: iter::repeat(value).take(l.min() as usize).collect() }
            }).collect();
        
        let elements = self.wasm.element_section.clone().unwrap_or_else(|| ElementSection { elements: vec![] }).elements;
        for e in elements {
            if let ElementMode::Active { table, offset } = e.mode {
                if offset.0.len() != 1 {
                    panic!("expected 1 instruction for elem offset eval, but got {} ", offset.0.len());
                }
                let offset = match &offset.0[0] {
                    Instr::I32Const(v) => *v,
                    _ => panic!("unsupported instr for active elem")
                };

                match &e.init {
                    ElementInit::Implicit(fns) => {
                        let table = &mut tables[table as usize];
                        for i in 0..fns.len() {
                            table.elems[i + offset as usize] = Ref::Func(fns[i])
                        }
                    }
                    ElementInit::Explicit(_) => todo!()
                }
            }
        }

        let res = self.run_code(&locals, &body.0, param_values, return_types.len(), memories, &mut globals, &mut tables);

        res.into_iter()
            .map(|n| n.to_string())
            .collect::<Vec<_>>()
            .join(", ")
    }

    fn run_code(
        &self,
        locals: &[Locals],
        body: &[Instr],
        parameters: Vec<Value>,
        num_returns_values: usize,
        memories: &mut [WasmMemory],
        globals: &mut [WasmGlobal],
        tables: &mut [WasmTable],
    ) -> Vec<Value> {
        let mut frame = StackFrame::new();
        frame.push_all(parameters);
        frame.push_all(
            locals
                .iter()
                .flat_map(|l| iter::repeat(l.t.clone()).take(l.n as usize))
                .map(|t| {
                    match t {
                        ValType::Num(NumType::I32) => Value::I32(0),
                        ValType::Num(NumType::I64) => Value::I64(0),
                        t => todo!("{:?}", t),
                    }
                }),
        );

        for op in body {
            if let Some(l_idx) = frame.run_instruction(op, self, memories, globals, tables, 0) {
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
    frame: Vec<Value>,
}

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

impl StackFrame {
    fn new() -> Self {
        Self { frame: Vec::new() }
    }

    fn push(&mut self, value: Value) {
        self.frame.push(value);
    }

    fn push_all(&mut self, values: impl IntoIterator<Item = Value>) {
        for p in values {
            self.frame.push(p);
        }
    }

    fn pop(&mut self) -> Option<Value> {
        self.frame.pop()
    }

    fn pop_many(&mut self, count: usize) -> Vec<Value> {
        self.split_off(self.len() - count)
    }

    fn top(&self) -> Option<Value> {
        self.frame.last().cloned()
    }

    fn split_off(&mut self, at: usize) -> Vec<Value> {
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
                    if let Some(l_idx) = self.run_instruction(op, context, memories, globals, tables, depth + 1) {
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
                        if let Some(l_idx) = self.run_instruction(op, context, memories, globals, tables, depth + 1) {
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
                    let returns =
                        context.run_code(locals, &expr.0, params, func.returns.0.len(), memories, globals, tables);
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
                        let t_idx = context.wasm.function_section.as_ref().unwrap().type_ids[a as usize];
                        let func = &context.wasm.type_section.as_ref().unwrap().functions[t_idx as usize];
                        let (locals, expr) = &context.wasm.code_section.as_ref().unwrap().codes[a as usize - context.imports.len()].func;

                        let params = self.pop_many(func.params.0.len());
                        let returns =
                            context.run_code(locals, &expr.0, params, func.returns.0.len(), memories, globals, tables);
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

const PAGE_SIZE: u32 = 1 << 16;

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
