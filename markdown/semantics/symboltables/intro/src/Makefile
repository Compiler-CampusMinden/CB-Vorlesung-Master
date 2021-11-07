DOCKER = docker run -i --rm -u "$(shell id -u):$(shell id -g)" -v "$(shell pwd):/work" -w "/work"
IMAGE  = openjdk/antlr4

JAVA   = $(DOCKER) --entrypoint "java"  $(IMAGE)
JAVAC  = $(DOCKER) --entrypoint "javac" $(IMAGE)

CP    = -cp .:/opt/antlr4/antlr-4.9.2-complete.jar
ANTLR = $(JAVA) $(CP) org.antlr.v4.Tool
GRUN  = $(JAVA) $(CP) org.antlr.v4.gui.TestRig


EXAMPLES = Demo


$(EXAMPLES): %: %.tokens
	$(GRUN) $@ start -ps wuppie.ps

%.tokens: %.g4
	$(ANTLR) $<
	$(JAVAC) $(CP) *.java


.PHONY: clean
clean:
	rm -rf *.interp *.tokens *.class
	rm -rf $(patsubst %,%Base*,$(EXAMPLES)) $(patsubst %,%Listener*,$(EXAMPLES))
	rm -rf $(patsubst %,%Lexer*,$(EXAMPLES)) $(patsubst %,%Parser*,$(EXAMPLES))
