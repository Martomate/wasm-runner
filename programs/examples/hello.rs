#![cfg(target_arch = "wasm32")]

use std::ffi::{c_char, CString};

#[unsafe(no_mangle)]
pub extern "C" fn hello() -> *mut c_char {
    CString::new("Hello World").unwrap().into_raw()
}
