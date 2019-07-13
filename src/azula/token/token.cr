module Azula

    enum TokenType
        # Illegal is used for any undefined tokens
        ILLEGAL
        # Signifies the end of a file
        EOF

        # Identifier of type eg. int, string
        TYPE
        # Used to assign a variable name to value
        ASSIGN
        # Used to indicate a return type
        COLON
        # Used to indicate end of a line
        SEMICOLON
        # Used for variable/function names
        IDENTIFIER
        # Used to initialise a function
        FUNCTION
        # Used to return a value from a function
        RETURN
        # Used to separate terms
        COMMA
        # Used for string literals
        STRING
        # Used for number literals
        NUMBER
        # Used to cast one type to another
        AS
        # Used to create a struct
        STRUCT

        # True
        TRUE
        # False
        FALSE

        PLUS # +
        MINUS # -
        ASTERISK # *
        SLASH # /
        MODULO # %

        # Equality
        EQ
        # Inequality
        NOT_EQ
        # Less than
        LT
        # Greater than
        GT
        # Less than or equal
        LT_EQ
        # Greater than or equal
        GT_EQ

        # Logical OR
        OR
        # Logical AND
        AND
        # Logical NOT
        NOT

        # Conditionals
        IF
        ELSEIF
        ELSE

        # Switch statement
        SWITCH
        # Default statement in switch
        DEFAULT

        # For loop
        FOR

        LBRACKET # (
        RBRACKET # )
        LBRACE # {
        RBRACE # }
        LSQUARE # [
        RSQUARE # ]

    end

    class Token

        def initialize(@type : TokenType, @literal : String, @file : String, @linenumber : Int32, @charnumber : Int32)
        end

        def to_string : String
            return "Token #{@type} (#{@literal}) in #{@file} line #{@linenumber}, character #{@charnumber}"
        end

        getter type
        getter literal

    end

    Keywords = {
        "int" => TokenType::TYPE,
        "bool" => TokenType::TYPE,
        "string" => TokenType::TYPE,
        "float" => TokenType::TYPE,
        "error" => TokenType::TYPE,
        "void" => TokenType::TYPE,

        "func" => TokenType::FUNCTION,
        "return" => TokenType::RETURN,
        
        "as" => TokenType::AS,

        "struct" => TokenType::STRUCT,

        "true" => TokenType::TRUE,
        "false" => TokenType::FALSE,
        "or" => TokenType::OR,
        "and" => TokenType::AND,

        "if" => TokenType::IF,
        "elseif" => TokenType::ELSEIF,
        "else" => TokenType::ELSE,

        "switch" => TokenType::SWITCH,
        "default" => TokenType::DEFAULT,

        "for" => TokenType::FOR,
    }
    
end