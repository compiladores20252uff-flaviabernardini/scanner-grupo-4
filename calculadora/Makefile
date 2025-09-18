JAVAC=javac
JAVA=java

all: lexer build

lexer:
	jflex calc.flex

build:
	$(JAVAC) *.java

run:
	$(JAVA) Main

clean:
	rm -f CalcLexer.java *.class
