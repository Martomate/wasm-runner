use crate::wasm::instr::Instr;
use crate::wasm::DataMode;
use crate::wasm::ElemMode;
use crate::wasm::ExportDesc;
use crate::wasm::FuncType;
use crate::wasm::ImportDesc;
use crate::wasm::Module;
use crate::wasm::NumType;
use crate::wasm::RefType;
use crate::wasm::ValType;
use crate::wasm::VecType;

mod error;
mod mem;
mod stack;

use error::{ErrorReason, InterpreterError};
use mem::*;
use stack::*;

pub use stack::Value;

type ExternalFunction = Box<dyn Fn(&[Value]) -> Vec<Value>>;

struct ExternalFunctionBinding {
    signature: FuncType,
    handler: ExternalFunction,
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
    wasm: Module,
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
    pub fn create(wasm: &Module) -> Self {
        let mut memories = Vec::new();

        for m in wasm.mems.iter() {
            let limits = m.mem_type.limits.clone();
            memories.push(WasmMemory {
                bytes: std::iter::repeat_n(0, (limits.min() as usize) << 16)
                    .collect(),
                limits,
            });
        }
        for d in wasm.datas.iter() {
            if let DataMode::Active { memory, offset } = &d.mode {
                if offset.len() != 1 {
                    panic!("expected single instr");
                }
                let offset = match offset[0].clone() {
                    Instr::I32Const(v) => v,
                    instr => panic!("unexpected instr: {:?}", instr),
                };
                let offset = offset as u32;
                for (i, v) in d.init.iter().enumerate() {
                    memories[memory.0 as usize].write_byte(offset + i as u32, *v);
                }
            }
        }

        let globals: Vec<WasmGlobal> = wasm
            .globals
            .iter()
            .map(|g| {
                if g.init.len() != 1 {
                    panic!("global did not have exactly 1 instruction, which is not supported yet");
                }
                let value: Value = match &g.init[0] {
                    Instr::I32Const(v) => Value::I32(*v as i32),
                    i => panic!("unsupported instr for global: {:?}", i),
                };
                WasmGlobal {
                    mutable: g.global_type.mutable,
                    value,
                }
            })
            .collect();

        let mut tables: Vec<WasmTable> = wasm.tables
            .iter()
            .map(|table| {
                let value: Ref = match table.table_type.ref_type {
                    RefType::FuncRef => Ref::Func(0),
                    ref t => todo!("{:?}", t),
                };
                WasmTable {
                    elems: std::iter::repeat_n(value, table.table_type.limits.min() as usize).collect(),
                }
            })
            .collect();

        for e in &wasm.elems {
            if let ElemMode::Active { table_idx, offset } = &e.mode {
                if offset.len() != 1 {
                    panic!(
                        "expected 1 instruction for elem offset eval, but got {} ",
                        offset.len()
                    );
                }
                let offset = match &offset[0] {
                    Instr::I32Const(v) => *v,
                    _ => panic!("unsupported instr for active elem"),
                };

                let table = &mut tables[table_idx.0 as usize];
                for (i, instrs) in e.init.iter().enumerate() {
                    match instrs.as_slice() {
                        [Instr::FuncRef(f)] => {
                            table.elems[i + offset as usize] = Ref::Func(f.0);
                        }
                        _ => todo!(),
                    }
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
    pub fn new(wasm: Module) -> Self {
        Self {
            wasm,
            imports: Vec::new(),
        }
    }

    pub fn bind_external_function(
        &mut self,
        mod_name: &str,
        name: &str,
        handler: ExternalFunction,
    ) {
        let import = self.wasm.imports.iter().find(|im| im.module == mod_name && im.name == name).expect("unknown import");

        let f = match import.desc {
            ImportDesc::Func(t_idx) => self.wasm.types.get(t_idx.0 as usize).unwrap(),
            _ => panic!("import must be for a function"),
        };

        self.imports.push(ExternalFunctionBinding {
            signature: f.clone(),
            handler,
        });
    }

    pub fn execute(
        &mut self,
        function_name: &str,
        parameters: Vec<&str>,
        store: &mut Store,
    ) -> Result<String, String> {
        let export = self
            .wasm
            .exports.iter().find(|e| e.name == function_name)
            .ok_or("unknown function")?;
        let ExportDesc::Func(ref function_idx) = export.desc else {
            panic!("not a function");
        };
        let exported_function_idx = function_idx.0 - self.wasm.imports.len() as u32;

        let exported_function = self
            .wasm
            .funcs.get(exported_function_idx as usize)
            .unwrap();
        let exported_function_type_idx = exported_function.type_idx;

        let function = self
            .wasm
            .types.get(exported_function_type_idx.0 as usize)
            .unwrap();

        let param_types = function.params.clone();
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
            .map(|(t, s)| match t {
                ValType::Num(t) => match t {
                    NumType::I32 => Value::I32(s.parse::<i32>().unwrap()),
                    NumType::I64 => Value::I64(s.parse::<i64>().unwrap()),
                    NumType::F32 => Value::F32(s.parse::<f32>().unwrap()),
                    NumType::F64 => Value::F64(s.parse::<f64>().unwrap()),
                },
                t => panic!("parameters of kind {:?} are not supported yet", t),
            })
            .collect();

        let return_types = function.returns.clone();

        let res = self
            .run_code(&exported_function.locals, &exported_function.body, param_values, return_types.len(), store)
            .map_err(|e| {
                e.wrap(ErrorReason::FailedFunction {
                    f_idx: function_idx.0,
                    name: Some(function_name.to_string()),
                })
            })
            .map_err(|e| {
                eprintln!("{:?}", e);
                e.to_string()
            })?;

        Ok(res
            .into_iter()
            .map(|n| n.to_string())
            .collect::<Vec<_>>()
            .join(", "))
    }

    fn run_code(
        &self,
        locals: &[ValType],
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
                .map(|t| match t {
                    ValType::Num(t) => match t {
                        NumType::I32 => Value::I32(0),
                        NumType::I64 => Value::I64(0),
                        NumType::F32 => Value::F32(0.0),
                        NumType::F64 => Value::F64(0.0),
                    },
                    ValType::Vec(t) => match t {
                        VecType::V128 => Value::V128(0),
                    },
                    t => todo!("{:?}", t),
                }),
        );

        for (i, op) in body.iter().enumerate() {
            if let Some(l_idx) = frame.run_instruction(op, self, store, 0).map_err(|e| {
                e.wrap(ErrorReason::FailedInstruction {
                    step: i,
                    instr: op.clone(),
                })
            })? {
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
