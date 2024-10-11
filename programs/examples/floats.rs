#![cfg(target_arch = "wasm32")]

#[no_mangle]
pub extern "C" fn add_f32(a: f32, b: f32) -> f32 {
    a + b
}

#[no_mangle]
pub extern "C" fn add_f64(a: f64, b: f64) -> f64 {
    a + b
}
