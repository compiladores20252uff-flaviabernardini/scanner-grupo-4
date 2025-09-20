import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class Main {
    public static void main(String[] args) throws Exception {
        if (args.length == 0) {
            System.err.println("Uso: java Main <arquivo>");
            System.exit(1);
        }
        try (BufferedReader br = new BufferedReader(new FileReader(args[0]))) {
            CMinusLexer lexer = new CMinusLexer(br);
            Token tk;
            while ((tk = lexer.nextToken()).type != TokenType.EOF) {
                System.out.println(tk);
            }
        } catch (IOException e) {
            System.err.println("Erro ao ler arquivo: " + e.getMessage());
        }
    }
}
