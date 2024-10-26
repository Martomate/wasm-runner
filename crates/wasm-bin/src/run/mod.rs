use std::iter;

use crate::types::VecType;

use super::instr::Instr;
use super::section::*;
use super::types::{FuncType, NumType, RefType, TableType, ValType};
use super::WasmFile;

mod error;
mod mem;
mod stack;

use error::{ErrorReason, InterpreterError};
use mem::*;
use stack::*;

pub use stack::Value;

struct ExternalFunctionBinding {
    signature: FuncType,
    handler: fn(&[Value]) -> Vec<Value>,
}

struct WasmGlobal {
    mutable: bool,
    value: Value,
}

struct WasmTable {
    elems: Vec<Ref>,
}

#[derive(Debug, PartialEq, Eq, Clone, Copy)]
enum Ref {
    Func(u32),
}

pub struct WasmInterpreter {
    wasm: WasmFile,
    imports: Vec<ExternalFunctionBinding>,
}

pub struct Store {
    memories: Vec<WasmMemory>,
    globals: Vec<WasmGlobal>,
    tables: Vec<WasmTable>,
}

impl Store {
    pub fn access_memory<T>(&mut self, idx: usize, f: impl FnOnce(&mut WasmMemory) -> T) -> T {
        f(&mut self.memories[idx])
    }
}

impl Store {
    pub fn create(wasm: &WasmFile) -> Self {
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

        let globals: Vec<WasmGlobal> = wasm
            .global_section
            .clone()
            .unwrap_or_else(|| GlobalSection { globals: vec![] })
            .globals
            .iter()
            .map(|(g, e)| {
                if e.0.len() != 1 {
                    panic!("global did not have exactly 1 instruction, which is not supported yet");
                }
                let value: Value = match &e.0[0] {
                    Instr::I32Const(v) => Value::I32(*v),
                    i => panic!("unsupported instr for global: {:?}", i),
                };
                WasmGlobal {
                    mutable: g.mutable,
                    value,
                }
            })
            .collect();

        let tables = wasm
            .table_section
            .clone()
            .unwrap_or_else(|| TableSection { tables: vec![] })
            .tables;

        let mut tables: Vec<WasmTable> = tables
            .iter()
            .map(|table| {
                let TableType(t, l) = table;
                let value: Ref = match t {
                    RefType::FuncRef => Ref::Func(0),
                    t => todo!("{:?}", t),
                };
                WasmTable {
                    elems: iter::repeat(value).take(l.min() as usize).collect(),
                }
            })
            .collect();

        let elements = wasm
            .element_section
            .clone()
            .unwrap_or_else(|| ElementSection { elements: vec![] })
            .elements;
        for e in elements {
            if let ElementMode::Active { table, offset } = e.mode {
                if offset.0.len() != 1 {
                    panic!(
                        "expected 1 instruction for elem offset eval, but got {} ",
                        offset.0.len()
                    );
                }
                let offset = match &offset.0[0] {
                    Instr::I32Const(v) => *v,
                    _ => panic!("unsupported instr for active elem"),
                };

                match &e.init {
                    ElementInit::Implicit(fns) => {
                        let table = &mut tables[table as usize];
                        for (i, &f) in fns.iter().enumerate() {
                            table.elems[i + offset as usize] = Ref::Func(f)
                        }
                    }
                    ElementInit::Explicit(_) => todo!(),
                }
            }
        }

        Self {
            memories,
            globals,
            tables,
        }
    }
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
        store: &mut Store,
    ) -> Result<String, String> {
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
        let ExportDesc::Func(function_idx) = exports
            .iter()
            .find(|e| e.name == function_name)
            .ok_or("unknown function")?
            .desc
        else {
            panic!("not a function");
        };
        let exported_function_idx = function_idx
            - self
                .wasm
                .import_section
                .as_ref()
                .map(|s| s.imports.len() as u32)
                .unwrap_or(0);

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
                match t {
                    ValType::Num(t) => match t {
                        NumType::I32 => Value::I32(s.parse::<i32>().unwrap()),
                        NumType::I64 => Value::I64(s.parse::<i64>().unwrap()),
                        NumType::F32 => Value::F32(s.parse::<f32>().unwrap()),
                        NumType::F64 => Value::F64(s.parse::<f64>().unwrap()),
                    },
                    t => panic!("parameters of kind {:?} are not supported yet", t),
                }
            })
            .collect();

        let return_types = function.returns.0.clone();

        let Code {
            func: (locals, body),
            size: _,
        } = self.wasm.code_section.clone().unwrap().codes[exported_function_idx as usize].clone();

        let res = self
            .run_code(&locals, &body.0, param_values, return_types.len(), store)
            .map_err(|e| e.wrap(ErrorReason::FailedFunction { f_idx: function_idx, name: Some(function_name.to_string()) }))
            .map_err(|e| {
                eprintln!("{:?}", e);
                e.to_string()
            })?;

        Ok(res.into_iter()
            .map(|n| n.to_string())
            .collect::<Vec<_>>()
            .join(", "))
    }

    fn run_code(
        &self,
        locals: &[Locals],
        body: &[Instr],
        parameters: Vec<Value>,
        num_returns_values: usize,
        store: &mut Store,
    ) -> Result<Vec<Value>, InterpreterError> {
        let mut frame = StackFrame::new();
        frame.push_all(parameters);
        frame.push_all(
            locals
                .iter()
                .flat_map(|l| iter::repeat(l.t.clone()).take(l.n as usize))
                .map(|t| match t {
                    ValType::Num(t) => match t {
                        NumType::I32 => Value::I32(0),
                        NumType::I64 => Value::I64(0),
                        NumType::F32 => Value::F32(0.0),
                        NumType::F64 => Value::F64(0.0),
                    },
                    ValType::Vec(t) => match t {
                        VecType::V128 => Value::V128(0),
                    }
                    t => todo!("{:?}", t),
                }),
        );

        for (i, op) in body.iter().enumerate() {
            if let Some(l_idx) = frame
                .run_instruction(op, self, store, 0)
                .map_err(|e| e.wrap(ErrorReason::FailedInstruction { step: i, instr: op.clone() }))?
            {
                if l_idx != 0 {
                    panic!("cannot branch out of function, expected 0, got {}", l_idx);
                }
                break;
            }
        }

        let returns = frame.split_off(frame.len() - num_returns_values)?;
        Ok(returns)
    }
}
