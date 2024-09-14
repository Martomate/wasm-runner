use crate::*;


pub trait SectionDecoder: Sized {
    fn decode_section(bytes: &mut WasmBytes) -> Result<Self, String>;
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
    pub fn decode<S: SectionDecoder + Into<Section>>(bytes: &mut WasmBytes) -> Result<Section, String> {
        Ok(S::decode_section(bytes)?.into())
    }
}

impl From<CustomSection> for Section {
    fn from(val: CustomSection) -> Self {
        Section::Custom(val)
    }
}

impl From<TypeSection> for Section {
    fn from(val: TypeSection) -> Self {
        Section::Type(val)
    }
}

impl From<ImportSection> for Section {
    fn from(val: ImportSection) -> Self {
        Section::Import(val)
    }
}

impl From<FunctionSection> for Section {
    fn from(val: FunctionSection) -> Self {
        Section::Function(val)
    }
}

impl From<TableSection> for Section {
    fn from(val: TableSection) -> Self {
        Section::Table(val)
    }
}

impl From<MemorySection> for Section {
    fn from(val: MemorySection) -> Self {
        Section::Memory(val)
    }
}

impl From<GlobalSecion> for Section {
    fn from(val: GlobalSecion) -> Self {
        Section::Global(val)
    }
}

impl From<ExportSection> for Section {
    fn from(val: ExportSection) -> Self {
        Section::Export(val)
    }
}

impl From<ElementSection> for Section {
    fn from(val: ElementSection) -> Self {
        Section::Element(val)
    }
}

impl From<CodeSection> for Section {
    fn from(val: CodeSection) -> Self {
        Section::Code(val)
    }
}

impl From<DataSection> for Section {
    fn from(val: DataSection) -> Self {
        Section::Data(val)
    }
}

#[derive(Debug, PartialEq, Eq)]
pub struct CustomSection {
    name: String, data: Vec<u8>
}

impl SectionDecoder for CustomSection {
    fn decode_section(bytes: &mut WasmBytes) -> Result<Self, String> {
        Ok(Self {
            name: bytes.next_name()?,
            data: bytes.0.to_owned(),
        })
    }
}

#[derive(Debug, PartialEq, Eq)]
pub struct TypeSection {
    functions: Vec<FuncType>
}

impl SectionDecoder for TypeSection {
    fn decode_section(bytes: &mut WasmBytes) -> Result<Self, String> {
        Ok(Self { functions: bytes.read_vec(|bytes| bytes.next_functype())? })
    }
}

#[derive(Debug, PartialEq, Eq)]
pub struct ImportSection {
    imports: Vec<ImportType>
}

impl SectionDecoder for ImportSection {
    fn decode_section(bytes: &mut WasmBytes) -> Result<Self, String> {
        Ok(Self {
            imports: bytes.read_vec(|bytes| {
                let mod_name = bytes.next_name()?;
                let name = bytes.next_name()?;
                
                let kind = bytes.next_byte();
                let desc = match kind {
                    0x00 => ImportDesc::TypeIdx(bytes.next_u32()),
                    0x01 => ImportDesc::Table(bytes.next_tabletype()?),
                    0x02 => ImportDesc::Memory(bytes.next_memtype()?),
                    0x03 => ImportDesc::Global(bytes.next_globaltype()?),
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
    fn decode_section(bytes: &mut WasmBytes) -> Result<Self, String> {
        Ok(Self {type_ids: bytes.read_vec(|bytes| Ok(bytes.next_u32()))?})
    }
}

#[derive(Debug, PartialEq, Eq)]
pub struct TableSection {
    tables: Vec<TableType>
}

impl SectionDecoder for TableSection {
    fn decode_section(bytes: &mut WasmBytes) -> Result<Self, String> {
        Ok(Self { 
            tables: bytes.read_vec(|bytes| bytes.next_tabletype())?,
        })
    }
}

#[derive(Debug, PartialEq, Eq)]
pub struct MemorySection {
    memories: Vec<MemoryType>
}

impl SectionDecoder for MemorySection {
    fn decode_section(bytes: &mut WasmBytes) -> Result<Self, String> {
        Ok(Self { 
            memories: bytes.read_vec(|bytes| bytes.next_memtype())?,
        })
    }
}

#[derive(Debug, PartialEq, Eq)]
pub struct GlobalSecion {
    globals: Vec<(GlobalType, Expr)>
}

impl SectionDecoder for GlobalSecion {
    fn decode_section(bytes: &mut WasmBytes) -> Result<Self, String> {
        Ok(Self { 
            globals: bytes.read_vec(|bytes| {
                let global_type = bytes.next_globaltype()?;
                let expr = bytes.next_expr()?;
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
    fn decode_section(bytes: &mut WasmBytes) -> Result<Self, String> {
        Ok(Self { 
            exports: bytes.read_vec(|bytes| bytes.next_export())?,
        })
    }
}

#[derive(Debug, PartialEq, Eq)]
pub struct ElementSection {
    elements: Vec<Element>
}

impl SectionDecoder for ElementSection {
    fn decode_section(bytes: &mut WasmBytes) -> Result<Self, String> {
        Ok(Self { 
            elements: bytes.read_vec(|bytes| bytes.next_element())?,
        })
    }
}

#[derive(Debug, PartialEq, Eq)]
pub struct CodeSection {
    codes: Vec<Code>
}

impl SectionDecoder for CodeSection {
    fn decode_section(bytes: &mut WasmBytes) -> Result<Self, String> {
        Ok(Self { 
            codes: bytes.read_vec(|bytes| bytes.next_code())?,
        })
    }
}

#[derive(Debug, PartialEq, Eq)]
pub struct DataSection {
    datas: Vec<Data>
}

impl SectionDecoder for DataSection {
    fn decode_section(bytes: &mut WasmBytes) -> Result<Self, String> {
        Ok(Self { 
            datas: bytes.read_vec(|bytes| bytes.next_data())?,
        })
    }
}
