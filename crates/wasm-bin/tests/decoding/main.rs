use wasm_bin::{decode_bytes, WasmInterpreter};

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

    static mut LOGGED_MESSAGES: Vec<Vec<i32>> = Vec::new();

    fn console_log(params: &[i32]) -> Vec<i32> {
        let message = params.to_owned();
        unsafe { LOGGED_MESSAGES.push(message) };
        vec![]
    }

    let mut memories = WasmInterpreter::create_memories(&wasm);
    let mut interpreter = WasmInterpreter::new(wasm);
    interpreter.bind_external_function("env", "console_log", console_log);
    let res = interpreter.execute("run", vec![], &mut memories);

    assert_eq!(res, "");
    assert_eq!(unsafe { LOGGED_MESSAGES.clone() }, vec![vec![1048576]]); // this is a pointer into the wasm memory

    let message_ptr = unsafe { LOGGED_MESSAGES.clone() }[0][0] as u32;
    let message = String::from_utf8(memories[0].read_c_string(message_ptr).to_owned()).unwrap();
    assert_eq!(message, "Hello");
}
