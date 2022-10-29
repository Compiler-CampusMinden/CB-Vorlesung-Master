import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

public class TestMyVisitor {
    public static void main(String[] args) throws Exception {
        CharStream in = CharStreams.fromString("2+3*4");
        calcLexer lexer = new calcLexer(in);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        calcParser parser = new calcParser(tokens);

        ParseTree tree = parser.s();    // Start-Regel

        MyVisitor eval = new MyVisitor();
        eval.visit(tree);
    }

    public static class MyVisitor extends calcBaseVisitor<Integer> {
        public Integer visitMULT(calcParser.MULTContext ctx) {
            System.out.println("visitMULT: e1=" + ctx.e1.getText() + ", e2=" + ctx.e1.getText());
            return visit(ctx.e1) * visit(ctx.e2);
        }

        public Integer visitADD(calcParser.ADDContext ctx) {
            System.out.println("visitADD:  e1=" + ctx.e1.getText() + ", e2=" + ctx.e1.getText());
            return visit(ctx.e1) + visit(ctx.e2);
        }

        public Integer visitZAHL(calcParser.ZAHLContext ctx) {
            System.out.println("visitZAHL: DIGIT=" + ctx.DIGIT().getText());
            return Integer.valueOf(ctx.DIGIT().getText());
        }
    }
}
