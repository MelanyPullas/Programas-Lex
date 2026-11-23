%{
    #include <stdio.h>
%}

%%

[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}   { printf("Token valido (EMAIL): %s\n", yytext); }
[ \t\n\r]+                                    { /* Ignora espacios y saltos de linea */ }
[^ \t\n\r]+                                   { printf("Token no valido     : %s\n", yytext); }

%%

int main(void) {
    yylex();
    return 0;
}
