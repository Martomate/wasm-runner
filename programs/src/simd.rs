use std::simd::{num::SimdUint, Simd};

pub fn calc_using_simd(a: u32, b: u32, n: u32) -> u32 {
    // initialize simd values
    let xs: Simd<u32, 4> = Simd::from_array([a, 3, b, 1]);
    let ys: Simd<u32, 4> = Simd::from_array([7, a + b, 5, a * b]);

    // perform lots of calculations
    let mut zs = xs;
    for _ in 0..n {
        zs = zs.saturating_add(ys);
        zs = zs.rotate_elements_right::<2>();
        zs *= ys;
        zs = zs.reverse();
        zs -= ys;
        zs = zs.rotate_elements_left::<1>();
    }

    // produce a result
    zs.reduce_sum()
}

#[cfg(test)]
mod tests {
    #[test]
    fn calc_using_simd_works() {
        let res = super::calc_using_simd(0, 0, 0);
        assert_eq!(res, 4); // regression test

        let res = super::calc_using_simd(0, 0, 1);
        assert_eq!(res, 58); // regression test

        let res = super::calc_using_simd(37, 91, 10);
        assert_eq!(res, 831745459); // regression test
    }
}
