%{
#include <stdio.h>
%}

%%

"if"        { printf("PALABRA RESERVADA: %s\n", yytext); }
"else"      { printf("PALABRA RESERVADA: %s\n", yytext); }
"while"     { printf("PALABRA RESERVADA: %s\n", yytext); }
"int"       { printf("PALABRA RESERVADA: %s\n", yytext); }

[0-9]+      { printf("NUMERO ENTERO: %s\n", yytext); }

[a-zA-Z_][a-zA-Z0-9_]* {
                printf("IDENTIFICADOR: %s\n", yytext);
            }

[ \t\n]+    ;

.           { printf("CARACTER NO RECONOCIDO: %s\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}