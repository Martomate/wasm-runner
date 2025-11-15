pub fn sinh(angle: f64) -> f64 {
    (angle.exp() - (-angle).exp()) * 0.5
}

#[cfg(test)]
mod tests {
    #[test]
    fn sinh() {
        assert_eq!(super::sinh(0.0), 0.0);
        assert_eq!(super::sinh(1.23), 1.23_f64.sinh());
        assert_eq!(super::sinh(1.23), 1.564468479304407);
    }
}
