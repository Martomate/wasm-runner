use std::{error::Error, fmt::Display};

use crate::wasm::instr::Instr;

pub struct InterpreterError {
    reason: ErrorReason,
    cause: Option<Box<InterpreterError>>,
}

impl InterpreterError {
    pub fn new(reason: ErrorReason) -> Self {
        Self {
            reason,
            cause: None,
        }
    }

    pub fn wrap(self, reason: ErrorReason) -> Self {
        Self {
            reason,
            cause: Some(Box::new(self)),
        }
    }
}

#[derive(Debug)]
pub enum ErrorReason {
    InvalidStack(StackError),
    FailedInstruction { step: usize, instr: Instr },
    FailedFunction { f_idx: u32, name: Option<String> },
    UnsupportedInstruction { instr: Instr },
}

fn instr_to_short_str(instr: &Instr) -> String {
    match instr {
        Instr::Block(_, _) => "Block".to_string(),
        Instr::Loop(_, _) => "Loop".to_string(),
        instr => format!("{:?}", instr),
    }
}

impl Display for ErrorReason {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            ErrorReason::InvalidStack(err) => write!(f, "invalid stack: {}", err),
            ErrorReason::FailedInstruction { step, instr } => {
                write!(
                    f,
                    "instruction {} failed: {}",
                    step,
                    instr_to_short_str(instr)
                )
            }
            ErrorReason::FailedFunction { f_idx: idx, name } => {
                write!(f, "function failed: {}", idx)?;
                if let Some(name) = name {
                    write!(f, " ({})", name)?;
                }
                Ok(())
            }
            ErrorReason::UnsupportedInstruction { instr } => {
                write!(f, "unsupported instruction: {:?}", instr)
            }
        }
    }
}

impl Display for InterpreterError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        let mut err = self;
        while let Some(cause) = &err.cause {
            err = cause.as_ref();
        }
        write!(f, "{}", err.reason)?;
        Ok(())
    }
}

impl std::fmt::Debug for InterpreterError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        let mut err = self;
        let mut indent = 0;
        while let Some(cause) = &err.cause {
            for _ in 0..indent {
                write!(f, " ")?;
            }
            writeln!(f, "{}", err.reason)?;
            err = cause.as_ref();
            indent += 2;
        }
        for _ in 0..indent {
            write!(f, " ")?;
        }
        writeln!(f, "{}", err.reason)?;
        Ok(())
    }
}

impl Error for InterpreterError {
    fn source(&self) -> Option<&(dyn Error + 'static)> {
        if let Some(cause) = &self.cause {
            Some(cause.as_ref())
        } else {
            None
        }
    }
}

#[derive(Debug)]
pub enum StackError {
    TooFewValues {
        actual: usize,
        needed: usize,
    },
    WrongValueType {
        actual: &'static str,
        expected: &'static str,
    },
}

impl From<StackError> for InterpreterError {
    fn from(value: StackError) -> Self {
        Self {
            reason: ErrorReason::InvalidStack(value),
            cause: None,
        }
    }
}

impl Display for StackError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            Self::TooFewValues { actual, needed } => write!(
                f,
                "the stack had too few values, expected at least {} but found {}",
                needed, actual
            ),
            Self::WrongValueType { actual, expected } => write!(
                f,
                "the value at the top of the stack had the wrong type, expected {} but found {}",
                expected, actual
            ),
        }
    }
}
