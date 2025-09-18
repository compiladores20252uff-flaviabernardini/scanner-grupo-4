%%

%unicode
%public
%class CalcLexer
%line
%column
%type Token

%{

// será usado nas ações abaixo
private Token t(TokenType tt) {
  return new Token(tt, yytext(), yyline + 1, yycolumn + 1);
}

%}

/* --------- DEFINIÇÕES (REGEX) --------- */
WHITESPACE   = [ \t\r\n\f]+
INT          = 0|[1-9][0-9]*
FLOAT        = [0-9]+"."[0-9]+   // floats simples, sem notação científica

%%

/* --------- REGRAS --------- */

/* Operadores compostos – precisam vir antes dos simples */
"**"         { return t(TokenType.POW); }
"//"         { return t(TokenType.INT_DIV); }

/* Operadores simples e parênteses */
"("          { return t(TokenType.LPAREN); }
")"          { return t(TokenType.RPAREN); }
"+"          { return t(TokenType.PLUS); }
"-"          { return t(TokenType.MINUS); }
"*"          { return t(TokenType.STAR); }
"/"          { return t(TokenType.SLASH); }

/* Números (ordem importa: FLOAT antes de INT) */
{FLOAT}      { return t(TokenType.FLOAT); }
{INT}        { return t(TokenType.INT); }

/* Espaços em branco: ignorar */
{WHITESPACE} { /* skip */ }

/* EOF */
<<EOF>>      { return new Token(TokenType.EOF, "", yyline + 1, yycolumn + 1); }

/* Qualquer outra coisa: erro */
.            {
               throw new RuntimeException(
                 "Erro léxico: símbolo inválido '" + yytext() +
                 "' em " + (yyline + 1) + ":" + (yycolumn + 1)
               );
             }
