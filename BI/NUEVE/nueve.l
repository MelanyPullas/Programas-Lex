%{
    #include <stdio.h>
    int conteo[10] = {0};
%}

%%

[0-9]   { conteo[yytext[0] - '0']++; }
.|\n    { /* Ignora el resto de caracteres */ }

%%

int main(void) {
    yylex();

    printf("\n+--------+------------+\n");
    printf("| Digito | Frecuencia |\n");
    printf("+--------+------------+\n");
    for (int i = 0; i < 10; i++) {
        printf("|   %d    | %-10d |\n", i, conteo[i]);
    }
    printf("+--------+------------+\n");

    return 0;
}
