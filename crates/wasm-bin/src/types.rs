use crate::{decoder::WasmDecoder, error::DecodingError};

#[derive(Debug, PartialEq, Eq, Clone)]
pub enum NumType {
    I32,
    I64,
    F32,
    F64,
}

#[derive(Debug, PartialEq, Eq, Clone)]
pub enum VecType {
    V128,
}

#[derive(Debug, PartialEq, Eq, Clone)]
pub enum RefType {
    FuncRef,
    ExternRef,
}

#[derive(Debug, PartialEq, Eq, Clone)]
pub enum ValType {
    Num(NumType),
    Vec(VecType),
    Ref(RefType),
}

#[derive(Debug, PartialEq, Eq, Clone)]
pub struct ResultType(pub Vec<ValType>);

#[derive(Debug, PartialEq, Eq, Clone)]
pub struct FuncType {
    pub params: ResultType,
    pub returns: ResultType,
}

#[derive(Debug, PartialEq, Eq, Clone)]
pub enum Limits {
    Min(u32),
    MinMax(u32, u32),
}

#[derive(Debug, PartialEq, Eq, Clone)]
pub struct MemoryType(pub Limits);

#[derive(Debug, PartialEq, Eq, Clone)]
pub struct TableType(pub RefType, pub Limits);

#[derive(Debug, PartialEq, Eq, Clone)]
pub struct GlobalType {
    pub t: ValType,
    pub mutable: bool,
}

impl<'a> WasmDecoder<'a> {
    pub fn read_functype(&mut self) -> Result<FuncType, DecodingError> {
        if self.read_u32() != 0x60 {
            Err("functype did not start with 0x60")?;
        }
        let params = self.read_result_type()?;
        let returns = self.read_result_type()?;

        Ok(FuncType { params, returns })
    }

    pub fn read_result_type(&mut self) -> Result<ResultType, DecodingError> {
        let num_vals = self.read_u32() as usize;
        let mut val_types = Vec::with_capacity(num_vals);
        for _ in 0..num_vals {
            val_types.push(self.read_val_type()?);
        }
        Ok(ResultType(val_types))
    }

    pub fn read_val_type(&mut self) -> Result<ValType, DecodingError> {
        let b = self.read_byte();
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

    pub fn read_reftype(&mut self) -> Result<RefType, DecodingError> {
        let res = match self.read_byte() {
            0x70 => RefType::FuncRef,
            0x6F => RefType::ExternRef,
            b => Err(format!("invalid reftype: {}", b))?,
        };
        Ok(res)
    }

    pub fn read_limits(&mut self) -> Result<Limits, DecodingError> {
        let limit_kind = self.read_byte();
        let limits = match limit_kind {
            0x00 => Limits::Min(self.read_u32()),
            0x01 => Limits::MinMax(self.read_u32(), self.read_u32()),
            _ => Err(format!("invalid limit kind: {}", limit_kind))?,
        };
        Ok(limits)
    }

    pub fn read_tabletype(&mut self) -> Result<TableType, DecodingError> {
        let b = self.read_byte();
        let ref_type = match b {
            0x70 => RefType::FuncRef,
            0x6F => RefType::ExternRef,
            _ => Err(format!("invalid reftype: {}", b))?,
        };

        let limits = self.read_limits()?;

        Ok(TableType(ref_type, limits))
    }

    pub fn read_memtype(&mut self) -> Result<MemoryType, DecodingError> {
        let limits = self.read_limits()?;
        Ok(MemoryType(limits))
    }

    pub fn read_globaltype(&mut self) -> Result<GlobalType, DecodingError> {
        let val_type = self.read_val_type()?;
        let mutable = match self.read_byte() {
            0x00 => false,
            0x01 => true,
            b => Err(format!("invalid mut byte in globaltype: {}", b))?,
        };
        Ok(GlobalType {
            t: val_type,
            mutable,
        })
    }
}
