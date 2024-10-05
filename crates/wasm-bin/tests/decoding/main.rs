use wasm_bin::{decode_bytes, Value, WasmInterpreter};

#[test]
fn decode_add_example() {
    let example = include_bytes!("add.wasm");

    let wasm = decode_bytes(example).unwrap();

    let mut memories = WasmInterpreter::create_memories(&wasm);
    let res = WasmInterpreter::new(wasm).execute("add", vec!["17", "65"], &mut memories);

    assert_eq!(res, "82");
}

#[test]
fn decode_box_example() {
    let example = include_bytes!("box.wasm");

    let wasm = decode_bytes(example).unwrap();

    let mut memories = WasmInterpreter::create_memories(&wasm);
    let mut interpreter = WasmInterpreter::new(wasm);
    let res = interpreter.execute("calc", vec!["17"], &mut memories);

    let ptr = res.parse::<u32>().unwrap();
    let ans = memories[0].read_byte(ptr);

    assert_eq!(ans, 17 + 42);
}

#[test]
fn decode_log_example() {
    let example = include_bytes!("log.wasm");

    let wasm = decode_bytes(example).unwrap();

    static mut LOGGED_MESSAGES: Vec<Vec<Value>> = Vec::new();

    fn console_log(params: &[Value]) -> Vec<Value> {
        let message = params.to_owned();
        unsafe { LOGGED_MESSAGES.push(message) };
        vec![]
    }

    let mut memories = WasmInterpreter::create_memories(&wasm);
    let mut interpreter = WasmInterpreter::new(wasm);
    interpreter.bind_external_function("env", "console_log", console_log);
    let res = interpreter.execute("run", vec![], &mut memories);

    assert_eq!(res, "");
    assert_eq!(unsafe { LOGGED_MESSAGES.clone() }, vec![vec![Value::I32(1048576)]]); // this is a pointer into the wasm memory

    let message_ptr = (unsafe { LOGGED_MESSAGES.clone() }[0][0]).as_i32().unwrap() as u32;
    let message = String::from_utf8(memories[0].read_c_string(message_ptr).to_owned()).unwrap();
    assert_eq!(message, "Hello");
}

#[test]
fn decode_aes_example() {
    let example = include_bytes!("aes.wasm");

    let wasm = decode_bytes(example).unwrap();

    let mut memories = WasmInterpreter::create_memories(&wasm);
    let mut interpreter = WasmInterpreter::new(wasm);

    // Create key and data
    let res = interpreter.execute("new_array", vec!["16"], &mut memories);
    let key_ptr = res.parse::<u32>().unwrap();
    memories[0].write_bytes(key_ptr, b"1234abcd9876efgh");

    let res = interpreter.execute("new_array", vec!["16"], &mut memories);
    let data_ptr = res.parse::<u32>().unwrap();
    memories[0].write_bytes(data_ptr, b"Hello World!");

    // Encrypt
    let res = interpreter.execute("encrypt_128", vec![&data_ptr.to_string(), &key_ptr.to_string()], &mut memories);
    let output_ptr = res.parse::<u32>().unwrap();
    let output = memories[0].read_bytes_fixed::<16>(output_ptr);

    // Decrypt
    let res = interpreter.execute("decrypt_128", vec![&output_ptr.to_string(), &key_ptr.to_string()], &mut memories);
    let input_ptr = res.parse::<u32>().unwrap();
    let input = memories[0].read_bytes_fixed::<16>(input_ptr);

    // Drop memory (not really needed in this case)
    interpreter.execute("drop_array", vec![&input_ptr.to_string()], &mut memories);
    interpreter.execute("drop_array", vec![&output_ptr.to_string()], &mut memories);
    interpreter.execute("drop_array", vec![&data_ptr.to_string()], &mut memories);
    interpreter.execute("drop_array", vec![&key_ptr.to_string()], &mut memories);

    // encryption followed by decryption should produce the input
    assert_eq!(&input, b"Hello World!\0\0\0\0");

    // the ciphertext should be different from the plaintext
    assert_ne!(&output, &input);
}
