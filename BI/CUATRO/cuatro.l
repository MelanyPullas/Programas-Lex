%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
[+-]?[0-9]+(\.[0-9]+)?[Ee][+-]?[0-9]+    printf("NUMERO REAL EXPONENCIAL\n");

[+-]?[0-9]+\.[0-9]+([Ee][+-]?[0-9]+)?    printf("NUMERO REAL\n");

[0-9]+                                   printf("NUMERO ENTERO\n");

[a-zA-Z][a-zA-Z0-9]*                     printf("IDENTIFICADOR\n");

[ \t\r\n]+                               ;

.                                        printf("INVALIDO\n");
%%

int main() {
    yylex();
    return 0;
}
