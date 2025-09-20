%% 
%public
%class CMinusLexer
%unicode
%line
%column
%type Token
%function nextToken

%{
  private Token formataToken(TokenType t) {
    return new Token(t, yytext(), yyline + 1, yycolumn + 1);
  }
%}

%eofval{
  return new Token(TokenType.EOF, "<EOF>", yyline + 1, yycolumn + 1);
%eofval}

WHITESPACE = [ \t\f\r]+
DIGIT = [0-9]
LETTER = [A-Za-z_]
ID = {LETTER}({LETTER}|{DIGIT})*
NUM = 0|[1-9][0-9]*

LINE_COMMENT = "//".*
BLOCK_COMMENT = "/*"([^*]|\*+[^/])*"\*"+"/"

%%

{WHITESPACE}      { /* ignore */ }
\n                { /* ignore */ }

{LINE_COMMENT}    { /* ignore */ }
{BLOCK_COMMENT}   { /* ignore */ }

"if"              { return formataToken(TokenType.IF); }
"else"            { return formataToken(TokenType.ELSE); }
"while"           { return formataToken(TokenType.WHILE); }
"return"          { return formataToken(TokenType.RETURN); }
"int"             { return formataToken(TokenType.INT); }
"void"            { return formataToken(TokenType.VOID); }

"=="              { return formataToken(TokenType.EQ); }
"!="              { return formataToken(TokenType.NE); }
"<="              { return formataToken(TokenType.LE); }
">="              { return formataToken(TokenType.GE); }
"<"               { return formataToken(TokenType.LT); }
">"               { return formataToken(TokenType.GT); }
"="               { return formataToken(TokenType.ASSIGN); }

"+"               { return formataToken(TokenType.PLUS); }
"-"               { return formataToken(TokenType.MINUS); }
"*"               { return formataToken(TokenType.STAR); }
"/"               { return formataToken(TokenType.SLASH); }

";"               { return formataToken(TokenType.SEMI); }
","               { return formataToken(TokenType.COMMA); }
"("               { return formataToken(TokenType.LPAREN); }
")"               { return formataToken(TokenType.RPAREN); }
"{"               { return formataToken(TokenType.LBRACE); }
"}"               { return formataToken(TokenType.RBRACE); }
"["               { return formataToken(TokenType.LBRACKET); }
"]"               { return formataToken(TokenType.RBRACKET); }

{ID}              { return formataToken(TokenType.ID); }
{NUM}             { return formataToken(TokenType.NUM); }

.                 { return formataToken(TokenType.INVALID); }
