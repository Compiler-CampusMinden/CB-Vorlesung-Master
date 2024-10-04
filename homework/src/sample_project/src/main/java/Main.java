import java.io.IOException;
import my.pkg.*;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;

public class Main {
  public String getGreeting() {
    return "Hello World!";
  }

  public static void main(String... args) throws IOException {
    System.out.println(new Main().getGreeting());

    String input = "2 + 8 * 2;";

    HelloLexer lexer = new HelloLexer(CharStreams.fromString(input));
    CommonTokenStream tokens = new CommonTokenStream(lexer);
    HelloParser parser = new HelloParser(tokens);

    ParseTree tree = parser.start(); // Start-Regel
    System.out.println(tree.toStringTree(parser));

    String input2 = "42 * 8 + 2;";

    HelloPackageLexer lexer2 = new HelloPackageLexer(CharStreams.fromString(input2));
    CommonTokenStream tokens2 = new CommonTokenStream(lexer2);
    HelloPackageParser parser2 = new HelloPackageParser(tokens2);

    ParseTree tree2 = parser2.start(); // Start-Regel
    System.out.println(tree2.toStringTree(parser2));
  }
}
