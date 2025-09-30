public class Token {
  public final TokenType type;
  public final String lexeme;
  public final int line;
  public final int column;
  public final String message;

  public Token(TokenType type, String lexeme, int line, int column) {
    this(type, lexeme, line, column, null);
  }

  public Token(TokenType type, String lexeme, int line, int column, String message) {
    this.type = type;
    this.lexeme = lexeme;
    this.line = line;
    this.column = column;
    this.message = message;
  }

  public boolean isError() { return type == TokenType.ERROR; }

  @Override
  public String toString() {
    if (isError()) {
      return String.format(
        "Erro lexico { lexema='%s', linha=%d, coluna=%d%s }",
        lexeme, line, column, message != null ? ", mensagem='" + message + "'" : ""
      );
    }
    return String.format(
      "O token { tipo=%s, lexema='%s', linha=%d, coluna=%d }",
      type, lexeme, line, column
    );
  }
}
