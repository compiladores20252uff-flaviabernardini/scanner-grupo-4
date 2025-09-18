import java.io.FileReader;
import java.io.InputStreamReader;

public class Main {
  public static void main(String[] args) {
    try {
      InputStreamReader reader;

      if (args.length == 0 || args[0].equals("-")) {
        reader = new InputStreamReader(System.in);
      } else {
        reader = new FileReader(args[0]);
      }

      CalcLexer lex = new CalcLexer(reader);
      Token tok;
      while ((tok = lex.yylex()).type != TokenType.EOF) {
        System.out.println(tok);
      }
      System.out.println("EOF");
    } catch (Exception e) {
      System.err.println(e.getMessage());
      System.exit(1);
    }
  }
}
