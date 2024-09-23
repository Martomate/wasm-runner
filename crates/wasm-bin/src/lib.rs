use std::iter;

use decoder::WasmDecoder;
use instr::{Expr, Instr};
use section::*;
use types::{FuncType, ValType};

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

    for (id, bytes) in raw_sections.iter() {
        println!("{}\t{:?}", id, bytes);
    }

    let mut wasm_file = WasmFile::empty();

    for (id, bytes) in raw_sections.iter().cloned() {
        let mut bytes = WasmDecoder::new(bytes);
        let section = Section::decode(id, &mut bytes)?;
        println!("{:?}", section);
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

    pub fn execute(&mut self, function_name: &str, parameters: Vec<&str>) -> String {
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

        let mut functions = Vec::new();
        for &type_idx in functions_section.type_ids.iter() {
            functions.push(types_section.functions[type_idx as usize].clone());
        }

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

        let code_idx = functions_section
            .type_ids
            .iter()
            .position(|&type_idx| type_idx == exported_function_idx)
            .unwrap();
        let code = self.wasm.code_section.clone().unwrap().codes[code_idx].clone();
        let res = self.run_code(code.func.0, code.func.1, param_values);

        res.into_iter().map(|n| n.to_string()).collect::<Vec<_>>().join(", ")
    }

    fn run_code(&self, locals: Vec<Locals>, body: Expr, parameters: Vec<i32>) -> Vec<i32> {
        let locals: Vec<ValType> = locals
            .into_iter()
            .flat_map(|l| iter::repeat(l.t).take(l.n as usize))
            .collect();

        let mut frame: Vec<i32> = parameters
            .iter()
            .cloned()
            .chain(locals.iter().map(|_| 0))
            .collect();

        let ops = body.0;
        let mut ptr = 0;
        while ptr < ops.len() {
            let op = &ops[ptr];
            ptr += 1;
            match op {
                Instr::LocalGet(idx) => {
                    let val = frame[*idx as usize];
                    frame.push(val);
                }
                Instr::LocalSet(idx) => {
                    let val = frame.pop().unwrap();
                    frame[*idx as usize] = val;
                }
                Instr::LocalTee(idx) => {
                    let val = *frame.last().unwrap();
                    frame[*idx as usize] = val;
                }
                Instr::I32Add => {
                    let a = frame.pop().unwrap();
                    let b = frame.pop().unwrap();
                    frame.push(a + b);
                }
                Instr::I32Const(val) => {
                    frame.push(*val);
                }
                Instr::Call(f_idx) => {
                    if (*f_idx as usize) < self.imports.len() {
                        let ExternalFunctionBinding {
                            signature: ref t,
                            handler: f,
                        } = &self.imports[*f_idx as usize];

                        let num_params = t.params.0.len();
                        let num_returns = t.returns.0.len();

                        let params = frame.split_off(frame.len() - num_params);
                        let returns = f(&params);

                        if returns.len() != num_returns {
                            panic!(
                                "expected {} returns values, but got {}",
                                num_returns,
                                returns.len()
                            );
                        }
                        frame.extend_from_slice(&returns);
                    } else {
                        todo!("call the regular function (using recursion)");
                    }
                }
                op => todo!("instr {:?} not handled yet in interpreter", op),
            }
        }

        frame.split_off(parameters.len())
    }
}
