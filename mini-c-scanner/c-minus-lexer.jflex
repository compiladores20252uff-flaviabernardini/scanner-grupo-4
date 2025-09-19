%%

%class c_minus
%standalone

Digit = [0-9]
Letter = [a-zA-Z]

ID = [a-zA-Z][a-zA-Z]*
NUM = [0-9][0-9]* 

Keyword = "else" | "if" | "int" | "return" | "void" | "while"
Comment = \/\*+.*\*+\/
Parenteses = \( | \)
Brackets = \[ | \]
Braces = \{ | \}
Addop = \+ | -
Relop = "<=" | "<" | ">" | ">=" | "==" | "!=" | "="
Mulop = \* | \/

%%

<YYINITIAL> {

    {Keyword}   { System.out.printf("KEYWORD: %s\n", yytext()); }

    {ID}        { System.out.printf("ID: %s\n", yytext()); }
    {NUM}       { System.out.printf("NUM: %s\n", yytext()); }

    {Addop}     { System.out.printf("ADDOP: %s\n", yytext()); }
    {Mulop}     { System.out.printf("MULOP: %s\n", yytext()); }
    {Relop}     { System.out.printf("RELOP: %s\n", yytext()); }

    {Keyword}   { System.out.printf("KEYWORD: %s\n", yytext());}

    {Parenteses}    { System.out.printf("PARENTHESES: %s\n", yytext());}
    {Braces}    { System.out.printf("BRACES: %s\n", yytext());}
    {Brackets}  { System.out.printf("BRACKETS: %s\n", yytext());}
    {Comment}   { System.out.printf("COMMENT: %s\n", yytext());}
    
    ","         { System.out.printf("COMMA: %s\n", yytext());}
    ";"         { System.out.printf("SEMICOLON: %s\n", yytext());}

    [ \t\r\n]+  { /* Não faz nada */ }

}