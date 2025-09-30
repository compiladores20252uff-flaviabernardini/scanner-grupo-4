%%
%unicode
%public
%class CalcLexer
%line
%column
%type Token

%{
private Token formataToken(TokenType tt) {
  return new Token(tt, yytext(), yyline + 1, yycolumn + 1);
}
private Token err(String msg) {
  return new Token(TokenType.ERROR, yytext(), yyline + 1, yycolumn + 1, msg);
}
%}

/* regex */
WHITESPACE = [ \t\r\n\f]+
INT        = 0|[1-9][0-9]*
FLOAT      = [0-9]+"."[0-9]+   // floats simples, sem notação científica

%%

/* Operadores compostos – declarar antes para garantir o maior lexema */
"**" { return formataToken(TokenType.POW); }
"//" { return formataToken(TokenType.INT_DIV); }

/* Operadores simples e parênteses */
"("  { return formataToken(TokenType.LPAREN); }
")"  { return formataToken(TokenType.RPAREN); }
"+"  { return formataToken(TokenType.PLUS); }
"-"  { return formataToken(TokenType.MINUS); }
"*"  { return formataToken(TokenType.STAR); }
"/"  { return formataToken(TokenType.SLASH); }

/* Números (FLOAT antes de INT) */
{FLOAT} { return formataToken(TokenType.FLOAT); }
{INT}   { return formataToken(TokenType.INT); }

/* Espaços em branco: ignorar */
{WHITESPACE} { /* skip */ }

/* EOF */
<<EOF>> { return new Token(TokenType.EOF, "", yyline + 1, yycolumn + 1); }

/* Qualquer outra coisa: token de erro */
. { return err("simbolo invalido"); }
