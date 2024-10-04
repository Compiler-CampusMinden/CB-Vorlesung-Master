import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class MainTest {
  @Test
  void appHasAGreeting() {
    Main classUnderTest = new Main();
    assertNotNull(classUnderTest.getGreeting(), "app should have a greeting");
  }
}
