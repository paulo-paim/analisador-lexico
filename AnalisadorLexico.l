
%{
#include <stdio.h>
%}

digito [0-9]
ponto [.]
operado [*|/|+|<|>]
operadorMenos [-]
atribuicao [=]
separador [,|;|(|)|{|}]
especial1 [[]
especial2 []]
comentario [/]
letra [A-Za-z]


int {digito}+
real {int}{ponto}{int}

string {letra}({digito}*{letra}*)*


pontuacao {separador}|{especial1}|{especial2}

operador {operado}|{operadorMenos}

%%
{int} {printf("num: %s",yytext);}
{real} {printf("%s",yytext);}

{comentario}{comentario} {printf("comentario");}
{operador} {printf("op: %s",yytext);}
{pontuacao} {printf("pont: %s",yytext);}

{string} {printf("STRING %s",yytext);}

{atribuicao} {printf("Atribuicao");}

%%
int main(int argc, char *argv[]){
yyin(fopen("r",argv[1]));

yylex ( ) ;
}
