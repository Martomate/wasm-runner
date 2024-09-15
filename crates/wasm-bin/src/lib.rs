use decoder::WasmDecoder;
use section::*;

mod decoder;
mod error;
mod instr;
mod section;
mod types;
mod values;

pub struct Wasm {}

pub fn decode_bytes(mut b: &[u8]) -> Result<Wasm, String> {
    b = b
        .strip_prefix(&[0x00, 0x61, 0x73, 0x6d])
        .ok_or("missing magic bytes")?;
    b = b
        .strip_prefix(&[0x01, 0x00, 0x00, 0x00])
        .ok_or("missing version number")?;

    let mut raw_sections = Vec::new();

    let mut b = WasmDecoder::new(b);

    while !b.is_empty() {
        let section_id = b.read_byte();
        let section_size = b.read_u32() as usize;
        raw_sections.push((section_id, b.read_bytes(section_size)));
    }

    for (id, bytes) in raw_sections.iter() {
        println!("{}\t{:?}", id, bytes);
    }

    let mut sections: Vec<Section> = Vec::new();

    for (id, bytes) in raw_sections.iter().cloned() {
        let mut bytes = WasmDecoder::new(bytes);
        let section = Section::decode(id, &mut bytes)?;
        sections.push(section);
    }

    println!("\n");

    for s in sections.iter() {
        println!("{:?}", s);
    }

    println!("\n");

    Ok(Wasm {})
}
