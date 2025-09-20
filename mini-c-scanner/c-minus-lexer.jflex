

%%

%class c_minus
%standalone
%line
%column
%type Token

%{

private Token t(TokenType tt) {
  return new Token(tt, yytext(), yyline + 1, yycolumn + 1);
}

%}

ID = [a-zA-Z][a-zA-Z]*
NUM = [0-9][0-9]* 

Keyword = "else" | "if" | "int" | "return" | "void" | "while"
Comment = \/\*.*\*\/
Parentheses = \( | \)
Brackets = \[ | \]
Braces = \{ | \}
Addop = \+ | -
Relop = "<=" | "<" | ">" | ">=" | "==" | "!=" | "="
Mulop = \* | \/

%%

<YYINITIAL> {
 
    {ID}        { return t(TokenType.ID); }
    {NUM}       { return t(TokenType.NUM); }

    "+"     { return t(TokenType.PLUS); }
    "-"     { return t(TokenType.MINUS); }
    "*"     { return t(TokenType.STAR); }
    "/"     { return t(TokenType.SLASH); }
    "<"     { return t(TokenType.LESSTHAN); }
    "<="     { return t(TokenType.LESSTHANEQ); }
    ">"     { return t(TokenType.GREATERTHAN); }
    ">="     { return t(TokenType.GREATERTHANEQ); }
    "=="     { return t(TokenType.EQUAL); }
    "!="     { return t(TokenType.NOTEQUAL); }
    "="     { return t(TokenType.ASSIGN); }
    
    "("     { return t(TokenType.LPAREN); }
    ")"     { return t(TokenType.RPAREN); }
    "{"     { return t(TokenType.LBRAC); }
    "}"     { return t(TokenType.RBRAC); }
    "["     { return t(TokenType.LBRACK); }
    "]"     { return t(TokenType.RBRACK); }
    {Comment}   { return t(TokenType.COMMENT);}

    "int"       { return t(TokenType.INT); }
    "if"        { return t(TokenType.IF); }
    "else"      { return t(TokenType.ELSE); }
    "while"     { return t(TokenType.WHILE); }
    "return"    { return t(TokenType.RETURN); }
    "void"      { return t(TokenType.VOID); }
    
    ","         { return t(TokenType.COMMA);}
    ";"         { return t(TokenType.SEMICOLON);}

    [ \t\r\n]+  { /* Não faz nada */ }

}