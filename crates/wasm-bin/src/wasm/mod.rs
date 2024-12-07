pub mod instr;

#[derive(Debug, PartialEq, Eq, Clone)]
pub struct FuncType {
    pub params: ResultType,
    pub returns: ResultType,
}

pub type ResultType = Vec<ValType>;

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

pub struct Func {
    pub type_idx: TypeIdx,
    pub locals: Vec<ValType>,
    pub body: Expr,
}

type Expr = Vec<instr::Instr>;

pub struct Table {
    pub table_type: TableType,
}

#[derive(Debug, PartialEq, Eq, Clone)]
pub struct TableType {
    pub limits: Limits,
    pub ref_type: RefType,
}

#[derive(Debug, PartialEq, Eq, Clone)]
pub enum Limits {
    Min(u32),
    MinMax(u32, u32),
}

impl Limits {
    pub fn min(&self) -> u32 {
        match self {
            Limits::Min(v) => *v,
            Limits::MinMax(v, _) => *v,
        }
    }

    pub fn max(&self) -> Option<u32> {
        match self {
            Limits::Min(_) => None,
            Limits::MinMax(_, v) => Some(*v),
        }
    }
}

pub struct Mem {
    pub mem_type: MemType,
}

#[derive(Debug, PartialEq, Eq, Clone)]
pub struct MemType {
    pub limits: Limits,
}

pub struct Global {
    pub global_type: GlobalType,
    pub init: Expr,
}

#[derive(Debug, PartialEq, Eq, Clone)]
pub struct GlobalType {
    pub mutable: bool,
    pub val_type: ValType,
}

pub struct Elem {
    pub elem_type: RefType,
    pub init: Vec<Expr>,
    pub mode: ElemMode,
}

pub enum ElemMode {
    Passive,
    Active { table_idx: TableIdx, offset: Expr },
    Declarative,
}

pub struct Data {
    pub init: Vec<u8>,
    pub mode: DataMode,
}

pub enum DataMode {
    Passive,
    Active { memory: MemIdx, offset: Expr },
}

pub struct Start {
    pub func_idx: FuncIdx,
}

pub struct Import {
    pub module: Name,
    pub name: Name,
    pub desc: ImportDesc,
}

#[derive(Debug, PartialEq, Eq, Clone)]
pub enum ImportDesc {
    Func(TypeIdx),
    Table(TableType),
    Mem(MemType),
    Global(GlobalType),
}

pub type Name = String;

#[derive(Debug, PartialEq, Eq, Clone)]
pub struct Export {
    pub name: Name,
    pub desc: ExportDesc,
}

#[derive(Debug, PartialEq, Eq, Clone)]
pub enum ExportDesc {
    Func(FuncIdx),
    Table(TableIdx),
    Mem(MemIdx),
    Global(GlobalIdx),
}

#[derive(Debug, PartialEq, Eq, Clone, Copy)]
pub struct TypeIdx(pub u32);

#[derive(Debug, PartialEq, Eq, Clone, Copy)]
pub struct FuncIdx(pub u32);

#[derive(Debug, PartialEq, Eq, Clone, Copy)]
pub struct TableIdx(pub u32);

#[derive(Debug, PartialEq, Eq, Clone, Copy)]
pub struct MemIdx(pub u32);

#[derive(Debug, PartialEq, Eq, Clone, Copy)]
pub struct GlobalIdx(pub u32);

#[derive(Debug, PartialEq, Eq, Clone, Copy)]
pub struct ElemIdx(pub u32);

#[derive(Debug, PartialEq, Eq, Clone, Copy)]
pub struct DataIdx(pub u32);

#[derive(Debug, PartialEq, Eq, Clone, Copy)]
pub struct LocalIdx(pub u32);

#[derive(Debug, PartialEq, Eq, Clone, Copy)]
pub struct LabelIdx(pub u32);

pub struct Module {
    pub types: Vec<FuncType>,
    pub funcs: Vec<Func>,
    pub tables: Vec<Table>,
    pub mems: Vec<Mem>,
    pub globals: Vec<Global>,
    pub elems: Vec<Elem>,
    pub datas: Vec<Data>,
    pub start: Option<Start>,
    pub imports: Vec<Import>,
    pub exports: Vec<Export>,
}

impl Module {
    pub fn get_type(&self, idx: TypeIdx) -> &FuncType {
        &self.types[idx.0 as usize]
    }

    pub fn get_func(&self, idx: FuncIdx) -> &Func {
        &self.funcs[idx.0 as usize]
    }

    pub fn get_table(&self, idx: TableIdx) -> &Table {
        &self.tables[idx.0 as usize]
    }

    pub fn get_mem(&self, idx: MemIdx) -> &Mem {
        &self.mems[idx.0 as usize]
    }

    pub fn get_global(&self, idx: GlobalIdx) -> &Global {
        &self.globals[idx.0 as usize]
    }

    pub fn get_elem(&self, idx: ElemIdx) -> &Elem {
        &self.elems[idx.0 as usize]
    }

    pub fn get_data(&self, idx: DataIdx) -> &Data {
        &self.datas[idx.0 as usize]
    }
}
