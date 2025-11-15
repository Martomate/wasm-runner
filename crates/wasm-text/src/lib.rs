pub mod node;
mod parser;

use node::Node;

pub fn parse_str(input: &str) -> Result<Node<'_>, String> {
    parser::parse_str(input)
}
