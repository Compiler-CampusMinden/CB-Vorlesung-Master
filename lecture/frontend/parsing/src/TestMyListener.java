import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

public class TestMyListener {
    public static void main(String[] args) throws Exception {
        CharStream in = CharStreams.fromString("2+3*4");
        calcLexer lexer = new calcLexer(in);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        calcParser parser = new calcParser(tokens);

        ParseTree tree = parser.s();    // Start-Regel

        ParseTreeWalker walker = new ParseTreeWalker();
        MyListener eval = new MyListener();
        walker.walk(eval, tree);
    }

    public static class MyListener extends calcBaseListener {
        public void exitMULT(calcParser.MULTContext ctx) {
            System.out.println("exitMULT: e1=" + ctx.e1.getText() + ", e2=" + ctx.e1.getText());
        }

        public void exitADD(calcParser.ADDContext ctx) {
            System.out.println("exitADD:  e1=" + ctx.e1.getText() + ", e2=" + ctx.e1.getText());
        }

        public void exitZAHL(calcParser.ZAHLContext ctx) {
            System.out.println("exitZAHL: DIGIT=" + ctx.DIGIT().getText());
        }
    }
}
