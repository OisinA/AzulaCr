type Block = Vec<Box<Statement>>;

#[derive(Debug, Clone)]
pub enum Expr {
    // Literals
    Number(f64),
    Identifier(String),
    Boolean(bool),
    String(String),

    Op(Box<Expr>, Opcode, Box<Expr>),
    FunctionCall(String, Vec<Box<Expr>>),
}

#[derive(Debug, Clone)]
pub enum Statement {
    Let(Option<String>, String, Box<Expr>),
    Function(String, Option<Vec<(Type, String)>>, Option<Type>, Block),
    Return(Option<Box<Expr>>),
    Expression(Box<Expr>),
    If(Box<Expr>, Block),
}

#[derive(Debug, Clone, Copy)]
pub enum Type {
    Integer(i32),
    Float(i32),
    String,
    Boolean,
}

impl Type {
    pub fn from_string(typ: String) -> Option<Type> {
        match typ.as_str() {
            "int" | "int32" => Some(Type::Integer(32)),
            "int64" => Some(Type::Integer(64)),
            "float" | "float32" => Some(Type::Float(32)),
            "float64" => Some(Type::Float(64)),
            "string" => Some(Type::String),
            "bool" => Some(Type::Boolean),
            _ => None,
        }
    }
}

#[derive(Debug, Clone, Copy)]
pub enum Opcode {
    Mul,
    Div,
    Add,
    Sub,
    Rem,

    Eq,
    NotEq,
    LessThan,
    GreaterThan,
    LessEqual,
    GreaterEqual,

    Or,
    And,
}
