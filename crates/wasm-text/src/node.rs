use std::fmt::Display;

#[derive(Debug, PartialEq, Eq)]
pub struct Node<'s> {
    pub kind: &'s str,
    pub children: Vec<Child<'s>>
}

#[derive(Debug, PartialEq, Eq)]
pub enum Child<'s> {
    Node(Box<Node<'s>>),
    Attribute(&'s str),
}

impl<'s> Node<'s> {
    pub fn new(kind: &'s str) -> Node<'s> {
        Node { kind, children: vec![] }
    }

    pub fn node(mut self, node: Node<'s>) -> Self {
        self.children.push(Child::Node(Box::new(node)));
        self
    }

    pub fn attr(mut self, value: &'s str) -> Self {
        self.children.push(Child::Attribute(value));
        self
    }
}

impl<'s> Display for Node<'s> {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        write!(f, "(")?;
        write!(f, "{}", self.kind)?;
        for c in self.children.iter() {
            write!(f, " {}", c)?;
        }
        write!(f, ")")?;
        Ok(())
    }
}

impl<'s> Display for Child<'s> {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            Child::Node(node) => {
                write!(f, "{}", node)?;
            }
            Child::Attribute(s) => {
                write!(f, "{}", s)?;
            }
        }
        Ok(())
    }
}
