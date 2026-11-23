%{
    #include <stdio.h>
    int espera_elemento = 1;
    int linea_vacia = 1;
%}

%%

[a-zA-Z_][a-zA-Z0-9_]*  {
                            linea_vacia = 0;
                            if (espera_elemento) {
                                printf("IDENTIFICADOR : %s\n", yytext);
                                espera_elemento = 0;
                            } else {
                                printf("Error: se esperaba ',' antes de '%s'\n", yytext);
                            }
                        }

[0-9]+                  {
                            linea_vacia = 0;
                            if (espera_elemento) {
                                printf("ENTERO        : %s\n", yytext);
                                espera_elemento = 0;
                            } else {
                                printf("Error: se esperaba ',' antes de '%s'\n", yytext);
                            }
                        }

","                     {
                            linea_vacia = 0;
                            if (!espera_elemento) {
                                printf("SEPARADOR     : ,\n");
                                espera_elemento = 1;
                            } else {
                                printf("Error: coma inesperada (falta un elemento)\n");
                            }
                        }

[ \t\r]+                { /* Ignora espacios y tabulaciones */ }

\n                      {
                            if (espera_elemento && !linea_vacia) {
                                printf("Error: lista incompleta despues de ','\n");
                            }
                            espera_elemento = 1;
                            linea_vacia = 1;
                        }

[^ \t\r\n,]+            {
                            linea_vacia = 0;
                            printf("Error: token no valido '%s'\n", yytext);
                            if (espera_elemento) {
                                espera_elemento = 0;
                            }
                        }

%%

int main(void) {
    yylex();

}
