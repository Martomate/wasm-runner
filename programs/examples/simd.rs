#![cfg(target_arch = "wasm32")]

use programs::simd as lib;

#[target_feature(enable = "simd128")]
#[unsafe(no_mangle)]
pub extern "C" fn calc_using_simd(a: u32, b: u32, n: u32) -> u32 {
    lib::calc_using_simd(a, b, n)
}
