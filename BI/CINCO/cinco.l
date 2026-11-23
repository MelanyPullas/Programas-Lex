%{
        #include<stdio.h>
        int mayusculas=0;
        int minusculas=0;
        int digitos=0;
        int espacios=0;
%}

%%

[A-Z]       { mayusculas++; }
[a-z]       { minusculas++; }
[0-9]       { digitos++; }
[ \t\n\r]   { espacios++; }
.           { /* Ignora signos de puntuacion u otros simbolos */ }

%%

int main() {
    yylex();

    printf("\n--- Conteo de caracteres ---\n");
    printf("Mayusculas : %d\n", mayusculas);
    printf("Minusculas : %d\n", minusculas);
    printf("Digitos    : %d\n", digitos);
    printf("Espacios   : %d\n", espacios);

    return 0;
}
