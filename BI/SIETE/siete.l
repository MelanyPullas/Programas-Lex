%{
    #include <stdio.h>
%}

%%

==|!=|<=|>=|<|>     { printf("Operador relacional : %s\n", yytext); }
[+\-*/]             { printf("Operador aritmetico : %s\n", yytext); }
[ \t\n\r]+          { /* Ignora espacios en blanco */ }
.                   { /* Ignora otros caracteres */ }

%%

int main(void) {
    yylex();
    return 0;
}
