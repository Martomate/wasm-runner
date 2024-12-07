mod error;
pub mod instr;
pub mod section;
pub mod types;
mod values;

use error::DecodingError;
use instr::Expr;
use section::*;
use std::iter;

use crate::wasm::{
    self,
    instr::{FloatType, IntType, LaneIdx},
    DataIdx, ElemIdx, FuncIdx, GlobalIdx, LabelIdx, LocalIdx, MemIdx, Module, TableIdx, TypeIdx,
};

pub struct WasmDecoder<'a>(&'a [u8]);

impl<'a> WasmDecoder<'a> {
    pub fn new(bytes: &'a [u8]) -> Self {
        Self(bytes)
    }

    /// Runs the given function and only advances the buffer if no error occurred
    pub fn attempt<T>(
        &mut self,
        f: impl FnOnce(&mut Self) -> Result<T, DecodingError>,
    ) -> Result<T, DecodingError> {
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

    pub fn ensuring_size<T>(
        &mut self,
        expected_size: u32,
        f: impl FnOnce(&mut Self) -> Result<T, DecodingError>,
    ) -> Result<T, DecodingError> {
        let bytes = self.read_bytes(expected_size as usize);
        let mut decoder = Self(bytes);
        let res = f(&mut decoder)?;
        if !decoder.is_empty() {
            Err(format!(
                "expected {} bytes to be read, but there are {} left",
                expected_size,
                decoder.0.len()
            ))?;
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

    pub fn read_vec<T>(
        &mut self,
        f: impl Fn(&mut Self) -> Result<T, DecodingError>,
    ) -> Result<Vec<T>, DecodingError> {
        let len = self.read_u32() as usize;

        let mut items = Vec::with_capacity(len);

        for _ in 0..len {
            items.push(f(self)?);
        }

        Ok(items)
    }

    pub fn read_until<T>(
        &mut self,
        f: impl Fn(&mut Self) -> Result<T, DecodingError>,
        done: impl Fn(u8) -> bool,
    ) -> Result<Vec<T>, DecodingError> {
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

pub fn decode_bytes(mut b: &[u8]) -> Result<Module, String> {
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

    let mut wasm_file = WasmModule::empty();

    for (id, bytes) in raw_sections.iter().cloned() {
        let mut bytes = WasmDecoder::new(bytes);
        let section = Section::decode(id, &mut bytes)?;
        wasm_file.add_section(section);
    }

    Ok(wasm_file.to_new_model())
}

#[derive(Debug, PartialEq)]
pub struct WasmModule {
    custom_sections: Vec<CustomSection>,
    type_section: Option<TypeSection>,
    import_section: Option<ImportSection>,
    function_section: Option<FunctionSection>,
    pub table_section: Option<TableSection>,
    pub memory_section: Option<MemorySection>,
    pub global_section: Option<GlobalSection>,
    export_section: Option<ExportSection>,
    start_section: Option<StartSection>,
    pub element_section: Option<ElementSection>,
    code_section: Option<CodeSection>,
    pub data_section: Option<DataSection>,
    data_count_section: Option<DataCountSection>,
}

impl WasmModule {
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

    pub fn to_new_model(&self) -> crate::wasm::Module {
        wasm::Module {
            types: self
                .type_section
                .clone()
                .map(|s| s.functions)
                .unwrap_or_default(),
            funcs: self
                .function_section
                .clone()
                .map(|s| {
                    s.type_ids
                        .into_iter()
                        .enumerate()
                        .map(|(f_idx, t_idx)| {
                            let code_section = self.code_section.as_ref().unwrap();
                            let code = code_section.codes.get(f_idx).unwrap().clone();

                            let Code {
                                size: _,
                                func: (locals, Expr(body)),
                            } = code;
                            wasm::Func {
                                type_idx: wasm::TypeIdx(t_idx),
                                locals: locals
                                    .into_iter()
                                    .flat_map(|l| iter::repeat(l.t).take(l.n as usize))
                                    .collect(),
                                body: body.iter().map(map_instr).collect(),
                            }
                        })
                        .collect()
                })
                .unwrap_or_default(),
            tables: self
                .table_section
                .clone()
                .map(|s| {
                    s.tables
                        .iter()
                        .map(|a| wasm::Table {
                            table_type: a.clone(),
                        })
                        .collect()
                })
                .unwrap_or_default(),
            mems: self
                .memory_section
                .clone()
                .map(|s| {
                    s.memories
                        .iter()
                        .map(|a| wasm::Mem {
                            mem_type: a.clone(),
                        })
                        .collect()
                })
                .unwrap_or_default(),
            globals: self
                .global_section
                .clone()
                .map(|s| {
                    s.globals
                        .iter()
                        .map(|a| wasm::Global {
                            global_type: a.0.clone(),
                            init: a.1 .0.iter().map(map_instr).collect(),
                        })
                        .collect()
                })
                .unwrap_or_default(),
            elems: self
                .element_section
                .clone()
                .map(|s| {
                    s.elements
                        .into_iter()
                        .map(|a| wasm::Elem {
                            elem_type: a.t,
                            mode: match a.mode {
                                section::ElementMode::Passive => wasm::ElemMode::Passive,
                                section::ElementMode::Declarative => wasm::ElemMode::Declarative,
                                section::ElementMode::Active { table, offset } => {
                                    wasm::ElemMode::Active {
                                        table_idx: wasm::TableIdx(table),
                                        offset: offset.0.iter().map(map_instr).collect(),
                                    }
                                }
                            },
                            init: match a.init {
                                section::ElementInit::Explicit(exprs) => exprs
                                    .iter()
                                    .map(|e| e.0.iter().map(map_instr).collect())
                                    .collect(),
                                section::ElementInit::Implicit(func_indices) => func_indices
                                    .iter()
                                    .map(|f_idx| {
                                        vec![wasm::instr::Instr::FuncRef(wasm::FuncIdx(*f_idx))]
                                    })
                                    .collect(),
                            },
                        })
                        .collect()
                })
                .unwrap_or_default(),
            datas: self
                .data_section
                .clone()
                .map(|s| {
                    s.datas
                        .into_iter()
                        .map(|a| wasm::Data {
                            init: a.init,
                            mode: match a.mode {
                                DataMode::Passive => wasm::DataMode::Passive,
                                DataMode::Active { memory, offset } => wasm::DataMode::Active {
                                    memory: MemIdx(memory),
                                    offset: offset.0.iter().map(map_instr).collect(),
                                },
                            },
                        })
                        .collect()
                })
                .unwrap_or_default(),
            start: self.start_section.clone().map(|s| wasm::Start {
                func_idx: wasm::FuncIdx(s.func_idx),
            }),
            imports: self
                .import_section
                .clone()
                .map(|s| {
                    s.imports
                        .into_iter()
                        .map(|a| wasm::Import {
                            module: a.mod_name,
                            name: a.name,
                            desc: a.desc,
                        })
                        .collect()
                })
                .unwrap_or_default(),
            exports: self
                .export_section
                .clone()
                .map(|s| {
                    s.exports
                        .into_iter()
                        .map(|a| wasm::Export {
                            name: a.name,
                            desc: a.desc,
                        })
                        .collect()
                })
                .unwrap_or_default(),
        }
    }
}

fn map_blocktype(t: instr::BlockType) -> wasm::instr::BlockType {
    match t {
        instr::BlockType::ValType(t) => wasm::instr::BlockType::Val(Some(t)),
        instr::BlockType::NewType(idx) => wasm::instr::BlockType::Type(TypeIdx(idx as u32)),
        instr::BlockType::Void => wasm::instr::BlockType::Val(None),
    }
}

fn map_memarg(m: instr::MemArg) -> wasm::instr::MemArg {
    wasm::instr::MemArg {
        align: m.align,
        offset: m.offset,
    }
}

fn map_instr(instr: &instr::Instr) -> wasm::instr::Instr {
    use instr::Instr as A;
    use wasm::instr as W;
    use wasm::instr::Instr as B;

    match instr.clone() {
        A::Unreachable => B::Unreachable,
        A::Nop => B::Nop,
        A::Block(t, body) => B::Block(map_blocktype(t), body.iter().map(map_instr).collect()),
        A::Loop(t, body) => B::Loop(map_blocktype(t), body.iter().map(map_instr).collect()),
        A::IfElse(t, if_body, else_body) => B::IfElse(
            map_blocktype(t),
            if_body.iter().map(map_instr).collect(),
            else_body
                .unwrap_or_default()
                .iter()
                .map(map_instr)
                .collect(),
        ),
        A::Branch(l_idx) => B::Br(LabelIdx(l_idx)),
        A::BranchIf(l_idx) => B::BrIf(LabelIdx(l_idx)),
        A::BranchTable(labels, default_label) => B::BrTable(
            labels.iter().cloned().map(LabelIdx).collect(),
            LabelIdx(default_label),
        ),
        A::Return => B::Return,
        A::Call(f_idx) => B::Call(FuncIdx(f_idx)),
        A::CallIndirect(tab_idx, t_idx) => B::CallIndirect(TableIdx(tab_idx), TypeIdx(t_idx)),
        A::ReturnCall(_) => todo!(),
        A::ReturnCallIndirect(_, _) => todo!(),
        A::CallRef(_) => todo!(),
        A::ReturnCallRef(_) => todo!(),
        A::Drop => B::Drop,
        A::Select => B::Select(Vec::new()),
        A::SelectT(values) => B::Select(values),
        A::LocalGet(idx) => B::LocalGet(LocalIdx(idx)),
        A::LocalSet(idx) => B::LocalSet(LocalIdx(idx)),
        A::LocalTee(idx) => B::LocalTee(LocalIdx(idx)),
        A::GlobalGet(idx) => B::GlobalGet(GlobalIdx(idx)),
        A::GlobalSet(idx) => B::GlobalSet(GlobalIdx(idx)),
        A::TableGet(idx) => B::TableGet(TableIdx(idx)),
        A::TableSet(idx) => B::TableSet(TableIdx(idx)),

        A::MemorySize => B::MemorySize,
        A::MemoryGrow => B::MemoryGrow,

        A::I32Const(value) => B::I32Const(value as u32),
        A::I64Const(value) => B::I64Const(value as u64),
        A::F32Const(value) => B::F32Const(value),
        A::F64Const(value) => B::F64Const(value),

        A::I32Eqz => B::ITestOp(IntType::I32, W::ITestOp::Eqz),
        A::I32Eq => B::IRelOp(IntType::I32, W::IRelOp::Eq),
        A::I32Ne => B::IRelOp(IntType::I32, W::IRelOp::Ne),
        A::I32LtS => B::IRelOp(IntType::I32, W::IRelOp::Lt(W::Signedness::S)),
        A::I32LtU => B::IRelOp(IntType::I32, W::IRelOp::Lt(W::Signedness::U)),
        A::I32GtS => B::IRelOp(IntType::I32, W::IRelOp::Gt(W::Signedness::S)),
        A::I32GtU => B::IRelOp(IntType::I32, W::IRelOp::Gt(W::Signedness::U)),
        A::I32LeS => B::IRelOp(IntType::I32, W::IRelOp::Le(W::Signedness::S)),
        A::I32LeU => B::IRelOp(IntType::I32, W::IRelOp::Le(W::Signedness::U)),
        A::I32GeS => B::IRelOp(IntType::I32, W::IRelOp::Ge(W::Signedness::S)),
        A::I32GeU => B::IRelOp(IntType::I32, W::IRelOp::Ge(W::Signedness::U)),

        A::I64Eqz => B::ITestOp(IntType::I64, W::ITestOp::Eqz),
        A::I64Eq => B::IRelOp(IntType::I64, W::IRelOp::Eq),
        A::I64Ne => B::IRelOp(IntType::I64, W::IRelOp::Ne),
        A::I64LtS => B::IRelOp(IntType::I64, W::IRelOp::Lt(W::Signedness::S)),
        A::I64LtU => B::IRelOp(IntType::I64, W::IRelOp::Lt(W::Signedness::U)),
        A::I64GtS => B::IRelOp(IntType::I64, W::IRelOp::Gt(W::Signedness::S)),
        A::I64GtU => B::IRelOp(IntType::I64, W::IRelOp::Gt(W::Signedness::U)),
        A::I64LeS => B::IRelOp(IntType::I64, W::IRelOp::Le(W::Signedness::S)),
        A::I64LeU => B::IRelOp(IntType::I64, W::IRelOp::Le(W::Signedness::U)),
        A::I64GeS => B::IRelOp(IntType::I64, W::IRelOp::Ge(W::Signedness::S)),
        A::I64GeU => B::IRelOp(IntType::I64, W::IRelOp::Ge(W::Signedness::U)),

        A::F32Eq => B::FRelOp(FloatType::F32, W::FRelOp::Eq),
        A::F32Ne => B::FRelOp(FloatType::F32, W::FRelOp::Ne),
        A::F32Lt => B::FRelOp(FloatType::F32, W::FRelOp::Lt),
        A::F32Gt => B::FRelOp(FloatType::F32, W::FRelOp::Gt),
        A::F32Le => B::FRelOp(FloatType::F32, W::FRelOp::Le),
        A::F32Ge => B::FRelOp(FloatType::F32, W::FRelOp::Ge),

        A::F64Eq => B::FRelOp(FloatType::F64, W::FRelOp::Eq),
        A::F64Ne => B::FRelOp(FloatType::F64, W::FRelOp::Ne),
        A::F64Lt => B::FRelOp(FloatType::F64, W::FRelOp::Lt),
        A::F64Gt => B::FRelOp(FloatType::F64, W::FRelOp::Gt),
        A::F64Le => B::FRelOp(FloatType::F64, W::FRelOp::Le),
        A::F64Ge => B::FRelOp(FloatType::F64, W::FRelOp::Ge),

        A::I32Clz => B::IUnOp(IntType::I32, W::IUnOp::Clz),
        A::I32Ctz => B::IUnOp(IntType::I32, W::IUnOp::Ctz),
        A::I32Popcnt => B::IUnOp(IntType::I32, W::IUnOp::PopCnt),

        A::I32Add => B::IBinOp(IntType::I32, W::IBinOp::Add),
        A::I32Sub => B::IBinOp(IntType::I32, W::IBinOp::Sub),
        A::I32Mul => B::IBinOp(IntType::I32, W::IBinOp::Mul),
        A::I32DivS => B::IBinOp(IntType::I32, W::IBinOp::Div(W::Signedness::S)),
        A::I32DivU => B::IBinOp(IntType::I32, W::IBinOp::Div(W::Signedness::U)),
        A::I32RemS => B::IBinOp(IntType::I32, W::IBinOp::Rem(W::Signedness::S)),
        A::I32RemU => B::IBinOp(IntType::I32, W::IBinOp::Rem(W::Signedness::U)),
        A::I32And => B::IBinOp(IntType::I32, W::IBinOp::And),
        A::I32Or => B::IBinOp(IntType::I32, W::IBinOp::Or),
        A::I32Xor => B::IBinOp(IntType::I32, W::IBinOp::Xor),
        A::I32Shl => B::IBinOp(IntType::I32, W::IBinOp::Shl),
        A::I32ShrS => B::IBinOp(IntType::I32, W::IBinOp::Shr(W::Signedness::S)),
        A::I32ShrU => B::IBinOp(IntType::I32, W::IBinOp::Shr(W::Signedness::U)),
        A::I32Rotl => B::IBinOp(IntType::I32, W::IBinOp::Rotl),
        A::I32Rotr => B::IBinOp(IntType::I32, W::IBinOp::Rotr),

        A::I64Clz => B::IUnOp(IntType::I64, W::IUnOp::Clz),
        A::I64Ctz => B::IUnOp(IntType::I64, W::IUnOp::Ctz),
        A::I64Popcnt => B::IUnOp(IntType::I64, W::IUnOp::PopCnt),

        A::I64Add => B::IBinOp(IntType::I64, W::IBinOp::Add),
        A::I64Sub => B::IBinOp(IntType::I64, W::IBinOp::Sub),
        A::I64Mul => B::IBinOp(IntType::I64, W::IBinOp::Mul),
        A::I64DivS => B::IBinOp(IntType::I64, W::IBinOp::Div(W::Signedness::S)),
        A::I64DivU => B::IBinOp(IntType::I64, W::IBinOp::Div(W::Signedness::U)),
        A::I64RemS => B::IBinOp(IntType::I64, W::IBinOp::Rem(W::Signedness::S)),
        A::I64RemU => B::IBinOp(IntType::I64, W::IBinOp::Rem(W::Signedness::U)),
        A::I64And => B::IBinOp(IntType::I64, W::IBinOp::And),
        A::I64Or => B::IBinOp(IntType::I64, W::IBinOp::Or),
        A::I64Xor => B::IBinOp(IntType::I64, W::IBinOp::Xor),
        A::I64Shl => B::IBinOp(IntType::I64, W::IBinOp::Shl),
        A::I64ShrS => B::IBinOp(IntType::I64, W::IBinOp::Shr(W::Signedness::S)),
        A::I64ShrU => B::IBinOp(IntType::I64, W::IBinOp::Shr(W::Signedness::U)),
        A::I64Rotl => B::IBinOp(IntType::I64, W::IBinOp::Rotl),
        A::I64Rotr => B::IBinOp(IntType::I64, W::IBinOp::Rotr),

        A::F32Abs => B::FUnOp(FloatType::F32, W::FUnOp::Abs),
        A::F32Neg => B::FUnOp(FloatType::F32, W::FUnOp::Neg),
        A::F32Ceil => B::FUnOp(FloatType::F32, W::FUnOp::Ceil),
        A::F32Floor => B::FUnOp(FloatType::F32, W::FUnOp::Floor),
        A::F32Trunc => B::FUnOp(FloatType::F32, W::FUnOp::Trunc),
        A::F32Nearest => B::FUnOp(FloatType::F32, W::FUnOp::Nearest),
        A::F32Sqrt => B::FUnOp(FloatType::F32, W::FUnOp::Sqrt),

        A::F32Add => B::FBinOp(FloatType::F32, W::FBinOp::Add),
        A::F32Sub => B::FBinOp(FloatType::F32, W::FBinOp::Sub),
        A::F32Mul => B::FBinOp(FloatType::F32, W::FBinOp::Mul),
        A::F32Div => B::FBinOp(FloatType::F32, W::FBinOp::Div),
        A::F32Min => B::FBinOp(FloatType::F32, W::FBinOp::Min),
        A::F32Max => B::FBinOp(FloatType::F32, W::FBinOp::Max),
        A::F32Copysign => B::FBinOp(FloatType::F32, W::FBinOp::CopySign),

        A::F64Abs => B::FUnOp(FloatType::F64, W::FUnOp::Abs),
        A::F64Neg => B::FUnOp(FloatType::F64, W::FUnOp::Neg),
        A::F64Ceil => B::FUnOp(FloatType::F64, W::FUnOp::Ceil),
        A::F64Floor => B::FUnOp(FloatType::F64, W::FUnOp::Floor),
        A::F64Trunc => B::FUnOp(FloatType::F64, W::FUnOp::Trunc),
        A::F64Nearest => B::FUnOp(FloatType::F64, W::FUnOp::Nearest),
        A::F64Sqrt => B::FUnOp(FloatType::F64, W::FUnOp::Sqrt),

        A::F64Add => B::FBinOp(FloatType::F64, W::FBinOp::Add),
        A::F64Sub => B::FBinOp(FloatType::F64, W::FBinOp::Sub),
        A::F64Mul => B::FBinOp(FloatType::F64, W::FBinOp::Mul),
        A::F64Div => B::FBinOp(FloatType::F64, W::FBinOp::Div),
        A::F64Min => B::FBinOp(FloatType::F64, W::FBinOp::Min),
        A::F64Max => B::FBinOp(FloatType::F64, W::FBinOp::Max),
        A::F64Copysign => B::FBinOp(FloatType::F64, W::FBinOp::CopySign),

        A::I32WrapI64 => B::I32WrapI64,
        A::I32TruncF32S => B::Trunc(IntType::I32, FloatType::F32, W::Signedness::S),
        A::I32TruncF32U => B::Trunc(IntType::I32, FloatType::F32, W::Signedness::U),
        A::I32TruncF64S => B::Trunc(IntType::I32, FloatType::F64, W::Signedness::S),
        A::I32TruncF64U => B::Trunc(IntType::I32, FloatType::F64, W::Signedness::U),
        A::I64ExtendI32S => B::I64ExtendI32(W::Signedness::S),
        A::I64ExtendI32U => B::I64ExtendI32(W::Signedness::U),
        A::I64TruncF32S => B::Trunc(IntType::I64, FloatType::F32, W::Signedness::S),
        A::I64TruncF32U => B::Trunc(IntType::I64, FloatType::F32, W::Signedness::U),
        A::I64TruncF64S => B::Trunc(IntType::I64, FloatType::F64, W::Signedness::S),
        A::I64TruncF64U => B::Trunc(IntType::I64, FloatType::F64, W::Signedness::U),
        A::F32ConvertI32S => B::FConvertI(FloatType::F32, IntType::I32, W::Signedness::S),
        A::F32ConvertI32U => B::FConvertI(FloatType::F32, IntType::I32, W::Signedness::U),
        A::F32ConvertI64S => B::FConvertI(FloatType::F32, IntType::I64, W::Signedness::S),
        A::F32ConvertI64U => B::FConvertI(FloatType::F32, IntType::I64, W::Signedness::U),
        A::F32DemoteF64 => B::F32DemoteF64,
        A::F64ConvertI32S => B::FConvertI(FloatType::F64, IntType::I32, W::Signedness::S),
        A::F64ConvertI32U => B::FConvertI(FloatType::F64, IntType::I32, W::Signedness::U),
        A::F64ConvertI64S => B::FConvertI(FloatType::F64, IntType::I64, W::Signedness::S),
        A::F64ConvertI64U => B::FConvertI(FloatType::F64, IntType::I64, W::Signedness::U),
        A::F64PromoteF32 => B::F64PromoteF32,
        A::I32ReinterpretF32 => B::IReinterpretF(IntType::I32, FloatType::F32),
        A::I64ReinterpretF64 => B::IReinterpretF(IntType::I64, FloatType::F64),
        A::F32ReinterpretI32 => B::FReinterpretI(FloatType::F32, IntType::I32),
        A::F64ReinterpretI64 => B::FReinterpretI(FloatType::F64, IntType::I64),

        A::I32Extend8S => B::I32Extend8S,
        A::I32Extend16S => B::I32Extend16S,
        A::I64Extend8S => B::I64Extend8S,
        A::I64Extend16S => B::I64Extend16S,
        A::I64Extend32S => B::I64Extend32S,

        A::RefNull(t) => B::NullRef(t),
        A::RefIsNull => B::IsNullRef,
        A::RefFunc(f_idx) => B::FuncRef(FuncIdx(f_idx)),
        A::RefEq => todo!(),
        A::RefAsNonNull => todo!(),
        A::BrOnNull(_l_idx) => todo!(),
        A::BrOnNonNull(_l_idx) => todo!(),

        A::I32Load(m) => B::ILoad(IntType::I32, map_memarg(m)),
        A::I64Load(m) => B::ILoad(IntType::I64, map_memarg(m)),
        A::F32Load(m) => B::FLoad(FloatType::F32, map_memarg(m)),
        A::F64Load(m) => B::FLoad(FloatType::F64, map_memarg(m)),
        A::I32Load8S(m) => B::ILoad8(IntType::I32, map_memarg(m), W::Signedness::S),
        A::I32Load8U(m) => B::ILoad8(IntType::I32, map_memarg(m), W::Signedness::U),
        A::I32Load16S(m) => B::ILoad16(IntType::I32, map_memarg(m), W::Signedness::S),
        A::I32Load16U(m) => B::ILoad16(IntType::I32, map_memarg(m), W::Signedness::U),
        A::I64Load8S(m) => B::ILoad8(IntType::I64, map_memarg(m), W::Signedness::S),
        A::I64Load8U(m) => B::ILoad8(IntType::I64, map_memarg(m), W::Signedness::U),
        A::I64Load16S(m) => B::ILoad16(IntType::I64, map_memarg(m), W::Signedness::S),
        A::I64Load16U(m) => B::ILoad16(IntType::I64, map_memarg(m), W::Signedness::U),
        A::I64Load32S(m) => B::I64Load32(map_memarg(m), W::Signedness::S),
        A::I64Load32U(m) => B::I64Load32(map_memarg(m), W::Signedness::U),
        A::I32Store(m) => B::IStore(IntType::I32, map_memarg(m)),
        A::I64Store(m) => B::IStore(IntType::I64, map_memarg(m)),
        A::F32Store(m) => B::FStore(FloatType::F32, map_memarg(m)),
        A::F64Store(m) => B::FStore(FloatType::F64, map_memarg(m)),
        A::I32Store8(m) => B::IStore8(IntType::I32, map_memarg(m)),
        A::I32Store16(m) => B::IStore16(IntType::I32, map_memarg(m)),
        A::I64Store8(m) => B::IStore8(IntType::I64, map_memarg(m)),
        A::I64Store16(m) => B::IStore16(IntType::I64, map_memarg(m)),
        A::I64Store32(m) => B::I64Store32(map_memarg(m)),

        A::I32TruncSatF32S => B::TruncSat(IntType::I32, FloatType::F32, W::Signedness::S),
        A::I32TruncSatF32U => B::TruncSat(IntType::I32, FloatType::F32, W::Signedness::U),
        A::I32TruncSatF64S => B::TruncSat(IntType::I32, FloatType::F64, W::Signedness::S),
        A::I32TruncSatF64U => B::TruncSat(IntType::I32, FloatType::F64, W::Signedness::U),
        A::I64TruncSatF32S => B::TruncSat(IntType::I64, FloatType::F32, W::Signedness::S),
        A::I64TruncSatF32U => B::TruncSat(IntType::I64, FloatType::F32, W::Signedness::U),
        A::I64TruncSatF64S => B::TruncSat(IntType::I64, FloatType::F64, W::Signedness::S),
        A::I64TruncSatF64U => B::TruncSat(IntType::I64, FloatType::F64, W::Signedness::U),

        A::MemoryInit(idx) => B::MemoryInit(DataIdx(idx)),
        A::MemoryDrop(_idx) => todo!(),
        A::MemoryCopy => B::MemoryCopy,
        A::MemoryFill => B::MemoryFill,
        A::TableInit(tab_idx, elem_idx) => B::TableInit(TableIdx(tab_idx), ElemIdx(elem_idx)),
        A::ElemDrop(idx) => B::ElemDrop(ElemIdx(idx)),
        A::TableCopy(tab_idx1, tab_idx2) => B::TableCopy(TableIdx(tab_idx1), TableIdx(tab_idx2)),
        A::TableGrow(idx) => B::TableGrow(TableIdx(idx)),
        A::TableSize(idx) => B::TableSize(TableIdx(idx)),
        A::TableFill(idx) => B::TableFill(TableIdx(idx)),

        A::V128Load(m) => B::V128Load(map_memarg(m)),
        A::V128Load8x8S(m) => B::V128Load8x8(map_memarg(m), W::Signedness::S),
        A::V128Load8x8U(m) => B::V128Load8x8(map_memarg(m), W::Signedness::U),
        A::V128Load16x4S(m) => B::V128Load16x4(map_memarg(m), W::Signedness::S),
        A::V128Load16x4U(m) => B::V128Load16x4(map_memarg(m), W::Signedness::U),
        A::V128Load32x2S(m) => B::V128Load32x2(map_memarg(m), W::Signedness::S),
        A::V128Load32x2U(m) => B::V128Load32x2(map_memarg(m), W::Signedness::U),
        A::V128Load8Splat(m) => B::V128LoadSplat(map_memarg(m), W::Width::W8),
        A::V128Load16Splat(m) => B::V128LoadSplat(map_memarg(m), W::Width::W16),
        A::V128Load32Splat(m) => B::V128LoadSplat(map_memarg(m), W::Width::W32),
        A::V128Load64Splat(m) => B::V128LoadSplat(map_memarg(m), W::Width::W64),
        A::V128Store(m) => B::V128Store(map_memarg(m)),
        A::V128Const(value) => B::V128Const(value),

        A::I8x16Shuffle(indices) => {
            let lanes = indices.into_iter().map(LaneIdx).collect::<Vec<LaneIdx>>();
            B::I8X16Shuffle(<[LaneIdx; 16]>::try_from(&lanes[..16]).unwrap())
        }
        A::I8x16Swizzle => B::I8X16Swizzle,

        A::I8x16Splat => B::ISplat(W::IShape::I8X16),
        A::I16x8Splat => B::ISplat(W::IShape::I16X8),
        A::I32x4Splat => B::ISplat(W::IShape::I32X4),
        A::I64x2Splat => B::ISplat(W::IShape::I64X2),
        A::F32x4Splat => B::FSplat(W::FShape::F32X4),
        A::F64x2Splat => B::FSplat(W::FShape::F64X2),

        A::I8x16ExtractLaneS(idx) => B::I8X16ExtractLane(W::Signedness::S, LaneIdx(idx)),
        A::I8x16ExtractLaneU(idx) => B::I8X16ExtractLane(W::Signedness::U, LaneIdx(idx)),
        A::I8x16ReplaceLane(idx) => B::IReplaceLane(W::IShape::I8X16, LaneIdx(idx)),
        A::I16x8ExtractLaneS(idx) => B::I16X8ExtractLane(W::Signedness::S, LaneIdx(idx)),
        A::I16x8ExtractLaneU(idx) => B::I16X8ExtractLane(W::Signedness::U, LaneIdx(idx)),
        A::I16x8ReplaceLane(idx) => B::IReplaceLane(W::IShape::I16X8, LaneIdx(idx)),
        A::I32x4ExtractLane(idx) => B::I32X4ExtractLane(LaneIdx(idx)),
        A::I32x4ReplaceLane(idx) => B::IReplaceLane(W::IShape::I32X4, LaneIdx(idx)),
        A::I64x2ExtractLane(idx) => B::I64X2ExtractLane(LaneIdx(idx)),
        A::I64x2ReplaceLane(idx) => B::IReplaceLane(W::IShape::I64X2, LaneIdx(idx)),
        A::F32x4ExtractLane(idx) => B::FExtractLane(W::FShape::F32X4, LaneIdx(idx)),
        A::F32x4ReplaceLane(idx) => B::FReplaceLane(W::FShape::F32X4, LaneIdx(idx)),
        A::F64x2ExtractLane(idx) => B::FExtractLane(W::FShape::F64X2, LaneIdx(idx)),
        A::F64x2ReplaceLane(idx) => B::FReplaceLane(W::FShape::F64X2, LaneIdx(idx)),

        A::I8x16Eq => B::I8X16VIRelOp(W::VIRelOp::Eq),
        A::I8x16Ne => B::I8X16VIRelOp(W::VIRelOp::Ne),
        A::I8x16LtS => B::I8X16VIRelOp(W::VIRelOp::Lt(W::Signedness::S)),
        A::I8x16LtU => B::I8X16VIRelOp(W::VIRelOp::Lt(W::Signedness::U)),
        A::I8x16GtS => B::I8X16VIRelOp(W::VIRelOp::Gt(W::Signedness::S)),
        A::I8x16GtU => B::I8X16VIRelOp(W::VIRelOp::Gt(W::Signedness::U)),
        A::I8x16LeS => B::I8X16VIRelOp(W::VIRelOp::Le(W::Signedness::S)),
        A::I8x16LeU => B::I8X16VIRelOp(W::VIRelOp::Le(W::Signedness::U)),
        A::I8x16GeS => B::I8X16VIRelOp(W::VIRelOp::Ge(W::Signedness::S)),
        A::I8x16GeU => B::I8X16VIRelOp(W::VIRelOp::Ge(W::Signedness::U)),

        A::I16x8Eq => B::I16X8VIRelOp(W::VIRelOp::Eq),
        A::I16x8Ne => B::I16X8VIRelOp(W::VIRelOp::Ne),
        A::I16x8LtS => B::I16X8VIRelOp(W::VIRelOp::Lt(W::Signedness::S)),
        A::I16x8LtU => B::I16X8VIRelOp(W::VIRelOp::Lt(W::Signedness::U)),
        A::I16x8GtS => B::I16X8VIRelOp(W::VIRelOp::Gt(W::Signedness::S)),
        A::I16x8GtU => B::I16X8VIRelOp(W::VIRelOp::Gt(W::Signedness::U)),
        A::I16x8LeS => B::I16X8VIRelOp(W::VIRelOp::Le(W::Signedness::S)),
        A::I16x8LeU => B::I16X8VIRelOp(W::VIRelOp::Le(W::Signedness::U)),
        A::I16x8GeS => B::I16X8VIRelOp(W::VIRelOp::Ge(W::Signedness::S)),
        A::I16x8GeU => B::I16X8VIRelOp(W::VIRelOp::Ge(W::Signedness::U)),

        A::I32x4Eq => B::I32X4VIRelOp(W::VIRelOp::Eq),
        A::I32x4Ne => B::I32X4VIRelOp(W::VIRelOp::Ne),
        A::I32x4LtS => B::I32X4VIRelOp(W::VIRelOp::Lt(W::Signedness::S)),
        A::I32x4LtU => B::I32X4VIRelOp(W::VIRelOp::Lt(W::Signedness::U)),
        A::I32x4GtS => B::I32X4VIRelOp(W::VIRelOp::Gt(W::Signedness::S)),
        A::I32x4GtU => B::I32X4VIRelOp(W::VIRelOp::Gt(W::Signedness::U)),
        A::I32x4LeS => B::I32X4VIRelOp(W::VIRelOp::Le(W::Signedness::S)),
        A::I32x4LeU => B::I32X4VIRelOp(W::VIRelOp::Le(W::Signedness::U)),
        A::I32x4GeS => B::I32X4VIRelOp(W::VIRelOp::Ge(W::Signedness::S)),
        A::I32x4GeU => B::I32X4VIRelOp(W::VIRelOp::Ge(W::Signedness::U)),

        A::F32x4Eq => B::VFRelOp(W::FShape::F32X4, W::VFRelOp::Eq),
        A::F32x4Ne => B::VFRelOp(W::FShape::F32X4, W::VFRelOp::Ne),
        A::F32x4Lt => B::VFRelOp(W::FShape::F32X4, W::VFRelOp::Lt),
        A::F32x4Gt => B::VFRelOp(W::FShape::F32X4, W::VFRelOp::Gt),
        A::F32x4Le => B::VFRelOp(W::FShape::F32X4, W::VFRelOp::Le),
        A::F32x4Ge => B::VFRelOp(W::FShape::F32X4, W::VFRelOp::Ge),

        A::F64x2Eq => B::VFRelOp(W::FShape::F64X2, W::VFRelOp::Eq),
        A::F64x2Ne => B::VFRelOp(W::FShape::F64X2, W::VFRelOp::Ne),
        A::F64x2Lt => B::VFRelOp(W::FShape::F64X2, W::VFRelOp::Lt),
        A::F64x2Gt => B::VFRelOp(W::FShape::F64X2, W::VFRelOp::Gt),
        A::F64x2Le => B::VFRelOp(W::FShape::F64X2, W::VFRelOp::Le),
        A::F64x2Ge => B::VFRelOp(W::FShape::F64X2, W::VFRelOp::Ge),

        A::V128Not => B::VVUnOp(W::VVUnOp::Not),
        A::V128And => B::VVBinOp(W::VVBinOp::And),
        A::V128Andnot => B::VVBinOp(W::VVBinOp::AndNot),
        A::V128Or => B::VVBinOp(W::VVBinOp::Or),
        A::V128Xor => B::VVBinOp(W::VVBinOp::Xor),
        A::V128Bitselect => B::VVTernOp(W::VVTernOp::BitSelect),
        A::V128AnyTrue => B::VVTestOp(W::VVTestOp::AnyTrue),

        A::V128Load8Lane(m, idx) => B::V128LoadLane(map_memarg(m), W::Width::W8, LaneIdx(idx)),
        A::V128Load16Lane(m, idx) => B::V128LoadLane(map_memarg(m), W::Width::W16, LaneIdx(idx)),
        A::V128Load32Lane(m, idx) => B::V128LoadLane(map_memarg(m), W::Width::W32, LaneIdx(idx)),
        A::V128Load64Lane(m, idx) => B::V128LoadLane(map_memarg(m), W::Width::W64, LaneIdx(idx)),
        A::V128Store8Lane(m, idx) => B::V128StoreLane(map_memarg(m), W::Width::W8, LaneIdx(idx)),
        A::V128Store16Lane(m, idx) => B::V128StoreLane(map_memarg(m), W::Width::W16, LaneIdx(idx)),
        A::V128Store32Lane(m, idx) => B::V128StoreLane(map_memarg(m), W::Width::W32, LaneIdx(idx)),
        A::V128Store64Lane(m, idx) => B::V128StoreLane(map_memarg(m), W::Width::W64, LaneIdx(idx)),

        A::V128Load32Zero(m) => B::V128Load32Zero(map_memarg(m)),
        A::V128Load64Zero(m) => B::V128Load64Zero(map_memarg(m)),

        A::F32x4DemoteF64x2Zero => B::F32X4DemoteF64X2Zero,
        A::F64x2PromoteLowF32x4 => B::F64X2PromoteLowI32X4,

        A::I8x16Abs => B::VIUnOp(W::IShape::I8X16, W::VIUnOp::Abs),
        A::I8x16Neg => B::VIUnOp(W::IShape::I8X16, W::VIUnOp::Neg),
        A::I8x16Popcnt => todo!(),
        A::I8x16AllTrue => B::VITestOp(W::IShape::I8X16, W::VITestOp::AllTrue),
        A::I8x16Bitmask => B::Bitmask(W::IShape::I8X16),
        A::I8x16NarrowI16x8S => B::I8X16NarrowI16X8(W::Signedness::S),
        A::I8x16NarrowI16x8U => B::I8X16NarrowI16X8(W::Signedness::U),

        A::F32x4Ceil => B::VFUnOp(W::FShape::F32X4, W::VFUnOp::Ceil),
        A::F32x4Floor => B::VFUnOp(W::FShape::F32X4, W::VFUnOp::Floor),
        A::F32x4Trunc => B::VFUnOp(W::FShape::F32X4, W::VFUnOp::Trunc),
        A::F32x4Nearest => B::VFUnOp(W::FShape::F32X4, W::VFUnOp::Nearest),

        A::I8x16Shl => B::VIShiftOp(W::IShape::I8X16, W::VIShiftOp::Shl),
        A::I8x16ShrS => B::VIShiftOp(W::IShape::I8X16, W::VIShiftOp::Shr(W::Signedness::S)),
        A::I8x16ShrU => B::VIShiftOp(W::IShape::I8X16, W::VIShiftOp::Shr(W::Signedness::U)),
        A::I8x16Add => B::VIBinOp(W::IShape::I8X16, W::VIBinOp::Add),
        A::I8x16AddSatS => B::I8X16VISatBinOp(W::VISatBinOp::AddSat(W::Signedness::S)),
        A::I8x16AddSatU => B::I8X16VISatBinOp(W::VISatBinOp::AddSat(W::Signedness::U)),
        A::I8x16Sub => B::VIBinOp(W::IShape::I8X16, W::VIBinOp::Sub),
        A::I8x16SubSatS => B::I8X16VISatBinOp(W::VISatBinOp::SubSat(W::Signedness::S)),
        A::I8x16SubSatU => B::I8X16VISatBinOp(W::VISatBinOp::SubSat(W::Signedness::U)),

        A::F64x2Ceil => B::VFUnOp(W::FShape::F64X2, W::VFUnOp::Ceil),
        A::F64x2Floor => B::VFUnOp(W::FShape::F64X2, W::VFUnOp::Floor),

        A::I8x16MinS => B::I8X16VIMinMaxOp(W::VIMinMaxOp::Min(W::Signedness::S)),
        A::I8x16MinU => B::I8X16VIMinMaxOp(W::VIMinMaxOp::Min(W::Signedness::U)),
        A::I8x16MaxS => B::I8X16VIMinMaxOp(W::VIMinMaxOp::Max(W::Signedness::S)),
        A::I8x16MaxU => B::I8X16VIMinMaxOp(W::VIMinMaxOp::Max(W::Signedness::U)),

        A::F64x2Trunc => B::VFUnOp(W::FShape::F64X2, W::VFUnOp::Trunc),

        A::I8x16AvgrU => B::I8X16AvgrU,

        A::I16x8ExtaddPairwiseI8x16S => B::I16X8ExtAddPairwiseI8X16(W::Signedness::S),
        A::I16x8ExtaddPairwiseI8x16U => B::I16X8ExtAddPairwiseI8X16(W::Signedness::U),
        A::I32x4ExtaddPairwiseI16x8S => B::I32X4ExtAddPairwiseI16X8(W::Signedness::S),
        A::I32x4ExtaddPairwiseI16x8U => B::I32X4ExtAddPairwiseI16X8(W::Signedness::U),

        A::I16x8Abs => B::VIUnOp(W::IShape::I16X8, W::VIUnOp::Abs),
        A::I16x8Neg => B::VIUnOp(W::IShape::I16X8, W::VIUnOp::Neg),
        A::I16x8Q15mulrSatS => B::I16X8Q15MulrSatS,
        A::I16x8AllTrue => B::VITestOp(W::IShape::I16X8, W::VITestOp::AllTrue),
        A::I16x8Bitmask => B::Bitmask(W::IShape::I16X8),
        A::I16x8NarrowI32x4S => B::I16X8NarrowI32X4(W::Signedness::S),
        A::I16x8NarrowI32x4U => B::I16X8NarrowI32X4(W::Signedness::U),
        A::I16x8ExtendLowI8x16S => todo!(),
        A::I16x8ExtendHighI8x16S => todo!(),
        A::I16x8ExtendLowI8x16U => todo!(),
        A::I16x8ExtendHighI8x16U => todo!(),

        A::I16x8Shl => B::VIShiftOp(W::IShape::I16X8, W::VIShiftOp::Shl),
        A::I16x8ShrS => B::VIShiftOp(W::IShape::I16X8, W::VIShiftOp::Shr(W::Signedness::S)),
        A::I16x8ShrU => B::VIShiftOp(W::IShape::I16X8, W::VIShiftOp::Shr(W::Signedness::U)),
        A::I16x8Add => B::VIBinOp(W::IShape::I16X8, W::VIBinOp::Add),
        A::I16x8AddSatS => B::I16X8VISatBinOp(W::VISatBinOp::AddSat(W::Signedness::S)),
        A::I16x8AddSatU => B::I16X8VISatBinOp(W::VISatBinOp::AddSat(W::Signedness::U)),
        A::I16x8Sub => B::VIBinOp(W::IShape::I16X8, W::VIBinOp::Sub),
        A::I16x8SubSatS => B::I16X8VISatBinOp(W::VISatBinOp::SubSat(W::Signedness::S)),
        A::I16x8SubSatU => B::I16X8VISatBinOp(W::VISatBinOp::SubSat(W::Signedness::U)),
        A::F64x2Nearest => B::VFUnOp(W::FShape::F64X2, W::VFUnOp::Nearest),
        A::I16x8Mul => B::I16X8Mul,
        A::I16x8MinS => B::I16X8VIMinMaxOp(W::VIMinMaxOp::Min(W::Signedness::S)),
        A::I16x8MinU => B::I16X8VIMinMaxOp(W::VIMinMaxOp::Min(W::Signedness::U)),
        A::I16x8MaxS => B::I16X8VIMinMaxOp(W::VIMinMaxOp::Max(W::Signedness::S)),
        A::I16x8MaxU => B::I16X8VIMinMaxOp(W::VIMinMaxOp::Max(W::Signedness::U)),
        A::I16x8AvgrU => B::I16X8AvgrU,

        A::I16x8ExtmulLowI8x16S => B::I16X8ExtMulI8X16(W::Half::Low, W::Signedness::S),
        A::I16x8ExtmulHighI8x16S => B::I16X8ExtMulI8X16(W::Half::High, W::Signedness::S),
        A::I16x8ExtmulLowI8x16U => B::I16X8ExtMulI8X16(W::Half::Low, W::Signedness::U),
        A::I16x8ExtmulHighI8x16U => B::I16X8ExtMulI8X16(W::Half::High, W::Signedness::U),

        A::I32x4Abs => B::VIUnOp(W::IShape::I32X4, W::VIUnOp::Abs),
        A::I32x4Neg => B::VIUnOp(W::IShape::I32X4, W::VIUnOp::Neg),
        A::I32x4AllTrue => B::VITestOp(W::IShape::I32X4, W::VITestOp::AllTrue),
        A::I32x4Bitmask => B::Bitmask(W::IShape::I32X4),

        A::I32x4ExtendLowI16x8S => B::I32X4ExtMulI16X8(W::Half::Low, W::Signedness::S),
        A::I32x4ExtendHighI16x8S => B::I32X4ExtMulI16X8(W::Half::High, W::Signedness::S),
        A::I32x4ExtendLowI16x8U => B::I32X4ExtMulI16X8(W::Half::Low, W::Signedness::U),
        A::I32x4ExtendHighI16x8U => B::I32X4ExtMulI16X8(W::Half::High, W::Signedness::U),

        A::I32x4Shl => B::VIShiftOp(W::IShape::I32X4, W::VIShiftOp::Shl),
        A::I32x4ShrS => B::VIShiftOp(W::IShape::I32X4, W::VIShiftOp::Shr(W::Signedness::S)),
        A::I32x4ShrU => B::VIShiftOp(W::IShape::I32X4, W::VIShiftOp::Shr(W::Signedness::U)),
        A::I32x4Add => B::VIBinOp(W::IShape::I32X4, W::VIBinOp::Add),
        A::I32x4Sub => B::VIBinOp(W::IShape::I32X4, W::VIBinOp::Sub),
        A::I32x4Mul => B::I32X4Mul,
        A::I32x4MinS => B::I32X4VIMinMaxOp(W::VIMinMaxOp::Min(W::Signedness::S)),
        A::I32x4MinU => B::I32X4VIMinMaxOp(W::VIMinMaxOp::Min(W::Signedness::U)),
        A::I32x4MaxS => B::I32X4VIMinMaxOp(W::VIMinMaxOp::Max(W::Signedness::S)),
        A::I32x4MaxU => B::I32X4VIMinMaxOp(W::VIMinMaxOp::Max(W::Signedness::U)),
        A::I32x4DotI16x8S => B::I32X4DotI16X8S,

        A::I32x4ExtmulLowI16x8S => todo!(),
        A::I32x4ExtmulHighI16x8S => todo!(),
        A::I32x4ExtmulLowI16x8U => todo!(),
        A::I32x4ExtmulHighI16x8U => todo!(),

        A::I64x2Abs => B::VIUnOp(W::IShape::I64X2, W::VIUnOp::Abs),
        A::I64x2Neg => B::VIUnOp(W::IShape::I64X2, W::VIUnOp::Neg),
        A::I64x2AllTrue => B::VITestOp(W::IShape::I64X2, W::VITestOp::AllTrue),
        A::I64x2Bitmask => B::Bitmask(W::IShape::I64X2),

        A::I64x2ExtendLowI32x4S => todo!(),
        A::I64x2ExtendHighI32x4S => todo!(),
        A::I64x2ExtendLowI32x4U => todo!(),
        A::I64x2ExtendHighI32x4U => todo!(),

        A::I64x2Shl => B::VIShiftOp(W::IShape::I64X2, W::VIShiftOp::Shl),
        A::I64x2ShrS => B::VIShiftOp(W::IShape::I64X2, W::VIShiftOp::Shr(W::Signedness::S)),
        A::I64x2ShrU => B::VIShiftOp(W::IShape::I64X2, W::VIShiftOp::Shr(W::Signedness::U)),
        A::I64x2Add => B::VIBinOp(W::IShape::I64X2, W::VIBinOp::Add),
        A::I64x2Sub => B::VIBinOp(W::IShape::I64X2, W::VIBinOp::Sub),
        A::I64x2Mul => B::I64X2Mul,
        A::I64x2Eq => B::I64X2Eq,
        A::I64x2Ne => B::I64X2Ne,
        A::I64x2LtS => B::I64X2Lt(W::Signedness::S),
        A::I64x2GtS => B::I64X2Gt(W::Signedness::S),
        A::I64x2LeS => B::I64X2Le(W::Signedness::S),
        A::I64x2GeS => B::I64X2Ge(W::Signedness::S),

        A::I64x2ExtmulLowI32x4S => todo!(),
        A::I64x2ExtmulHighI32x4S => todo!(),
        A::I64x2ExtmulLowI32x4U => todo!(),
        A::I64x2ExtmulHighI32x4U => todo!(),

        A::F32x4Abs => B::VFUnOp(W::FShape::F32X4, W::VFUnOp::Abs),
        A::F32x4Neg => B::VFUnOp(W::FShape::F32X4, W::VFUnOp::Neg),
        A::F32x4Sqrt => B::VFUnOp(W::FShape::F32X4, W::VFUnOp::Sqrt),
        A::F32x4Add => B::VFBinOp(W::FShape::F32X4, W::VFBinOp::Add),
        A::F32x4Sub => B::VFBinOp(W::FShape::F32X4, W::VFBinOp::Sub),
        A::F32x4Mul => B::VFBinOp(W::FShape::F32X4, W::VFBinOp::Mul),
        A::F32x4Div => B::VFBinOp(W::FShape::F32X4, W::VFBinOp::Div),
        A::F32x4Min => B::VFBinOp(W::FShape::F32X4, W::VFBinOp::Min),
        A::F32x4Max => B::VFBinOp(W::FShape::F32X4, W::VFBinOp::Max),
        A::F32x4Pmin => B::VFBinOp(W::FShape::F32X4, W::VFBinOp::PMin),
        A::F32x4Pmax => B::VFBinOp(W::FShape::F32X4, W::VFBinOp::PMax),

        A::F64x2Abs => B::VFUnOp(W::FShape::F64X2, W::VFUnOp::Abs),
        A::F64x2Neg => B::VFUnOp(W::FShape::F64X2, W::VFUnOp::Neg),
        A::F64x2Sqrt => B::VFUnOp(W::FShape::F64X2, W::VFUnOp::Sqrt),
        A::F64x2Add => B::VFBinOp(W::FShape::F64X2, W::VFBinOp::Add),
        A::F64x2Sub => B::VFBinOp(W::FShape::F64X2, W::VFBinOp::Sub),
        A::F64x2Mul => B::VFBinOp(W::FShape::F64X2, W::VFBinOp::Mul),
        A::F64x2Div => B::VFBinOp(W::FShape::F64X2, W::VFBinOp::Div),
        A::F64x2Min => B::VFBinOp(W::FShape::F64X2, W::VFBinOp::Min),
        A::F64x2Max => B::VFBinOp(W::FShape::F64X2, W::VFBinOp::Max),
        A::F64x2Pmin => B::VFBinOp(W::FShape::F64X2, W::VFBinOp::PMin),
        A::F64x2Pmax => B::VFBinOp(W::FShape::F64X2, W::VFBinOp::PMax),

        A::I32x4TruncSatF32x4S => B::I32X4TruncSatF32X4(W::Signedness::S),
        A::I32x4TruncSatF32x4U => B::I32X4TruncSatF32X4(W::Signedness::U),
        A::F32x4ConvertI32x4S => B::F32X4ConvertI32X4(W::Signedness::S),
        A::F32x4ConvertI32x4U => B::F32X4ConvertI32X4(W::Signedness::U),
        A::I32x4TruncSatF64x2SZero => B::I32X4TruncSatF64X2Zero(W::Signedness::S),
        A::I32x4TruncSatF64x2UZero => B::I32X4TruncSatF64X2Zero(W::Signedness::U),

        A::F64x2ConvertLowI32x4S => B::F64X2ConvertLowI32X4(W::Signedness::S),
        A::F64x2ConvertLowI32x4U => B::F64X2ConvertLowI32X4(W::Signedness::U),

        A::I8x16RelaxedSwizzle => todo!(),
        A::I32x4RelaxedTruncF32x4S => todo!(),
        A::I32x4RelaxedTruncF32x4U => todo!(),
        A::I32x4RelaxedTruncF64x2S => todo!(),
        A::I32x4RelaxedTruncF64x2U => todo!(),
        A::F32x4RelaxedMadd => todo!(),
        A::F32x4RelaxedNmadd => todo!(),
        A::F64x2RelaxedMadd => todo!(),
        A::F64x2RelaxedNmadd => todo!(),
        A::I8x16RelaxedLaneselect => todo!(),
        A::I16x8RelaxedLaneselect => todo!(),
        A::I32x4RelaxedLaneselect => todo!(),
        A::I64x2RelaxedLaneselect => todo!(),
        A::F32x4RelaxedMin => todo!(),
        A::F32x4RelaxedMax => todo!(),
        A::F64x2RelaxedMin => todo!(),
        A::F64x2RelaxedMax => todo!(),
        A::I16x8RelaxedQ15mulrS => todo!(),
        A::I16x8RelaxedDotI8x16I7x16S => todo!(),
        A::I32x4RelaxedDotI8x16I7x16AddS => todo!(),
    }
}
