pub struct Wasm {}

#[derive(Debug, PartialEq, Eq)]
enum RefType {
    FuncRef,
    ExternRef,
}

#[derive(Debug, PartialEq, Eq)]
enum NumType {
    I32,
    I64,
    F32,
    F64,
}

#[derive(Debug, PartialEq, Eq)]
enum ValType {
    Num(NumType),
    Vec,
    Ref(RefType),
}

#[derive(Debug, PartialEq, Eq)]
enum Instr {
    LocalGet(i32),
    I32Const(i32),
    I32Add,
}

#[derive(Debug, PartialEq, Eq)]
pub struct Expr(Vec<Instr>);

#[derive(Debug, PartialEq, Eq)]
pub struct MemoryType(Limits);

#[derive(Debug, PartialEq, Eq)]
pub struct GlobalType {
    t: ValType,
    mutable: bool,
}

#[derive(Debug, PartialEq, Eq)]
enum ImportDesc {
    TypeIdx(u32),
    Table(TableType),
    Memory(MemoryType),
    Global(GlobalType),
}

#[derive(Debug, PartialEq, Eq)]
struct ResultType(Vec<ValType>);

#[derive(Debug, PartialEq, Eq)]
pub struct FuncType {
    params: ResultType,
    returns: ResultType,
}

#[derive(Debug, PartialEq, Eq)]
enum Limits {
    Min(u32),
    MinMax(u32, u32),
}

#[derive(Debug, PartialEq, Eq)]
pub struct TableType(RefType, Limits);

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
struct Locals {
    n: u32,
    t: ValType,
}

#[derive(Debug, PartialEq, Eq)]
pub enum Section {
    Custom { name: String, data: Vec<u8> },
    Type { functions: Vec<FuncType> },
    Import { imports: Vec<ImportType> },
    Function { type_ids: Vec<u32> },
    Table { tables: Vec<TableType> },
    Memory { memories: Vec<MemoryType> },
    Global { globals: Vec<(GlobalType, Expr)> },
    Export { exports: Vec<Export> },
    Code { codes: Vec<Code> },
}

struct WasmBytes<'a>(&'a [u8]);

impl<'a> WasmBytes<'a> {
    fn next_byte(&mut self) -> u8 {
        let res = self.0[0];
        self.0 = &self.0[1..];
        res
    }
    
    fn next_bytes(&mut self, count: usize) -> &'a [u8] {
        let res = &self.0[..count];
        self.0 = &self.0[count..];
        res
    }

    fn next_u32(&mut self) -> u32 {
        if self.0[0] & 0b_1000_0000 == 0 {
            let res = self.0[0] as u32;
            self.0 = &self.0[1..];
            return res;
        }
        panic!("large u32 not supported yet");
    }

    fn next_i32(&mut self) -> i32 {
        let b = self.next_byte();

        if b & 0b_1100_0000 == 0 {
            b as i32
        } else if b & 0b_1000_0000 == 0 {
            (b as i32) - 0b_1000_0000
        } else {
            ((b as i32) & !0b_1000_0000) | (self.next_i32() << 7)
        }
    }

    fn next_name(&mut self) -> Result<String, String> {
        let bytes = self.read_vec(|bytes| Ok(bytes.next_byte()))?;
        String::from_utf8(bytes).map_err(|err| err.to_string())
    }

    fn next_result_type(&mut self) -> Result<ResultType, String> {
        let num_vals = self.next_u32() as usize;
        let mut val_types = Vec::with_capacity(num_vals);
        for _ in 0..num_vals {
            val_types.push(self.next_val_type()?);
        }
        Ok(ResultType(val_types))
    }

    fn next_val_type(&mut self) -> Result<ValType, String> {
        let b = self.next_byte();
        let res = match b {
            0x7F => ValType::Num(NumType::I32),
            0x7E => ValType::Num(NumType::I64),
            0x7D => ValType::Num(NumType::F32),
            0x7C => ValType::Num(NumType::F64),
            0x7B => ValType::Vec,
            0x70 => ValType::Ref(RefType::FuncRef),
            0x6F => ValType::Ref(RefType::ExternRef),
            _ => Err(format!("invalid valtype: {}", b))?,
        };
        Ok(res)
    }

    fn next_limits(&mut self) -> Result<Limits, String> {
        let limit_kind = self.next_byte();
        let limits = match limit_kind {
            0x00 => {
                Limits::Min(self.next_u32())
            },
            0x01 => {
                Limits::MinMax(self.next_u32(), self.next_u32())
            },
            _ => return Err(format!("invalid limit kind: {}", limit_kind)),
        };
        Ok(limits)
    }

    fn next_tabletype(&mut self) -> Result<TableType, String> {
        let b = self.next_byte();
        let ref_type = match b {
            0x70 => RefType::FuncRef,
            0x6F => RefType::ExternRef,
            _ => return Err(format!("invalid reftype: {}", b)),
        };

        let limits = self.next_limits()?;

        Ok(TableType(ref_type, limits))
    }

    fn next_memtype(&mut self) -> Result<MemoryType, String> {
        let limits = self.next_limits()?;
        Ok(MemoryType(limits))
    }

    fn next_globaltype(&mut self) -> Result<GlobalType, String> {
        let val_type = self.next_val_type()?;
        let mutable = match self.next_byte() {
            0x00 => false,
            0x01 => true,
            b => return Err(format!("invalid mut byte in globaltype: {}", b)),
        };
        Ok(GlobalType { t: val_type, mutable })
    }

    fn next_export(&mut self) -> Result<Export, String> {
        let name = self.next_name()?;
        let desc = match self.next_byte() {
            0x00 => ExportDesc::Func(self.next_u32()),
            0x01 => ExportDesc::Table(self.next_u32()),
            0x02 => ExportDesc::Mem(self.next_u32()),
            0x03 => ExportDesc::Global(self.next_u32()),
            b => return Err(format!("invalid export desc variant: {}", b)),
        };
        Ok(Export { name, desc })
    }

    fn next_locals(&mut self) -> Result<Locals, String> {
        let n = self.next_u32();
        let t = self.next_val_type()?;
        Ok(Locals { n, t })
    }

    fn next_code(&mut self) -> Result<Code, String> {
        let size = self.next_u32();
        let locals = self.read_vec(Self::next_locals)?;
        let expr = self.next_expr()?;
        Ok(Code { size, func: (locals, expr) })
    }

    fn next_functype(&mut self) -> Result<FuncType, String> {
        if self.next_u32() != 0x60 {
            return Err("functype did not start with 0x60".into());
        }
        let params = self.next_result_type()?;
        let returns = self.next_result_type()?;

        Ok(FuncType { params, returns })
    }

    fn next_instr(&mut self) -> Result<Instr, String> {
        let opcode = self.next_byte();
        let instr = match opcode {
            0x20 => Instr::LocalGet(self.next_i32()),
            0x41 => Instr::I32Const(self.next_i32()),
            0x6A => Instr::I32Add,
            // TODO: add the rest!
            _ => return Err(format!("unknown opcode: 0x{:x}", opcode)),
        };
        Ok(instr)
    }

    fn next_expr(&mut self) -> Result<Expr, String> {
        let mut instructions = Vec::new();
        while self.0[0] != 0x0B {
            instructions.push(self.next_instr()?);
        }
        self.next_byte(); // skip the 0x0B byte (end marker)
        Ok(Expr(instructions))
    }

    fn read_vec<T>(&mut self, f: impl Fn(&mut Self) -> Result<T, String>) -> Result<Vec<T>, String> {
        let len = self.next_byte() as usize;

        let mut items = Vec::with_capacity(len);

        for _ in 0..len {
            items.push(f(self)?);
        }

        Ok(items)
    }

    fn is_empty(&self) -> bool {
        self.0.is_empty()
    }
}

pub fn decode_bytes(mut b: &[u8]) -> Result<Wasm, String> {
    b = b.strip_prefix(&[0x00, 0x61, 0x73, 0x6d]).ok_or("missing magic bytes")?;
    b = b.strip_prefix(&[0x01, 0x00, 0x00, 0x00]).ok_or("missing version number")?;

    let mut raw_sections = Vec::new();

    let mut b = WasmBytes(b);

    while !b.is_empty() {
        let section_id = b.next_byte();
        let section_size = b.next_u32() as usize;
        raw_sections.push((section_id, b.next_bytes(section_size)));
    }

    for (id, bytes) in raw_sections.iter() {
        println!("{}\t{:?}", id, bytes);
    }

    let mut sections: Vec<Section> = Vec::new();

    for (id, bytes) in raw_sections.iter().cloned() {
        let mut bytes = WasmBytes(bytes);
        match id {
            0 => {
                sections.push(Section::Custom {
                    name: bytes.next_name()?,
                    data: bytes.0.to_owned(),
                });
            }
            1 => {
                sections.push(Section::Type {
                    functions: bytes.read_vec(|bytes| bytes.next_functype())?,
                });
            }
            2 => {
                let imports = bytes.read_vec(|bytes| {
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
                })?;

                sections.push(Section::Import { imports });
            }
            3 => {
                sections.push(Section::Function {
                    type_ids: bytes.read_vec(|bytes| Ok(bytes.next_u32()))?,
                });
            }
            4 => {
                sections.push(Section::Table { 
                    tables: bytes.read_vec(|bytes| bytes.next_tabletype())?,
                });
            }
            5 => {
                sections.push(Section::Memory { 
                    memories: bytes.read_vec(|bytes| bytes.next_memtype())?,
                });
            }
            6 => {
                sections.push(Section::Global { 
                    globals: bytes.read_vec(|bytes| {
                        let global_type = bytes.next_globaltype()?;
                        let expr = bytes.next_expr()?;
                        Ok((global_type, expr))
                    })?,
                });
            }
            7 => {
                sections.push(Section::Export { 
                    exports: bytes.read_vec(|bytes| bytes.next_export())?,
                });
            }
            8 => todo!(),
            9 => todo!(),
            10 => {
                sections.push(Section::Code { 
                    codes: bytes.read_vec(|bytes| bytes.next_code())?,
                });
            }
            11 => todo!(),
            12 => todo!(),
            _ => return Err(format!("unknwon section id: {id}"))
        };
    }

    println!("\n");

    for s in sections.iter() {
        println!("{:?}", s);
    }

    println!("\n");

    Ok(Wasm {  })
}

#[cfg(test)]
mod tests {
    mod next_i32 {
        use crate::WasmBytes;

        #[test]
        fn small_positive() {
            let mut bytes = WasmBytes(&[42, 0x3F]);
            assert_eq!(bytes.next_i32(), 42);
            assert_eq!(bytes.next_i32(), 0x3F);
            assert!(bytes.is_empty());
        }

        #[test]
        fn small_negative() {
            let mut bytes = WasmBytes(&[0x40, 0x7F]);
            assert_eq!(bytes.next_i32(), 0x40 - 0x80);
            assert_eq!(bytes.next_i32(), 0x7F - 0x80);
            assert!(bytes.is_empty());
        }

        #[test]
        fn big_positive() {
            let mut bytes = WasmBytes(&[0x80, 42]);
            assert_eq!(bytes.next_i32(), 42 << 7);
            assert!(bytes.is_empty());
            
            let mut bytes = WasmBytes(&[0x80 | 0x4F, 0x80 | 0x0A, 42]);
            assert_eq!(bytes.next_i32(), (42 << 14) | (0x0A << 7) | 0x4F);
            assert!(bytes.is_empty());
        }

        #[test]
        fn example1() {
            let mut bytes = WasmBytes(&[128, 128, 192, 0]);
            assert_eq!(bytes.next_i32(), 1048576);
            assert!(bytes.is_empty());
        }
    }
}
