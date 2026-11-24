%{x
#include <stdio.h>
#include <stdlib.h>
%}
%%
0[xX][0-9a-fA-F]+ {
    long decimal = strtol(yytext, NULL, 16);
    printf("%s = %ld\n", yytext, decimal);
}

[ \t\n]+ ;
. {
    printf("%s = No es un hexadecimal valido\n", yytext);
}
%%
int main() {
    yylex();
    return 0;
}
int yywrap() {
    return 1;
}
