%{
#include <stdio.h>
int linha=1;
%}

digito 		[0-9]
letra 		[A-Za-z]
operador 	"*"|"/"|"+"|"-"|"%"
logico 		"<"|">"|"<="|">="|"=="|"!="|"&&"|"||"
atribuicao 	[=]
instrucao 	[;]
separacao 	[,]
escopo 		"("|")"|"{"|"}"|"["|"]"
enter 		[\n]
tab 		[\t]

int 		[+-]?{digito}+
real 		{int}[.]{digito}+
string 		{letra}({digito}*{letra}*)*

comentario 	"//"[^\n]*
reservada 	"se"|"senao"|"para"|"enquanto"|"int"|"real"|"string"|"mainq"

%%

{int} {printf("valor inteiro: %s\t-> linha: %d\n",yytext, linha);}
{real} {printf("valor real: %s\t-> linha: %d\n",yytext, linha);}

{reservada} {printf("palavra reservada: %s\t-> linha: %d\n", yytext, linha);}
{string} {printf("string de identificadores: %s\t-> linha: %d\n",yytext, linha);}
{comentario} {printf("comentario em linha: %s\t-> linha: %d\n",yytext, linha);}

{operador} {printf("operador matematico: %s\t-> linha: %d\n",yytext, linha);}
{logico} {printf("operador logico: %s\t-> linha: %d\n",yytext, linha);}
{atribuicao} {printf("operador de atribuicao: %s\t-> linha: %d\n",yytext, linha);}

{instrucao} {printf("fim da instrucao: %s\t-> linha: %d\n",yytext, linha);}
{separacao} {printf("separador de operandos: %s\t-> linha: %d\n",yytext, linha);}
{escopo} {printf("delimitador de escopo: %s\t-> linha: %d\n",yytext, linha);}

{enter} {printf("delimitador de linha: ENTER\t-> linha: %d\n",linha); linha++;}
{tab} {printf("tabulacao: TAB\t-> linha: %d\n",linha);}
.[^\n]* {printf("ERRO. Caracter desconhecido: %s\t-> linha: %d\n",yytext, linha);}

%%

int main(int argc, char **argv){
  printf("nome do arquivo carregado: %s\n\nTokens encontrados no arquivo:\n\n",argv[1]);
  yyin=fopen(argv[1], "r");
  yylex();
}
