use std::ffi::c_char;

extern "C" {
    #[link_name = "console_log"]
    fn log(s: *const c_char);
}

#[allow(clippy::missing_safety_doc)]
#[no_mangle]
pub unsafe extern "C" fn run() {
    log(c"Hello".as_ptr());
}
