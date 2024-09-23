use wasm_bin::{decode_bytes, WasmInterpreter};

#[test]
fn decode_add_example() {
    let example = include_bytes!("add.wasm");

    let wasm = decode_bytes(example).unwrap();

    let res = WasmInterpreter::new(wasm).execute("add", vec!["17", "65"]);

    assert_eq!(res, "82");
}

#[test]
fn decode_box_example() {
    let example = include_bytes!("box.wasm");

    let _wasm = decode_bytes(example).unwrap();

    // let res = WasmInterpreter::new(wasm).execute("calc", vec!["17"]);

    // TODO: check wasm memory at location `res`, and expect to find (17 + 42)

    // assert_eq!(res, "");
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

    let mut interpreter = WasmInterpreter::new(wasm);
    interpreter.bind_external_function("env", "console_log", console_log);
    let res = interpreter.execute("run", vec![]);

    assert_eq!(res, "");
    assert_eq!(unsafe { LOGGED_MESSAGES.clone() }, vec![vec![1048576]]); // this is a pointer into the wasm memory
}
