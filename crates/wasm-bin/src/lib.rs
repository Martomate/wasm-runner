use decoder::WasmDecoder;
use section::*;

mod decoder;
mod error;
mod instr;
pub mod run;
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

#[derive(Debug, PartialEq)]
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
