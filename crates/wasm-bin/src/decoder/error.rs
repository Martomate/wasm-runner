use std::{error::Error, fmt::Display};

#[derive(Debug)]
pub struct DecodingError {
    msg: String,
    cause: Option<Box<DecodingError>>,
}

impl DecodingError {
    pub fn wrap(self, msg: impl Into<String>) -> Self {
        Self { msg: msg.into(), cause: Some(Box::new(self)) }
    }
}

pub trait DecodingErrorExt {
    fn context(self, msg: impl Into<String>) -> Self;
}

impl<T> DecodingErrorExt for Result<T, DecodingError> {
    fn context(self, msg: impl Into<String>) -> Self {
        self.map_err(|err| err.wrap(msg))
    }
}

impl From<String> for DecodingError {
    fn from(value: String) -> Self {
        Self { msg: value, cause: None }
    }
}

impl From<&str> for DecodingError {
    fn from(value: &str) -> Self {
        Self { msg: value.into(), cause: None }
    }
}

impl From<DecodingError> for String {
    fn from(value: DecodingError) -> Self {
        value.to_string()
    }
}

impl Display for DecodingError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "{}", self.msg)?;
        if let Some(ref c) = self.cause {
            write!(f, ": {}", c)?;
        }
        Ok(())
    }
}

impl Error for DecodingError {
    fn source(&self) -> Option<&(dyn Error + 'static)> {
        match &self.cause {
            Some(c) => Some(c),
            None => None,
        }
    }
}
