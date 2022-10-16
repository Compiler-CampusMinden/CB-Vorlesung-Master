import org.antlr.v4.runtime.*;

public class Main {
    public static void main(String[] args) throws Exception {
        Lexer l = new HelloLexer(CharStreams.fromStream(System.in));
        Token t = l.nextToken();
        while (t.getType() != Token.EOF) {
            System.out.println(t);
            t = l.nextToken();
        }
    }
}
