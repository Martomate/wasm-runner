use wasm_text::node::*;

#[test]
fn parse_add_example() {
    let input = include_str!("add.wat");

    let actual = wasm_text::parse_str(input).unwrap();

    let expected = {
        Node::new("module")
            .attr("$program_add.wasm")
            .node(
                Node::new("table")
                    .attr("$table0")
                    .attr("1")
                    .attr("1")
                    .attr("funcref"),
            )
            .node(
                Node::new("memory")
                    .attr("$memory")
                    .node(Node::new(";0;"))
                    .node(Node::new("export").attr("\"memory\""))
                    .attr("16"),
            )
            .node(
                Node::new("global")
                    .attr("$__stack_pointer")
                    .node(Node::new(";0;"))
                    .node(Node::new("mut").attr("i32"))
                    .node(Node::new("i32.const").attr("1048576")),
            )
            .node(
                Node::new("global")
                    .attr("$__data_end")
                    .node(Node::new(";1;"))
                    .node(Node::new("export").attr("\"__data_end\""))
                    .attr("i32")
                    .node(Node::new("i32.const").attr("1048576")),
            )
            .node(
                Node::new("global")
                    .attr("$__heap_base")
                    .node(Node::new(";2;"))
                    .node(Node::new("export").attr("\"__heap_base\""))
                    .attr("i32")
                    .node(Node::new("i32.const").attr("1048576")),
            )
            .node(
                Node::new("func")
                    .attr("$add")
                    .node(Node::new(";0;"))
                    .node(Node::new("export").attr("\"add\""))
                    .node(Node::new("param").attr("$var0").attr("i32"))
                    .node(Node::new("param").attr("$var1").attr("i32"))
                    .node(Node::new("result").attr("i32"))
                    .attr("local.get")
                    .attr("$var1")
                    .attr("local.get")
                    .attr("$var0")
                    .attr("i32.add"),
            )
    };

    assert_eq!(actual, expected);
}


#[test]
fn parse_box_example() {
    let input = include_str!("box.wat");

    wasm_text::parse_str(input).unwrap();
}

#[test]
fn parse_log_example() {
    let input = include_str!("log.wat");

    wasm_text::parse_str(input).unwrap();
}
