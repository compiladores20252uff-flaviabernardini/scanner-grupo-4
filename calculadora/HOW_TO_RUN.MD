# Como Rodar a Calculadora com CUP

## Pré-requisitos

- Java JDK instalado
- JFlex instalado (verificar com `jflex --version`)

## Passo 0: Verificar/Baixar as Ferramentas CUP

**Nota:** Se os arquivos JAR já estiverem no repositório (commitados), você pode pular este passo.

### Verificar se os arquivos já existem
```bash
# Se ambos os arquivos existirem, pule para o Passo 1
ls java-cup-11b.jar java-cup-runtime-11b.jar
```

### Baixar CUP (se necessário)
```bash
# Só baixe se o arquivo não existir
if [ ! -f java-cup-11b.jar ]; then
  curl -L -o java-cup-11b.jar \
    https://repo1.maven.org/maven2/com/github/vbmacher/java-cup/11b/java-cup-11b.jar
fi
```

### Baixar Runtime do CUP (se necessário)
```bash
# Só baixe se o arquivo não existir
if [ ! -f java-cup-runtime-11b.jar ]; then
  curl -L -o java-cup-runtime-11b.jar \
    https://repo1.maven.org/maven2/com/github/vbmacher/java-cup-runtime/11b/java-cup-runtime-11b.jar
fi
```

**Ou baixar ambos de uma vez (se necessário):**
```bash
# Baixa ambos apenas se não existirem
[ ! -f java-cup-11b.jar ] && curl -L -o java-cup-11b.jar \
  https://repo1.maven.org/maven2/com/github/vbmacher/java-cup/11b/java-cup-11b.jar

[ ! -f java-cup-runtime-11b.jar ] && curl -L -o java-cup-runtime-11b.jar \
  https://repo1.maven.org/maven2/com/github/vbmacher/java-cup-runtime/11b/java-cup-runtime-11b.jar
```

## Passo 1: Gerar o Lexer

Gera o arquivo `CalcLexerCup.java` a partir de `calc_cup.flex`:

```bash
jflex calc_cup.flex
```

**Nota:** O arquivo `calc_cup.flex` utiliza nomes totalmente qualificados (`java_cup.runtime.Symbol`) no código do usuário, garantindo que o lexer gerado sempre compila corretamente, mesmo que o JFlex coloque imports em posição incorreta.

## Passo 2: Gerar o Parser

Gera os arquivos `CalcParser.java` e `sym.java` a partir de `calc.cup`:

```bash
java -cp java-cup-11b.jar java_cup.Main -parser CalcParser -symbols sym calc.cup
```

Isso cria:
- `CalcParser.java` - o parser gerado
- `sym.java` - símbolos/tokens definidos

## Passo 3: Compilar

Compila todos os arquivos necessários (incluindo o runtime do CUP no classpath):

```bash
javac -cp .:java-cup-11b.jar:java-cup-runtime-11b.jar CalcLexerCup.java CalcParser.java sym.java
```

## Passo 4: Executar

### Opção 1: Via pipe (entrada padrão)
```bash
echo "(1+2)*3.5//2**3" | java -cp .:java-cup-runtime-11b.jar CalcParser
```

### Opção 2: Via arquivo
```bash
java -cp .:java-cup-runtime-11b.jar CalcParser teste_funcional.txt
```

## Resumo dos Comandos

```bash
# 0. Verificar/Baixar ferramentas (só se não existirem)
[ ! -f java-cup-11b.jar ] && curl -L -o java-cup-11b.jar https://repo1.maven.org/maven2/com/github/vbmacher/java-cup/11b/java-cup-11b.jar
[ ! -f java-cup-runtime-11b.jar ] && curl -L -o java-cup-runtime-11b.jar https://repo1.maven.org/maven2/com/github/vbmacher/java-cup-runtime/11b/java-cup-runtime-11b.jar

# 1. Gerar lexer
jflex calc_cup.flex

# 2. Gerar parser
java -cp java-cup-11b.jar java_cup.Main -parser CalcParser -symbols sym calc.cup

# 3. Compilar
javac -cp .:java-cup-11b.jar:java-cup-runtime-11b.jar CalcLexerCup.java CalcParser.java sym.java

# 4. Executar
echo "(1+2)*3.5//2**3" | java -cp .:java-cup-runtime-11b.jar CalcParser
# ou
java -cp .:java-cup-runtime-11b.jar CalcParser teste_funcional.txt
```
