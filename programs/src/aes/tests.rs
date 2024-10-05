//#![cfg(not(target_arch = "wasm32"))]

use super::*;

#[test]
fn works() {
    let key_ptr = new_array(16);
    let key_ref = unsafe { std::slice::from_raw_parts_mut(key_ptr, 16) };
    key_ref.copy_from_slice(b"1234abcd9876efgh");

    let data_ptr = new_array(16);
    let data_ref = unsafe { std::slice::from_raw_parts_mut(data_ptr, 16) };
    data_ref[..12].copy_from_slice(b"Hello World!");

    // Encrypt
    let output_ptr = encrypt_128(data_ptr, key_ptr);
    let output_ref = unsafe { std::slice::from_raw_parts_mut(output_ptr, 16) };
    let output = output_ref.to_owned();

    // Decrypt
    let input_ptr = decrypt_128(output_ptr, key_ptr);
    let input_ref = unsafe { std::slice::from_raw_parts_mut(input_ptr, 16) };
    let input = input_ref.to_owned();

    // Drop memory
    drop_array(input_ptr);
    drop_array(output_ptr);
    drop_array(data_ptr);
    drop_array(key_ptr);

    // encryption followed by decryption should produce the input
    assert_eq!(&input, b"Hello World!\0\0\0\0");

    // the ciphertext should be different from the plaintext
    assert_ne!(&output, &input);
}
