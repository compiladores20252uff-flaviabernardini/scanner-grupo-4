# gerar o lexer a partir do .flex

jflex calc.flex

# compilar tudo

javac *.java

# testar com arquivo

java -cp . Main  nome_do_arquivo.txt

========================

# recompila tudo
jflex calc.flex
rm -f *.class
javac *.java

# pega o arquivo de entrada e gera o arquivo de saida, ai se não tiver ele cria
# ou sobre escreve
java -cp . Main  arquivo_de_entrada.txt --out arquivo_de_saida.txt

