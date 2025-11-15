#![cfg(target_arch = "wasm32")]

use std::ffi::c_char;

unsafe extern "C" {
    #[link_name = "console_log"]
    fn log(s: *const c_char);
}

#[unsafe(no_mangle)]
pub unsafe extern "C" fn run() {
    unsafe {
        log(c"Hello".as_ptr());
    }
}
