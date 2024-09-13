use wasm_bin::decode_bytes;

#[test]
fn decode_add_example() {
    let example = include_bytes!("add.wasm");

    let _wasm = decode_bytes(example).unwrap();

    assert_eq!(1, 2);
    // assert_eq!(wasm, todo!());
}
