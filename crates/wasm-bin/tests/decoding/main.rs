use wasm_bin::{decode_bytes, run::{Store, Value, WasmInterpreter}};

#[test]
fn add_example() {
    let example = include_bytes!("add.wasm");

    let wasm = decode_bytes(example).unwrap();

    let mut store = Store::create(&wasm);
    let res = WasmInterpreter::new(wasm).execute("add", vec!["17", "65"], &mut store).unwrap();

    assert_eq!(res, "82");
}

#[test]
fn box_example() {
    let example = include_bytes!("box.wasm");

    let wasm = decode_bytes(example).unwrap();

    let mut store = Store::create(&wasm);
    let mut interpreter = WasmInterpreter::new(wasm);
    let res = interpreter.execute("calc", vec!["17"], &mut store).unwrap();

    let ptr = res.parse::<u32>().unwrap();
    let ans = store.access_memory(0, |m| m.read_byte(ptr));

    assert_eq!(ans, 17 + 42);
}

#[test]
fn log_example() {
    let example = include_bytes!("log.wasm");

    let wasm = decode_bytes(example).unwrap();

    static mut LOGGED_MESSAGES: Vec<Vec<Value>> = Vec::new();

    fn console_log(params: &[Value]) -> Vec<Value> {
        let message = params.to_owned();
        unsafe { LOGGED_MESSAGES.push(message) };
        vec![]
    }

    let mut store = Store::create(&wasm);
    let mut interpreter = WasmInterpreter::new(wasm);
    interpreter.bind_external_function("env", "console_log", console_log);
    let res = interpreter.execute("run", vec![], &mut store).unwrap();

    assert_eq!(res, "");
    assert_eq!(unsafe { LOGGED_MESSAGES.clone() }, vec![vec![Value::I32(1048576)]]); // this is a pointer into the wasm memory
    
    let message_ptr = (unsafe { LOGGED_MESSAGES[0][0] }).as_i32().unwrap() as u32;
    let message = String::from_utf8(store.access_memory(0, |m| m.read_c_string(message_ptr).to_owned())).unwrap();
    assert_eq!(message, "Hello");
}

#[test]
fn aes_example() {
    let example = include_bytes!("aes.wasm");

    let wasm = decode_bytes(example).unwrap();

    let mut store = Store::create(&wasm);
    let mut interpreter = WasmInterpreter::new(wasm);

    // Create key and data
    let res = interpreter.execute("new_array", vec!["16"], &mut store).unwrap();
    let key_ptr = res.parse::<u32>().unwrap();
    store.access_memory(0, |m| m.write_bytes(key_ptr, b"1234abcd9876efgh"));

    let res = interpreter.execute("new_array", vec!["16"], &mut store).unwrap();
    let data_ptr = res.parse::<u32>().unwrap();
    store.access_memory(0, |m| m.write_bytes(data_ptr, b"Hello World!"));

    // Encrypt
    let res = interpreter.execute("encrypt_128", vec![&data_ptr.to_string(), &key_ptr.to_string()], &mut store).unwrap();
    let output_ptr = res.parse::<u32>().unwrap();
    let output = store.access_memory(0, |m| m.read_bytes_fixed::<16>(output_ptr));

    // Decrypt
    let res = interpreter.execute("decrypt_128", vec![&output_ptr.to_string(), &key_ptr.to_string()], &mut store).unwrap();
    let input_ptr = res.parse::<u32>().unwrap();
    let input = store.access_memory(0, |m| m.read_bytes_fixed::<16>(input_ptr));

    // Drop memory (not really needed in this case)
    interpreter.execute("drop_array", vec![&input_ptr.to_string()], &mut store).unwrap();
    interpreter.execute("drop_array", vec![&output_ptr.to_string()], &mut store).unwrap();
    interpreter.execute("drop_array", vec![&data_ptr.to_string()], &mut store).unwrap();
    interpreter.execute("drop_array", vec![&key_ptr.to_string()], &mut store).unwrap();

    // encryption followed by decryption should produce the input
    assert_eq!(&input, b"Hello World!\0\0\0\0");

    // the ciphertext should be different from the plaintext
    assert_ne!(&output, &input);
}

#[test]
fn floats_example() {
    let example = include_bytes!("floats.wasm");

    let wasm = decode_bytes(example).unwrap();
    let mut store = Store::create(&wasm);
    let mut program = WasmInterpreter::new(wasm);
    
    let res = program.execute("add_f32", vec!["17.123", "65.472"], &mut store).unwrap();
    assert_eq!(res, "82.595");

    let res = program.execute("add_f64", vec!["17.123", "65.472"], &mut store).unwrap();
    assert_eq!(res, "82.595");
}
