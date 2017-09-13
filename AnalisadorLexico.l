
%{
#include <stdio.h>
%}

digito [0-9]
letra [A-Za-z]
operador [*|/|+|-|%]
logico [<|>|<=|>=|==|&&|"||"]
atribuicao [=]
instrucao [;]
separacao [,]
escopo [(|)|{|}|\]|\[]
enter [\n]
tab [\t]

int {digito}+
intSinal [+|-]{digito}+
real {int}[.]{int}
realSinal [+|-]{int}[.]{int}

string {letra}({digito}*{letra}*)*
comentario [//][^\n]*
reservada [se|senao|para|enquanto|int|real|char]

%%

{int} {printf("inteiro: %s\n",yytext);}
{real} {printf("real: %s\n",yytext);}
{intSinal} {printf("inteiro com sinal: %s\n",yytext);}
{realSinal} {printf("real com sinal: %s\n",yytext);}

{string} {printf("string: %s\n",yytext);}
{reservada}	{printf( "palavra reservada: %s\n", yytext);}
{comentario} {printf("comentario: %s\n",yytext);}

{operador} {printf("operador matematico: %s\n",yytext);}
{logico} {printf("operador logico: %s\n",yytext);}
{atribuicao} {printf("Atribuicao: %s\n",yytext);}

{instrucao} {printf("fim da instrucao: %s\n",yytext);}
{separacao} {printf("separador: %s\n",yytext);}
{escopo} {printf("delimitador de escopo: %s\n",yytext);}


{enter} {printf("ENTER\n");}
{tab} {printf("TABULACAO\n");}
.[^\n]* {printf("ERRO\n");}
%%

int main(int argc, char **argv){
  printf("nome do arquivo carregado: %s\n\nTokens encontrados no arquivo:\n\n",argv[1]);
  yyin=fopen(argv[1], "r");
  yylex();
}
