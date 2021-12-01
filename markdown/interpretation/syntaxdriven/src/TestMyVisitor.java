import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

import java.util.*;

public class TestMyVisitor {
    public static void main(String[] args) throws Exception {
        calcLexer lexer = new calcLexer(CharStreams.fromStream(System.in));
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        calcParser parser = new calcParser(tokens);

        ParseTree tree = parser.s();    // Start-Regel
        System.out.println(tree.toStringTree(parser));

        MyVisitor eval = new MyVisitor();
        System.out.println(eval.visit(tree));
    }

    public static class MyVisitor extends calcBaseVisitor<Integer> {

        public Integer visitMULT(calcParser.MULTContext ctx) {
            return visit(ctx.e1) * visit(ctx.e2);   // {$v = $e1.v * $e2.v;}
        }

        public Integer visitADD(calcParser.ADDContext ctx) {
            return visit(ctx.e1) + visit(ctx.e2);   // {$v = $e1.v + $e2.v;}
        }

        public Integer visitZAHL(calcParser.ZAHLContext ctx) {
            return Integer.valueOf(ctx.DIGIT().getText());
        }
    }
}
