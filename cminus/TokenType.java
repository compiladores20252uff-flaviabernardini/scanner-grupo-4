public enum TokenType {
    // palavras reservadas
    IF, ELSE, WHILE, RETURN, INT, VOID,

    // identificadores e litereis
    ID, NUM,

    // operadores
    PLUS, MINUS, STAR, SLASH,
    LT, LE, GT, GE, EQ, NE, ASSIGN,

    // delimitadores
    SEMI, COMMA,
    LPAREN, RPAREN, LBRACE, RBRACE, LBRACKET, RBRACKET,

    // final do arquivo e invalido
    EOF,
    INVALID
}
