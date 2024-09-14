use wasm_bin::decode_bytes;

#[test]
fn decode_add_example() {
    let example = include_bytes!("add.wasm");

    decode_bytes(example).unwrap();
}

#[test]
fn decode_box_example() {
    let example = include_bytes!("box.wasm");

    decode_bytes(example).unwrap();
}

#[test]
fn decode_log_example() {
    let example = include_bytes!("log.wasm");

    decode_bytes(example).unwrap();
}
