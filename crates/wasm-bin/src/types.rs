use crate::decoder::WasmDecoder;


#[derive(Debug, PartialEq, Eq)]
pub enum NumType {
    I32,
    I64,
    F32,
    F64,
}

#[derive(Debug, PartialEq, Eq)]
pub enum VecType {
    V128,
}

#[derive(Debug, PartialEq, Eq)]
pub enum RefType {
    FuncRef,
    ExternRef,
}

#[derive(Debug, PartialEq, Eq)]
pub enum ValType {
    Num(NumType),
    Vec(VecType),
    Ref(RefType),
}

#[derive(Debug, PartialEq, Eq)]
pub struct ResultType(pub Vec<ValType>);

#[derive(Debug, PartialEq, Eq)]
pub struct FuncType {
    pub params: ResultType,
    pub returns: ResultType,
}

#[derive(Debug, PartialEq, Eq)]
pub enum Limits {
    Min(u32),
    MinMax(u32, u32),
}

#[derive(Debug, PartialEq, Eq)]
pub struct MemoryType(pub Limits);

#[derive(Debug, PartialEq, Eq)]
pub struct TableType(pub RefType, pub Limits);

#[derive(Debug, PartialEq, Eq)]
pub struct GlobalType {
    pub t: ValType,
    pub mutable: bool,
}

impl<'a> WasmDecoder<'a> {
    pub fn next_functype(&mut self) -> Result<FuncType, String> {
        if self.next_u32() != 0x60 {
            return Err("functype did not start with 0x60".into());
        }
        let params = self.next_result_type()?;
        let returns = self.next_result_type()?;

        Ok(FuncType { params, returns })
    }

    pub fn next_result_type(&mut self) -> Result<ResultType, String> {
        let num_vals = self.next_u32() as usize;
        let mut val_types = Vec::with_capacity(num_vals);
        for _ in 0..num_vals {
            val_types.push(self.next_val_type()?);
        }
        Ok(ResultType(val_types))
    }

    pub fn next_val_type(&mut self) -> Result<ValType, String> {
        let b = self.next_byte();
        let res = match b {
            0x7F => ValType::Num(NumType::I32),
            0x7E => ValType::Num(NumType::I64),
            0x7D => ValType::Num(NumType::F32),
            0x7C => ValType::Num(NumType::F64),
            0x7B => ValType::Vec(VecType::V128),
            0x70 => ValType::Ref(RefType::FuncRef),
            0x6F => ValType::Ref(RefType::ExternRef),
            _ => Err(format!("invalid valtype: {}", b))?,
        };
        Ok(res)
    }

    pub fn next_reftype(&mut self) -> Result<RefType, String> {
        let res = match self.next_byte() {
            0x70 => RefType::FuncRef,
            0x6F => RefType::ExternRef,
            b => Err(format!("invalid reftype: {}", b))?,
        };
        Ok(res)
    }

    pub fn next_limits(&mut self) -> Result<Limits, String> {
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

    pub fn next_tabletype(&mut self) -> Result<TableType, String> {
        let b = self.next_byte();
        let ref_type = match b {
            0x70 => RefType::FuncRef,
            0x6F => RefType::ExternRef,
            _ => return Err(format!("invalid reftype: {}", b)),
        };

        let limits = self.next_limits()?;

        Ok(TableType(ref_type, limits))
    }

    pub fn next_memtype(&mut self) -> Result<MemoryType, String> {
        let limits = self.next_limits()?;
        Ok(MemoryType(limits))
    }

    pub fn next_globaltype(&mut self) -> Result<GlobalType, String> {
        let val_type = self.next_val_type()?;
        let mutable = match self.next_byte() {
            0x00 => false,
            0x01 => true,
            b => return Err(format!("invalid mut byte in globaltype: {}", b)),
        };
        Ok(GlobalType { t: val_type, mutable })
    }
}
