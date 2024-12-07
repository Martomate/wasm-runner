use super::{
    DataIdx, ElemIdx, FuncIdx, GlobalIdx, LabelIdx, LocalIdx, RefType, TableIdx, TypeIdx,
    ValType,
};

pub enum Signedness {
    U,
    S,
}

pub enum IntType {
    I32,
    I64,
}

pub enum FloatType {
    F32,
    F64,
}

#[derive(Debug, PartialEq, Eq, Clone, Copy)]
pub struct LaneIdx(pub u8);

pub enum IUnOp {
    Clz,
    Ctz,
    PopCnt,
}

pub enum IBinOp {
    Add,
    Sub,
    Mul,
    Div(Signedness),
    Rem(Signedness),
    And,
    Or,
    Xor,
    Shl,
    Shr(Signedness),
    Rotl,
    Rotr,
}

pub enum FUnOp {
    Abs,
    Neg,
    Sqrt,
    Ceil,
    Floor,
    Trunc,
    Nearest,
}

pub enum FBinOp {
    Add,
    Sub,
    Mul,
    Div,
    Min,
    Max,
    CopySign,
}

pub enum ITestOp {
    Eqz,
}

pub enum IRelOp {
    Eq,
    Ne,
    Lt(Signedness),
    Gt(Signedness),
    Le(Signedness),
    Ge(Signedness),
}

pub enum FRelOp {
    Eq,
    Ne,
    Lt,
    Gt,
    Le,
    Ge,
}

pub enum IShape {
    I8X16,
    I16X8,
    I32X4,
    I64X2,
}

pub enum FShape {
    F32X4,
    F64X2,
}

pub enum Half {
    Low,
    High,
}

pub enum VVUnOp {
    Not,
}

pub enum VVBinOp {
    And,
    AndNot,
    Or,
    Xor,
}

pub enum VVTernOp {
    BitSelect,
}

pub enum VVTestOp {
    AnyTrue,
}

pub enum VITestOp {
    AllTrue,
}

pub enum VIRelOp {
    Eq,
    Ne,
    Lt(Signedness),
    Gt(Signedness),
    Le(Signedness),
    Ge(Signedness),
}

pub enum VFRelOp {
    Eq,
    Ne,
    Lt,
    Gt,
    Le,
    Ge,
}

pub enum VIUnOp {
    Abs,
    Neg,
}

pub enum VIBinOp {
    Add,
    Sub,
}

pub enum VIMinMaxOp {
    Min(Signedness),
    Max(Signedness),
}

pub enum VISatBinOp {
    AddSat(Signedness),
    SubSat(Signedness),
}

pub enum VIShiftOp {
    Shl,
    Shr(Signedness),
}

pub enum VFUnOp {
    Abs,
    Neg,
    Sqrt,
    Ceil,
    Floor,
    Trunc,
    Nearest,
}

pub enum VFBinOp {
    Add,
    Sub,
    Mul,
    Div,
    Min,
    Max,
    PMin,
    PMax,
}

pub struct MemArg {
    pub offset: u32,
    pub align: u32,
}

pub enum Width {
    W8,
    W16,
    W32,
    W64,
}

pub enum BlockType {
    Type(TypeIdx),
    Val(Option<ValType>),
}

pub enum Instr {
    I32Const(u32),
    I64Const(u64),
    F32Const(f32),
    F64Const(f64),

    IUnOp(IntType, IUnOp),
    FUnOp(FloatType, FUnOp),
    IBinOp(IntType, IBinOp),
    FBinOp(FloatType, FBinOp),
    ITestOp(IntType, ITestOp),
    IRelOp(IntType, IRelOp),
    FRelOp(FloatType, FRelOp),

    I32Extend8S,
    I32Extend16S,
    I64Extend8S,
    I64Extend16S,
    I64Extend32S,

    I32WrapI64,
    I64ExtendI32(Signedness),

    Trunc(IntType, FloatType, Signedness),
    TruncSat(IntType, FloatType, Signedness),

    F32DemoteF64,
    F64PromoteF32,

    FConvertI(FloatType, IntType, Signedness),
    IReinterpretF(IntType, FloatType),
    FReinterpretI(FloatType, IntType),

    V128Const(i128),

    VVUnOp(VVUnOp),
    VVBinOp(VVBinOp),
    VVTernOp(VVTernOp),
    VVTestOp(VVTestOp),

    I8X16Shuffle([LaneIdx; 16]),
    I8X16Swizzle,

    ISplat(IShape),
    FSplat(FShape),

    I8X16ExtractLane(Signedness, LaneIdx),
    I16X8ExtractLane(Signedness, LaneIdx),
    I32X4ExtractLane(LaneIdx),
    I64X2ExtractLane(LaneIdx),
    FExtractLane(FShape, LaneIdx),

    IReplaceLane(IShape, LaneIdx),
    FReplaceLane(FShape, LaneIdx),

    I8X16VIRelOp(VIRelOp),
    I16X8VIRelOp(VIRelOp),
    I32X4VIRelOp(VIRelOp),
    I64X2Eq,
    I64X2Ne,
    I64X2Lt(Signedness),
    I64X2Gt(Signedness),
    I64X2Le(Signedness),
    I64X2Ge(Signedness),

    VFRelOp(FShape, VFRelOp),
    VIUnOp(IShape, VIUnOp),

    I8X16PopCnt,
    I16X8Q15MulrSatS,
    I32X4DotI16X8S,

    VFUnOp(FShape, VFUnOp),
    VITestOp(IShape, VITestOp),
    Bitmask(IShape),

    I8X16NarrowI16X8(Signedness),
    I16X8NarrowI32X4(Signedness),

    I16X8ExtendHalfI8X16(Signedness),
    I32X4ExtendHalfI16X8(Signedness),
    I64X2ExtendHalfI32X4(Signedness),

    VIShiftOp(IShape, VIShiftOp),
    VIBinOp(IShape, VIBinOp),

    I8X16VIMinMaxOp(VIMinMaxOp),
    I16X8VIMinMaxOp(VIMinMaxOp),
    I32X4VIMinMaxOp(VIMinMaxOp),

    I8X16VISatBinOp(VISatBinOp),
    I16X8VISatBinOp(VISatBinOp),

    I16X8Mul,
    I32X4Mul,
    I64X2Mul,

    I8X16AvgrU,
    I16X8AvgrU,

    I16X8ExtMulI8X16(Half, Signedness),
    I32X4ExtMulI16X8(Half, Signedness),
    I64X2ExtMulI32X4(Half, Signedness),

    I16X8ExtAddPairwiseI8X16(Signedness),
    I32X4ExtAddPairwiseI16X8(Signedness),

    VFBinOp(FShape, VFBinOp),

    I32X4TruncSatF32X4(Signedness),
    I32X4TruncSatF64X2Zero(Signedness),

    F32X4ConvertI32X4(Signedness),
    F32X4DemoteF64X2Zero,
    F64X2ConvertLowI32X4(Signedness),
    F64X2PromoteLowI32X4,

    NullRef(RefType),
    IsNullRef,
    FuncRef(FuncIdx),

    Drop,
    Select(Vec<ValType>),

    LocalGet(LocalIdx),
    LocalSet(LocalIdx),
    LocalTee(LocalIdx),

    GlobalGet(GlobalIdx),
    GlobalSet(GlobalIdx),

    TableGet(TableIdx),
    TableSet(TableIdx),
    TableSize(TableIdx),
    TableGrow(TableIdx),
    TableFill(TableIdx),

    TableCopy(TableIdx, TableIdx),
    TableInit(TableIdx, ElemIdx),

    ElemDrop(ElemIdx),

    ILoad(IntType, MemArg),
    FLoad(FloatType, MemArg),
    V128Load(MemArg),

    IStore(IntType, MemArg),
    FStore(FloatType, MemArg),
    V128Store(MemArg),

    ILoad8(IntType, MemArg, Signedness),
    ILoad16(IntType, MemArg, Signedness),
    I64Load32(MemArg, Signedness),

    IStore8(IntType, MemArg),
    IStore16(IntType, MemArg),
    I64Store32(MemArg),

    V128Load8x8(MemArg, Signedness),
    V128Load16x4(MemArg, Signedness),
    V128Load32x2(MemArg, Signedness),
    V128Load32Zero(MemArg),
    V128Load64Zero(MemArg),
    V128LoadSplat(MemArg, Width),
    V128LoadLane(MemArg, Width, LaneIdx),
    V128StoreLane(MemArg, Width, LaneIdx),

    MemorySize,
    MemoryGrow,
    MemoryFill,
    MemoryCopy,
    MemoryInit(DataIdx),
    DataDrop(DataIdx),

    Nop,
    Unreachable,
    Block(BlockType, Vec<Instr>),
    Loop(BlockType, Vec<Instr>),
    IfElse(BlockType, Vec<Instr>, Vec<Instr>),
    Br(LabelIdx),
    BrIf(LabelIdx),
    BrTable(Vec<LabelIdx>, LabelIdx),
    Return,
    Call(FuncIdx),
    CallIndirect(TableIdx, TypeIdx),
}
