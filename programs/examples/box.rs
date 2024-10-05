#![cfg(target_arch = "wasm32")]

#[no_mangle]
pub extern "C" fn calc(a: i32) -> Box<i32> {
    let mut num = Box::new(42);
    *num += a;
    num
}
