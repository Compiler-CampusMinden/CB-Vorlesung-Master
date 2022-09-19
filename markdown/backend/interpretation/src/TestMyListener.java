import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

import java.util.*;

public class TestMyListener {
    public static void main(String[] args) throws Exception {
        calcLexer lexer = new calcLexer(CharStreams.fromStream(System.in));
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        calcParser parser = new calcParser(tokens);

        ParseTree tree = parser.s();    // Start-Regel
        System.out.println(tree.toStringTree(parser));

        ParseTreeWalker walker = new ParseTreeWalker();
        MyListener eval = new MyListener();
        walker.walk(eval, tree);
        System.out.println(eval.stack.pop());
    }

    public static class MyListener extends calcBaseListener {
        Stack<Integer> stack = new Stack<Integer>();

        public void exitMULT(calcParser.MULTContext ctx) {
            int right = stack.pop();
            int left = stack.pop();
            stack.push(left * right);   // {$v = $e1.v * $e2.v;}
        }

        public void exitADD(calcParser.ADDContext ctx) {
            int right = stack.pop();
            int left = stack.pop();
            stack.push(left + right);   // {$v = $e1.v + $e2.v;}
        }

        public void exitZAHL(calcParser.ZAHLContext ctx) {
            stack.push(Integer.valueOf(ctx.DIGIT().getText()));
        }
    }
}
