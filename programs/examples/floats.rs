#![cfg(target_arch = "wasm32")]

use programs::floats as lib;

#[no_mangle]
pub extern "C" fn add_f32(a: f32, b: f32) -> f32 {
    a + b
}

#[no_mangle]
pub extern "C" fn add_f64(a: f64, b: f64) -> f64 {
    a + b
}

#[no_mangle]
pub extern "C" fn sinh(angle: f64) -> f64 {
    lib::sinh(angle)
}
