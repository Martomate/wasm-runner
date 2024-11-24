mod error;
pub mod instr;
pub mod section;
pub mod types;
mod values;

use error::DecodingError;
use section::*;
use types::FuncType;

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

pub fn decode_bytes(mut b: &[u8]) -> Result<WasmModule, String> {
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

    Ok(wasm_file)
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

    pub fn get_function_type_idx(&self, function_idx: u32) -> Option<u32> {
        let s = self.function_section.as_ref()?;
        Some(s.type_ids[function_idx as usize])
    }

    pub fn get_function_type(&self, type_idx: u32) -> Option<&FuncType> {
        let s = self.type_section.as_ref()?;
        s.functions.get(type_idx as usize)
    }

    pub fn get_import_by_name(&self, mod_name: &str, name: &str) -> Option<&ImportType> {
        let s = self.import_section.as_ref()?;
        s.imports
            .iter()
            .find(|import| import.mod_name == mod_name && import.name == name)
    }

    pub fn get_export_by_name(&self, name: &str) -> Option<&Export> {
        let s = self.export_section.as_ref()?;
        s.exports.iter().find(|e| e.name == name)
    }

    pub fn get_code(&self, function_idx: u32) -> Option<&Code> {
        let s = self.code_section.as_ref()?;
        s.codes.get(function_idx as usize)
    }

    pub fn num_imports(&self) -> usize {
        if let Some(s) = &self.import_section {
            s.imports.len()
        } else {
            0
        }
    }
}
