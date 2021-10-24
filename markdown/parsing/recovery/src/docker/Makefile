.PHONY: all
all: Dockerfile
	docker build -t openjdk/antlr4 -f Dockerfile .

.PHONY: clean
clean:
	-docker rmi openjdk/antlr4
