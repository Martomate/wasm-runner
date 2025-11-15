use super::node::{Child, Node};


pub fn parse_str(mut s: &str) -> Result<Node<'_>, String> {
    s = s.trim_start();
    s = s.strip_prefix('(').ok_or("missing (")?;
    s = s.trim_start();

    let (node, mut s) = parse_node(s)?;

    s = s.strip_prefix(')').ok_or("missing ) after parsing everything")?;
    s = s.trim();

    if !s.is_empty() {
    //    Err("extra characters found at the end")?;
    }
    
    Ok(node)
}

fn parse_node(mut s: &str) -> Result<(Node<'_>, &str), String> {
    let mut items = Vec::new();
    while let Some((child, mut rest)) = parse_item(s)? {
        rest = rest.trim_start();
        items.push(child);
        s = rest;
    }
    if items.is_empty() {
        return Err("empty node".into());
    }
    let Child::Attribute(kind) = items[0] else {
        return Err("first item in a node may not be a node".into());
    };
    
    Ok((Node { kind, children: items.into_iter().skip(1).collect() }, s))
}

fn parse_item(s: &str) -> Result<Option<(Child<'_>, &str)>, String> {
    if let Some(mut s) = s.strip_prefix('(') {
        s = s.trim_start();
        let (node, rest) = parse_node(s)?;
        let rest = rest.strip_prefix(')').ok_or("missing ) right after parsing node")?;
        return Ok(Some((Child::Node(Box::new(node)), rest)));
    }
    if s.starts_with('"') {
        let (value, rest) = scan_escaped_string(s)?;
        return Ok(Some((Child::Attribute(value), rest)));
    }
    
    let (paren, _) = s.split_once(')').ok_or("missing ) while parsing item")?;
    if paren.is_empty() {
        return Ok(None);
    }
    if let Some(space) = s.split_ascii_whitespace().next() {
        if space.len() < paren.len() {
            let (_, rest) = s.split_at(space.len());
            return Ok(Some((Child::Attribute(space), rest)));
        }
    }

    let (_, rest) = s.split_at(paren.len());
    Ok(Some((Child::Attribute(paren), rest)))
}

fn scan_escaped_string(s: &str) -> Result<(&str, &str), String> {
    let mut skip_next = true; // first is a '"'
    
    for (i, c) in s.char_indices() {
        if skip_next {
            skip_next = false;
            continue;
        }
        if c == '\\' {
            skip_next = true;
        }
        if c == '"' {
            let (s, rest) = s.split_at(i+1);
            return Ok((s, rest));
        }
    }
    
    Err("did not find end of string".into())
}
