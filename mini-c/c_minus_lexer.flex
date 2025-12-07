import java_cup.runtime.Symbol;

%%

%cup
%public
%class CMinusLexerCup
%line
%column

%eofval{
  return new Symbol(Sym.EOF);
%eofval}

ID = [a-zA-Z][a-zA-Z]*
NUM = [0-9][0-9]*
Comment = \/\*([^*]|\*+[^*/])*\*+\/

%%

<YYINITIAL> {
 
    "int"       { return new Symbol(Sym.INT, "INT"); }
    "if"        { return new Symbol(Sym.IF, "IF"); }
    "else"      { return new Symbol(Sym.ELSE, "ELSE"); }
    "while"     { return new Symbol(Sym.WHILE, "WHILE"); }
    "return"    { return new Symbol(Sym.RETURN, "RETURN"); }
    "void"      { return new Symbol(Sym.VOID, "VOID"); }

    /* Aqui convertemos o ID para maiúsculo */
    {ID}        { return new Symbol(Sym.ID, yytext().toUpperCase()); }
    {NUM}       { return new Symbol(Sym.NUM, yytext()); }

    "<="     { return new Symbol(Sym.LESSTHANEQ, "<="); }
    ">"      { return new Symbol(Sym.GREATERTHAN, ">"); }
    ">="     { return new Symbol(Sym.GREATERTHANEQ, ">="); }
    "=="     { return new Symbol(Sym.EQUAL, "=="); }
    "!="     { return new Symbol(Sym.NOTEQUAL, "!="); }
    "+"      { return new Symbol(Sym.PLUS, "+"); }
    "-"      { return new Symbol(Sym.MINUS, "-"); }
    "*"      { return new Symbol(Sym.STAR, "*"); }
    "/"      { return new Symbol(Sym.SLASH, "/"); }
    "<"      { return new Symbol(Sym.LESSTHAN, "<"); }
    "="      { return new Symbol(Sym.ASSIGN, "="); }
     
    "("      { return new Symbol(Sym.LPAREN); }
    ")"      { return new Symbol(Sym.RPAREN); }
    "{"      { return new Symbol(Sym.LBRAC); }
    "}"      { return new Symbol(Sym.RBRAC); }
    "["      { return new Symbol(Sym.LBRACK); }
    "]"      { return new Symbol(Sym.RBRACK); }    
    ","      { return new Symbol(Sym.COMMA); }
    ";"      { return new Symbol(Sym.SEMICOLON); }

    {Comment}   {  }
    [ \t\r\n]+  {  }
    .           { return new Symbol(Sym.error); }
}