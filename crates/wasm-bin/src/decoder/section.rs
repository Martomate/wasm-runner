use crate::wasm::{ExportDesc, FuncIdx, FuncType, GlobalIdx, GlobalType, ImportDesc, MemIdx, MemType, RefType, TableIdx, TableType, TypeIdx, ValType};

use super::WasmDecoder;
use super::error::{DecodingError, DecodingErrorExt};
use super::instr::Expr;

#[derive(Debug, PartialEq, Eq, Clone)]
pub struct ImportType {
    pub mod_name: String,
    pub name: String,
    pub desc: ImportDesc,
}

#[derive(Debug, PartialEq, Eq, Clone)]
pub struct Export {
    pub name: String,
    pub desc: ExportDesc,
}

#[derive(Debug, PartialEq, Clone)]
pub struct Code {
    pub size: u32,
    pub func: (Vec<Locals>, Expr),
}

#[derive(Debug, PartialEq, Clone)]
pub struct Data {
    pub init: Vec<u8>,
    pub mode: DataMode,
}

#[derive(Debug, PartialEq, Clone)]
pub enum DataMode {
    Passive,
    Active { memory: u32, offset: Expr },
}

#[derive(Debug, PartialEq, Clone)]
pub enum ElementInit {
    Implicit(Vec<u32>),
    Explicit(Vec<Expr>),
}

#[derive(Debug, PartialEq, Clone)]
pub enum ElementMode {
    Passive,
    Active { table: u32, offset: Expr },
    Declarative,
}

#[derive(Debug, PartialEq, Eq, Clone)]
pub struct Locals {
    pub n: u32,
    pub t: ValType,
}

#[derive(Debug, PartialEq, Clone)]
pub struct Element {
    pub t: RefType,
    pub init: ElementInit,
    pub mode: ElementMode,
}

impl<'a> WasmDecoder<'a> {
    fn read_elemkind(&mut self) -> Result<(), DecodingError> {
        if self.read_byte() != 0 {
            Err("element did not have elementkind 0")?;
        }
        Ok(())
    }

    fn read_element(&mut self) -> Result<Element, DecodingError> {
        let kind = self.read_u32();
        let element = match kind {
            0 => {
                let e = self.read_expr()?;
                let y = self.read_vec(|bytes| Ok(bytes.read_u32()))?;
                Element {
                    t: RefType::FuncRef,
                    init: ElementInit::Implicit(y),
                    mode: ElementMode::Active {
                        table: 0,
                        offset: e,
                    },
                }
            }
            1 => {
                self.read_elemkind()?;
                let y = self.read_vec(|bytes| Ok(bytes.read_u32()))?;
                Element {
                    t: RefType::FuncRef,
                    init: ElementInit::Implicit(y),
                    mode: ElementMode::Passive,
                }
            }
            2 => {
                let x = self.read_u32();
                let e = self.read_expr()?;
                self.read_elemkind()?;
                let y = self.read_vec(|bytes| Ok(bytes.read_u32()))?;
                Element {
                    t: RefType::FuncRef,
                    init: ElementInit::Implicit(y),
                    mode: ElementMode::Active {
                        table: x,
                        offset: e,
                    },
                }
            }
            3 => {
                self.read_elemkind()?;
                let y = self.read_vec(|bytes| Ok(bytes.read_u32()))?;
                Element {
                    t: RefType::FuncRef,
                    init: ElementInit::Implicit(y),
                    mode: ElementMode::Declarative,
                }
            }
            4 => {
                let e = self.read_expr()?;
                let y = self.read_vec(|bytes| bytes.read_expr())?;
                Element {
                    t: RefType::FuncRef,
                    init: ElementInit::Explicit(y),
                    mode: ElementMode::Active {
                        table: 0,
                        offset: e,
                    },
                }
            }
            5 => {
                let t = self.read_reftype()?;
                let y = self.read_vec(|bytes| bytes.read_expr())?;
                Element {
                    t,
                    init: ElementInit::Explicit(y),
                    mode: ElementMode::Passive,
                }
            }
            6 => {
                let x = self.read_u32();
                let e = self.read_expr()?;
                let t = self.read_reftype()?;
                let y = self.read_vec(|bytes| bytes.read_expr())?;
                Element {
                    t,
                    init: ElementInit::Explicit(y),
                    mode: ElementMode::Active {
                        table: x,
                        offset: e,
                    },
                }
            }
            7 => {
                let t = self.read_reftype()?;
                let y = self.read_vec(|bytes| bytes.read_expr())?;
                Element {
                    t,
                    init: ElementInit::Explicit(y),
                    mode: ElementMode::Declarative,
                }
            }
            _ => Err(format!("unknown element kind: {}", kind))?,
        };
        Ok(element)
    }

    fn read_export(&mut self) -> Result<Export, DecodingError> {
        let name = self.read_name()?;
        let desc = match self.read_byte() {
            0x00 => ExportDesc::Func(FuncIdx(self.read_u32())),
            0x01 => ExportDesc::Table(TableIdx(self.read_u32())),
            0x02 => ExportDesc::Mem(MemIdx(self.read_u32())),
            0x03 => ExportDesc::Global(GlobalIdx(self.read_u32())),
            b => Err(format!("invalid export desc variant: {}", b))?,
        };
        Ok(Export { name, desc })
    }

    fn read_locals(&mut self) -> Result<Locals, DecodingError> {
        let n = self.read_u32();
        let t = self.read_val_type()?;
        Ok(Locals { n, t })
    }

    fn read_code(&mut self) -> Result<Code, DecodingError> {
        let size = self.read_u32();
        let locals = self.read_vec(Self::read_locals)?;
        let expr = self.read_expr()?;
        Ok(Code {
            size,
            func: (locals, expr),
        })
    }

    fn read_data(&mut self) -> Result<Data, DecodingError> {
        let data = match self.read_u32() {
            0 => {
                let e = self.read_expr()?;
                let b = self.read_vec(|bytes| Ok(bytes.read_byte()))?;
                Data {
                    init: b,
                    mode: DataMode::Active {
                        memory: 0,
                        offset: e,
                    },
                }
            }
            1 => {
                let b = self.read_vec(|bytes| Ok(bytes.read_byte()))?;
                Data {
                    init: b,
                    mode: DataMode::Passive,
                }
            }
            2 => {
                let x = self.read_u32();
                let e = self.read_expr()?;
                let b = self.read_vec(|bytes| Ok(bytes.read_byte()))?;
                Data {
                    init: b,
                    mode: DataMode::Active {
                        memory: x,
                        offset: e,
                    },
                }
            }
            b => Err(format!("invalid data variant: {}", b))?,
        };
        Ok(data)
    }

    fn read_import(&mut self) -> Result<ImportType, DecodingError> {
        let mod_name = self.read_name()?;
        let name = self.read_name()?;

        let kind = self.read_byte();
        let desc = match kind {
            0x00 => ImportDesc::Func(TypeIdx(self.read_u32())),
            0x01 => ImportDesc::Table(self.read_tabletype()?),
            0x02 => ImportDesc::Mem(self.read_memtype()?),
            0x03 => ImportDesc::Global(self.read_globaltype()?),
            _ => Err(format!("invalid importdesc kind: {}", kind))?,
        };

        Ok(ImportType {
            mod_name,
            name,
            desc,
        })
    }
}

#[derive(Debug, PartialEq)]
pub enum Section {
    Custom(CustomSection),
    Type(TypeSection),
    Import(ImportSection),
    Function(FunctionSection),
    Table(TableSection),
    Memory(MemorySection),
    Global(GlobalSection),
    Export(ExportSection),
    Start(StartSection),
    Element(ElementSection),
    Code(CodeSection),
    Data(DataSection),
    DataCount(DataCountSection),
}

impl Section {
    pub fn decode(id: u8, bytes: &mut WasmDecoder) -> Result<Section, DecodingError> {
        let section = match id {
            0 => CustomSection::decode_section(bytes).map(Section::Custom)?,
            1 => TypeSection::decode_section(bytes).map(Section::Type)?,
            2 => ImportSection::decode_section(bytes).map(Section::Import)?,
            3 => FunctionSection::decode_section(bytes).map(Section::Function)?,
            4 => TableSection::decode_section(bytes).map(Section::Table)?,
            5 => MemorySection::decode_section(bytes).map(Section::Memory)?,
            6 => GlobalSection::decode_section(bytes).map(Section::Global)?,
            7 => ExportSection::decode_section(bytes).map(Section::Export)?,
            8 => StartSection::decode_section(bytes).map(Section::Start)?,
            9 => ElementSection::decode_section(bytes).map(Section::Element)?,
            10 => CodeSection::decode_section(bytes).map(Section::Code)?,
            11 => DataSection::decode_section(bytes).map(Section::Data)?,
            12 => DataCountSection::decode_section(bytes).map(Section::DataCount)?,
            _ => Err(format!("unknwon section id: {id}"))?,
        };
        Ok(section)
    }
}

pub trait SectionDecoder: Sized {
    fn decode_section(bytes: &mut WasmDecoder) -> Result<Self, DecodingError>;
}

#[derive(Debug, PartialEq, Eq)]
pub enum CustomSection {
    Name(Box<NameSubSections>),
    Unknown { name: String, data: Vec<u8> },
}

#[derive(Debug, PartialEq, Eq)]
pub struct NameSubSections {
    module_name: Option<String>,
    func_names: Option<NameMap>,
    local_names: Option<IndirectNameMap>,
    label_names: Option<NameMap>,
    table_names: Option<NameMap>,
    memory_names: Option<NameMap>,
    global_names: Option<NameMap>,
    elem_names: Option<NameMap>,
    data_names: Option<NameMap>,
    tag_names: Option<NameMap>,
}

#[derive(Debug, PartialEq, Eq)]
pub struct NameMap(Vec<(u32, String)>);

#[derive(Debug, PartialEq, Eq)]
pub struct IndirectNameMap(Vec<(u32, NameMap)>);

impl SectionDecoder for CustomSection {
    fn decode_section(bytes: &mut WasmDecoder) -> Result<Self, DecodingError> {
        let name = bytes.read_name()?;
        let section = match name.as_str() {
            "name" => Self::Name(Box::new(bytes.read_custom_name_subsections()?)),
            _ => Self::Unknown {
                name,
                data: bytes.read_all_bytes().to_owned(),
            },
        };
        Ok(section)
    }
}

impl<'a> WasmDecoder<'a> {
    fn read_custom_name_subsections(&mut self) -> Result<NameSubSections, DecodingError> {
        let mut section = NameSubSections {
            module_name: None,
            func_names: None,
            local_names: None,
            label_names: None,
            table_names: None,
            memory_names: None,
            global_names: None,
            elem_names: None,
            data_names: None,
            tag_names: None,
        };

        let mut next_id = 0;
        while !self.is_empty() {
            let id = self.read_byte();
            let size = self.read_u32();

            if id < next_id {
                Err(format!(
                    "expected subsections in increasing order, but got id: {}",
                    id
                ))?;
            }

            if next_id != id {
                next_id = id;
            }

            match id {
                0 => {
                    section.module_name = Some(self.ensuring_size(size, |bytes| {
                        bytes.read_name().context("parsing module name")
                    })?)
                }
                1 => {
                    section.func_names = Some(self.ensuring_size(size, |bytes| {
                        bytes.read_name_map().context("parsing func names")
                    })?)
                }
                2 => {
                    section.local_names = Some(self.ensuring_size(size, |bytes| {
                        bytes
                            .read_indirect_name_map()
                            .context("parsing local names")
                    })?)
                }
                3 => {
                    section.label_names = Some(self.ensuring_size(size, |bytes| {
                        bytes.read_name_map().context("parsing label names")
                    })?)
                }
                5 => {
                    section.table_names = Some(self.ensuring_size(size, |bytes| {
                        bytes.read_name_map().context("parsing table names")
                    })?)
                }
                6 => {
                    section.memory_names = Some(self.ensuring_size(size, |bytes| {
                        bytes.read_name_map().context("parsing memory names")
                    })?)
                }
                7 => {
                    section.global_names = Some(self.ensuring_size(size, |bytes| {
                        bytes.read_name_map().context("parsing global names")
                    })?)
                }
                8 => {
                    section.elem_names = Some(self.ensuring_size(size, |bytes| {
                        bytes.read_name_map().context("parsing element names")
                    })?)
                }
                9 => {
                    section.data_names = Some(self.ensuring_size(size, |bytes| {
                        bytes.read_name_map().context("parsing data names")
                    })?)
                }
                11 => {
                    section.tag_names = Some(self.ensuring_size(size, |bytes| {
                        bytes.read_name_map().context("parsing tag names")
                    })?)
                }
                _ => {
                    println!("unknown subsection of name section: {}", id);
                    self.read_bytes(size as usize);
                }
            };
        }
        Ok(section)
    }

    fn read_name_map(&mut self) -> Result<NameMap, DecodingError> {
        Ok(NameMap(self.read_vec(|bytes| {
            let idx = bytes.read_u32();
            let name_map = bytes.read_name()?;
            Ok((idx, name_map))
        })?))
    }

    fn read_indirect_name_map(&mut self) -> Result<IndirectNameMap, DecodingError> {
        let mappings = self.read_vec(|bytes| {
            let idx = bytes.read_u32();
            let name_map = bytes.read_name_map()?;
            Ok((idx, name_map))
        })?;
        Ok(IndirectNameMap(mappings))
    }
}

#[derive(Debug, PartialEq, Eq, Clone)]
pub struct TypeSection {
    pub functions: Vec<FuncType>,
}

impl SectionDecoder for TypeSection {
    fn decode_section(bytes: &mut WasmDecoder) -> Result<Self, DecodingError> {
        Ok(Self {
            functions: bytes.read_vec(|bytes| bytes.read_functype()).context("decoding type section")?,
        })
    }
}

#[derive(Debug, PartialEq, Eq, Clone)]
pub struct ImportSection {
    pub imports: Vec<ImportType>,
}

impl SectionDecoder for ImportSection {
    fn decode_section(bytes: &mut WasmDecoder) -> Result<Self, DecodingError> {
        Ok(Self {
            imports: bytes.read_vec(|bytes| bytes.read_import()).context("decoding import section")?,
        })
    }
}

#[derive(Debug, PartialEq, Eq, Clone)]
pub struct FunctionSection {
    pub type_ids: Vec<u32>,
}

impl SectionDecoder for FunctionSection {
    fn decode_section(bytes: &mut WasmDecoder) -> Result<Self, DecodingError> {
        Ok(Self {
            type_ids: bytes.read_vec(|bytes| Ok(bytes.read_u32())).context("decoding function section")?,
        })
    }
}

#[derive(Debug, PartialEq, Eq, Clone)]
pub struct TableSection {
    pub tables: Vec<TableType>,
}

impl SectionDecoder for TableSection {
    fn decode_section(bytes: &mut WasmDecoder) -> Result<Self, DecodingError> {
        Ok(Self {
            tables: bytes.read_vec(|bytes| bytes.read_tabletype()).context("decoding table section")?,
        })
    }
}

#[derive(Debug, PartialEq, Eq, Clone)]
pub struct MemorySection {
    pub memories: Vec<MemType>,
}

impl SectionDecoder for MemorySection {
    fn decode_section(bytes: &mut WasmDecoder) -> Result<Self, DecodingError> {
        Ok(Self {
            memories: bytes.read_vec(|bytes| bytes.read_memtype()).context("decoding memory section")?,
        })
    }
}

#[derive(Debug, PartialEq, Clone)]
pub struct GlobalSection {
    pub globals: Vec<(GlobalType, Expr)>,
}

impl SectionDecoder for GlobalSection {
    fn decode_section(bytes: &mut WasmDecoder) -> Result<Self, DecodingError> {
        Ok(Self {
            globals: bytes.read_vec(|bytes| {
                let global_type = bytes.read_globaltype()?;
                let expr = bytes.read_expr()?;
                Ok((global_type, expr))
            }).context("decoding global section")?,
        })
    }
}

#[derive(Debug, PartialEq, Eq, Clone)]
pub struct ExportSection {
    pub exports: Vec<Export>,
}

impl SectionDecoder for ExportSection {
    fn decode_section(bytes: &mut WasmDecoder) -> Result<Self, DecodingError> {
        Ok(Self {
            exports: bytes.read_vec(|bytes| bytes.read_export()).context("decoding export section")?,
        })
    }
}

#[derive(Debug, PartialEq, Eq, Clone)]
pub struct StartSection {
    pub func_idx: u32,
}

impl SectionDecoder for StartSection {
    fn decode_section(bytes: &mut WasmDecoder) -> Result<Self, DecodingError> {
        Ok(Self {
            func_idx: bytes.read_u32(),
        })
    }
}

#[derive(Debug, PartialEq, Clone)]
pub struct ElementSection {
    pub elements: Vec<Element>,
}

impl SectionDecoder for ElementSection {
    fn decode_section(bytes: &mut WasmDecoder) -> Result<Self, DecodingError> {
        Ok(Self {
            elements: bytes.read_vec(|bytes| bytes.read_element()).context("decoding element section")?,
        })
    }
}

#[derive(Debug, PartialEq, Clone)]
pub struct CodeSection {
    pub codes: Vec<Code>,
}

impl SectionDecoder for CodeSection {
    fn decode_section(bytes: &mut WasmDecoder) -> Result<Self, DecodingError> {
        Ok(Self {
            codes: bytes.read_vec(|bytes| bytes.read_code()).context("decoding code section")?,
        })
    }
}

#[derive(Debug, PartialEq, Clone)]
pub struct DataSection {
    pub datas: Vec<Data>,
}

impl SectionDecoder for DataSection {
    fn decode_section(bytes: &mut WasmDecoder) -> Result<Self, DecodingError> {
        Ok(Self {
            datas: bytes.read_vec(|bytes| bytes.read_data()).context("decoding data section")?,
        })
    }
}

#[derive(Debug, PartialEq, Eq)]
pub struct DataCountSection {
    pub count: u32,
}

impl SectionDecoder for DataCountSection {
    fn decode_section(bytes: &mut WasmDecoder) -> Result<Self, DecodingError> {
        Ok(Self {
            count: bytes.read_u32(),
        })
    }
}
