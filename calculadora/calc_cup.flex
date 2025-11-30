%%
%unicode
%public
%class CalcLexerCup
%cup
%line
%column

%{
  private java_cup.runtime.Symbol sym(int id) {
    return new java_cup.runtime.Symbol(id, yyline+1, yycolumn+1);
  }
  private java_cup.runtime.Symbol sym(int id, Object val) {
    return new java_cup.runtime.Symbol(id, yyline+1, yycolumn+1, val);
  }
%}

/* macros */
WS    = [ \t\r\n\f]+
INT   = 0|[1-9][0-9]*
FLOAT = [0-9]+"."[0-9]+

%%

"("      { return sym(sym.LPAREN); }
")"      { return sym(sym.RPAREN); }
"+"      { return sym(sym.PLUS); }
"-"      { return sym(sym.MINUS); }
"*"      { return sym(sym.STAR); }
"/"      { return sym(sym.SLASH); }
"//"     { return sym(sym.INT_DIV); }
"**"     { return sym(sym.POW); }

{FLOAT}  { return sym(sym.FLOAT, Double.valueOf(yytext())); }
{INT}    { return sym(sym.INT, Integer.valueOf(yytext())); }

{WS}     { /* skip */ }

<<EOF>>  { return sym(sym.EOF); }

.        {
           throw new RuntimeException(
             "Erro léxico: símbolo inválido '" + yytext() +
             "' em " + (yyline+1) + ":" + (yycolumn+1)
           );
         }
