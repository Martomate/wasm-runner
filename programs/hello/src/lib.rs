use std::ffi::{c_char, CString};

#[no_mangle]
pub extern "C" fn hello() -> *mut c_char {
    CString::new("Hello World").unwrap().into_raw()
}
