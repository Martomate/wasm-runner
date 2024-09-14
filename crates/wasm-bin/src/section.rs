use crate::decoder::WasmDecoder;
use crate::{instr::Expr, types::{FuncType, GlobalType, MemoryType, RefType, TableType, ValType}};


#[derive(Debug, PartialEq, Eq)]
enum ImportDesc {
    TypeIdx(u32),
    Table(TableType),
    Memory(MemoryType),
    Global(GlobalType),
}

#[derive(Debug, PartialEq, Eq)]
pub struct ImportType {
    mod_name: String,
    name: String,
    desc: ImportDesc,
}

#[derive(Debug, PartialEq, Eq)]
pub struct Export {
    name: String,
    desc: ExportDesc,
}

#[derive(Debug, PartialEq, Eq)]
enum ExportDesc {
    Func(u32),
    Table(u32),
    Mem(u32),
    Global(u32),
}

#[derive(Debug, PartialEq, Eq)]
pub struct Code {
    size: u32,
    func: (Vec<Locals>, Expr),
}

#[derive(Debug, PartialEq, Eq)]
pub struct Data {
    init: Vec<u8>,
    mode: DataMode,
}

#[derive(Debug, PartialEq, Eq)]
enum DataMode {
    Passive,
    Active { memory: u32, offset: Expr },
}

#[derive(Debug, PartialEq, Eq)]
enum ElementInit {
    Implicit(Vec<u32>),
    Explicit(Vec<Expr>),
}

#[derive(Debug, PartialEq, Eq)]
enum ElementMode {
    Passive,
    Active { table: u32, offset: Expr },
    Declarative,
}

#[derive(Debug, PartialEq, Eq)]
struct Locals {
    n: u32,
    t: ValType,
}

#[derive(Debug, PartialEq, Eq)]
struct Element {
    t: RefType,
    init: ElementInit,
    mode: ElementMode,
}

impl<'a> WasmDecoder<'a> {
    fn read_elemkind(&mut self) -> Result<(), String> {
        if self.read_byte() != 0 {
            return Err("element did not have elementkind 0".into());
        }
        Ok(())
    }

    fn read_element(&mut self) -> Result<Element, String> {
        let kind = self.read_u32();
        let element = match kind {
            0 => {
                let e = self.read_expr()?;
                let y = self.read_vec(|bytes| Ok(bytes.read_u32()))?;
                Element {
                    t: RefType::FuncRef,
                    init: ElementInit::Implicit(y),
                    mode: ElementMode::Active { table: 0, offset: e },
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
                    mode: ElementMode::Active { table: x, offset: e },
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
                    mode: ElementMode::Active { table: 0, offset: e },
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
                    mode: ElementMode::Active { table: x, offset: e },
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
            _ => return Err(format!("unknown element kind: {}", kind)),
        };
        Ok(element)
    }

    fn read_export(&mut self) -> Result<Export, String> {
        let name = self.read_name()?;
        let desc = match self.read_byte() {
            0x00 => ExportDesc::Func(self.read_u32()),
            0x01 => ExportDesc::Table(self.read_u32()),
            0x02 => ExportDesc::Mem(self.read_u32()),
            0x03 => ExportDesc::Global(self.read_u32()),
            b => return Err(format!("invalid export desc variant: {}", b)),
        };
        Ok(Export { name, desc })
    }

    fn read_locals(&mut self) -> Result<Locals, String> {
        let n = self.read_u32();
        let t = self.read_val_type()?;
        Ok(Locals { n, t })
    }

    fn read_code(&mut self) -> Result<Code, String> {
        let size = self.read_u32();
        let locals = self.read_vec(Self::read_locals)?;
        let expr = self.read_expr()?;
        Ok(Code { size, func: (locals, expr) })
    }

    fn read_data(&mut self) -> Result<Data, String> {
        let data = match self.read_u32() {
            0 => {
                let e = self.read_expr()?;
                let b = self.read_vec(|bytes| Ok(bytes.read_byte()))?;
                Data { init: b, mode: DataMode::Active { memory: 0, offset: e } }
            }
            1 => {
                let b = self.read_vec(|bytes| Ok(bytes.read_byte()))?;
                Data { init: b, mode: DataMode::Passive }
            }
            2 => {
                let x = self.read_u32();
                let e = self.read_expr()?;
                let b = self.read_vec(|bytes| Ok(bytes.read_byte()))?;
                Data { init: b, mode: DataMode::Active { memory: x, offset: e } }
            }
            b => return Err(format!("invalid data variant: {}", b)),
        };
        Ok(data)
    }

}

#[derive(Debug, PartialEq, Eq)]
pub enum Section {
    Custom(CustomSection),
    Type(TypeSection),
    Import(ImportSection),
    Function(FunctionSection),
    Table(TableSection),
    Memory(MemorySection),
    Global(GlobalSecion),
    Export(ExportSection),
    Element(ElementSection),
    Code(CodeSection),
    Data(DataSection),
}

impl Section {
    pub fn decode(id: u8, bytes: &mut WasmDecoder) -> Result<Section, String> {
        let section = match id {
            0 => CustomSection::decode_section(bytes).map(Section::Custom)?,
            1 => TypeSection::decode_section(bytes).map(Section::Type)?,
            2 => ImportSection::decode_section(bytes).map(Section::Import)?,
            3 => FunctionSection::decode_section(bytes).map(Section::Function)?,
            4 => TableSection::decode_section(bytes).map(Section::Table)?,
            5 => MemorySection::decode_section(bytes).map(Section::Memory)?,
            6 => GlobalSecion::decode_section(bytes).map(Section::Global)?,
            7 => ExportSection::decode_section(bytes).map(Section::Export)?,
            8 => todo!(),
            9 => ElementSection::decode_section(bytes).map(Section::Element)?,
            10 => CodeSection::decode_section(bytes).map(Section::Code)?,
            11 => DataSection::decode_section(bytes).map(Section::Data)?,
            12 => todo!(),
            _ => return Err(format!("unknwon section id: {id}"))
        };
        Ok(section)
    }
}

pub trait SectionDecoder: Sized {
    fn decode_section(bytes: &mut WasmDecoder) -> Result<Self, String>;
}

#[derive(Debug, PartialEq, Eq)]
pub struct CustomSection {
    name: String, data: Vec<u8>
}

impl SectionDecoder for CustomSection {
    fn decode_section(bytes: &mut WasmDecoder) -> Result<Self, String> {
        Ok(Self {
            name: bytes.read_name()?,
            data: bytes.0.to_owned(),
        })
    }
}

#[derive(Debug, PartialEq, Eq)]
pub struct TypeSection {
    functions: Vec<FuncType>
}

impl SectionDecoder for TypeSection {
    fn decode_section(bytes: &mut WasmDecoder) -> Result<Self, String> {
        Ok(Self { functions: bytes.read_vec(|bytes| bytes.read_functype())? })
    }
}

#[derive(Debug, PartialEq, Eq)]
pub struct ImportSection {
    imports: Vec<ImportType>
}

impl SectionDecoder for ImportSection {
    fn decode_section(bytes: &mut WasmDecoder) -> Result<Self, String> {
        Ok(Self {
            imports: bytes.read_vec(|bytes| {
                let mod_name = bytes.read_name()?;
                let name = bytes.read_name()?;
                
                let kind = bytes.read_byte();
                let desc = match kind {
                    0x00 => ImportDesc::TypeIdx(bytes.read_u32()),
                    0x01 => ImportDesc::Table(bytes.read_tabletype()?),
                    0x02 => ImportDesc::Memory(bytes.read_memtype()?),
                    0x03 => ImportDesc::Global(bytes.read_globaltype()?),
                    _ => return Err(format!("invalid importdesc kind: {}", kind)),
                };

                Ok(ImportType { mod_name, name, desc })
            })?
        })
    }
}

#[derive(Debug, PartialEq, Eq)]
pub struct FunctionSection {
    type_ids: Vec<u32>
}

impl SectionDecoder for FunctionSection {
    fn decode_section(bytes: &mut WasmDecoder) -> Result<Self, String> {
        Ok(Self {type_ids: bytes.read_vec(|bytes| Ok(bytes.read_u32()))?})
    }
}

#[derive(Debug, PartialEq, Eq)]
pub struct TableSection {
    tables: Vec<TableType>
}

impl SectionDecoder for TableSection {
    fn decode_section(bytes: &mut WasmDecoder) -> Result<Self, String> {
        Ok(Self { 
            tables: bytes.read_vec(|bytes| bytes.read_tabletype())?,
        })
    }
}

#[derive(Debug, PartialEq, Eq)]
pub struct MemorySection {
    memories: Vec<MemoryType>
}

impl SectionDecoder for MemorySection {
    fn decode_section(bytes: &mut WasmDecoder) -> Result<Self, String> {
        Ok(Self { 
            memories: bytes.read_vec(|bytes| bytes.read_memtype())?,
        })
    }
}

#[derive(Debug, PartialEq, Eq)]
pub struct GlobalSecion {
    globals: Vec<(GlobalType, Expr)>
}

impl SectionDecoder for GlobalSecion {
    fn decode_section(bytes: &mut WasmDecoder) -> Result<Self, String> {
        Ok(Self { 
            globals: bytes.read_vec(|bytes| {
                let global_type = bytes.read_globaltype()?;
                let expr = bytes.read_expr()?;
                Ok((global_type, expr))
            })?,
        })
    }
}

#[derive(Debug, PartialEq, Eq)]
pub struct ExportSection {
    exports: Vec<Export>
}

impl SectionDecoder for ExportSection {
    fn decode_section(bytes: &mut WasmDecoder) -> Result<Self, String> {
        Ok(Self { 
            exports: bytes.read_vec(|bytes| bytes.read_export())?,
        })
    }
}

#[derive(Debug, PartialEq, Eq)]
pub struct ElementSection {
    elements: Vec<Element>
}

impl SectionDecoder for ElementSection {
    fn decode_section(bytes: &mut WasmDecoder) -> Result<Self, String> {
        Ok(Self { 
            elements: bytes.read_vec(|bytes| bytes.read_element())?,
        })
    }
}

#[derive(Debug, PartialEq, Eq)]
pub struct CodeSection {
    codes: Vec<Code>
}

impl SectionDecoder for CodeSection {
    fn decode_section(bytes: &mut WasmDecoder) -> Result<Self, String> {
        Ok(Self { 
            codes: bytes.read_vec(|bytes| bytes.read_code())?,
        })
    }
}

#[derive(Debug, PartialEq, Eq)]
pub struct DataSection {
    datas: Vec<Data>
}

impl SectionDecoder for DataSection {
    fn decode_section(bytes: &mut WasmDecoder) -> Result<Self, String> {
        Ok(Self { 
            datas: bytes.read_vec(|bytes| bytes.read_data())?,
        })
    }
}
