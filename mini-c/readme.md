1. A partir da raíz (/mini-c), gera o Parser na pasta /src a partir do arquivo .cup:

```
java -cp java-cup-11b.jar java_cup.Main -destdir src -interface -parser CMinusParser -symbols Sym c_minus_parser.cup
```

2. Gera o Lexer na pasta /src a partir do arquivo .flex com jflex:

```
java -jar jflex-full-1.9.1.jar -d src c_minus_lexer.flex
```

3. Compila tudo pra pasta /build, usando o runtime do CUP:

```
javac -cp .:java-cup-11b.jar ./src/*.java -d build   
```

4. Para rodar os testes:

```
java -cp build:java-cup-11b.jar CMinusParser tests/test.cminus.txt
```

- O método main executa System.out.println(p.parse().value);
- Se funcionar e a gramática for aceita, imprime `null`
- Se tiver erro de sintaxe, imprime mensagem de erro.

Exemplo:
```
> $ java -cp build:java-cup-11b.jar CMinusParser tests/test4_err.cminus.txt

Syntax error
instead expected token classes are []
Couldn't repair and continue parse
Exception in thread "main" java.lang.Exception: Can't recover from previous error(s)
        at java_cup.runtime.lr_parser.report_fatal_error(lr_parser.java:392)
        at java_cup.runtime.lr_parser.unrecovered_syntax_error(lr_parser.java:539)
        at java_cup.runtime.lr_parser.parse(lr_parser.java:731)
        at CMinusParser.main(CMinusParser.java:285)


```