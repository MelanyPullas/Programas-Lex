%{
    #include <stdio.h>
    #include <stdlib.h>
%}

%%

[01]+       { printf("Binario: %s -> Decimal: %ld\n", yytext, strtol(yytext, NULL, 2)); }
[0-9]+      { /* Evita que numeros como 1012 se partan y se lean como 101 */ }
[ \t\n\r]+  { /* Ignora espacios en blanco */ }
.           { /* Ignora otros caracteres */ }

%%

int main(void) {
    yylex();
    return 0;
}
