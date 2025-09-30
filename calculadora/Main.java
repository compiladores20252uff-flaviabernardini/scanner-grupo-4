import java.io.*;
import java.nio.file.*;

public class Main {
  public static void main(String[] args) {
    String inputPath = null;
    String outPath = null;

    for (int i = 0; i < args.length; i++) {
      if ("--out".equals(args[i])) {
        if (i + 1 < args.length) {
          outPath = args[++i];
        } else {
          System.err.println("Erro: --out precisa do caminho do arquivo");
          System.exit(2);
        }
      } else {
        inputPath = args[i];
      }
    }

    try (
      Reader reader = (inputPath == null || "-".equals(inputPath))
                      ? new InputStreamReader(System.in)
                      : new FileReader(inputPath);
      PrintWriter fileOut = (outPath == null)
                      ? null
                      : openWriter(outPath)
    ) {
      CalcLexer lex = new CalcLexer(reader);
      Token tok;

      java.util.function.Consumer<String> out = s -> {
        System.out.println(s);
        if (fileOut != null) fileOut.println(s);
      };

      while (true) {
        tok = lex.yylex();
        if (tok == null) break;

        if (tok.type == TokenType.ERROR) {
          out.accept(tok.toString());
          System.exit(1);
        }

        if (tok.type == TokenType.EOF) {
          out.accept("EOF");
          break;
        }

        out.accept(tok.toString());
      }
    } catch (FileNotFoundException e) {
      System.err.println("Arquivo de entrada não encontrado: " + inputPath);
      System.exit(2);
    } catch (IOException e) {
      System.err.println("Falha de I/O: " + e.getMessage());
      System.exit(2);
    } catch (Exception e) {
      System.err.println(e.getMessage());
      System.exit(1);
    }
  }

  private static PrintWriter openWriter(String outPath) throws IOException {
    Path p = Paths.get(outPath);
    Path parent = p.getParent();
    if (parent != null) Files.createDirectories(parent); 
    return new PrintWriter(new BufferedWriter(new FileWriter(p.toFile(), false)), true);
  }
}
