%%

%unicode
%public
%class CalcLexer
%line
%column
%type Token

%{

// será usado nas ações abaixo
private Token formataToken(TokenType tt) {
  return new Token(tt, yytext(), yyline + 1, yycolumn + 1);
}

%}

/* regex */
WHITESPACE   = [ \t\r\n\f]+
INT          = 0|[1-9][0-9]*
FLOAT        = [0-9]+"."[0-9]+   // floats simples, sem notação científica

%%

/* --------- REGRAS --------- */

/* Operadores compostos – precisam vir antes dos simples pra garanitir tokens de maior tamanho possível */
"**"         { return formataToken(TokenType.POW); }
"//"         { return formataToken(TokenType.INT_DIV); }

/* Operadores simples e parênteses */
"("          { return formataToken(TokenType.LPAREN); }
")"          { return formataToken(TokenType.RPAREN); }
"+"          { return formataToken(TokenType.PLUS); }
"-"          { return formataToken(TokenType.MINUS); }
"*"          { return formataToken(TokenType.STAR); }
"/"          { return formataToken(TokenType.SLASH); }

/* Números, ordem importa primeiro FLOAT depois INT */
{FLOAT}      { return formataToken(TokenType.FLOAT); }
{INT}        { return formataToken(TokenType.INT); }

/* Espaços em branco: ignorar */
{WHITESPACE} { /* skip */ }

/* EOF */
<<EOF>>      { return new Token(TokenType.EOF, "", yyline + 1, yycolumn + 1); }

/* Qualquer coisa diferente lança erro */
.            {
               throw new RuntimeException(
                 "Erro lexico o símbolo é inválido '" + yytext() +
                 "' em " + (yyline + 1) + ":" + (yycolumn + 1)
               );
             }
