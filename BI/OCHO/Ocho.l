%{
#include <stdio.h>
#include <ctype.h>
%}

%%

[A-Z]   { printf("%c", tolower(yytext[0])); }
.       { ECHO; }
\n      { ECHO; }

%%
int main()
{
    yylex();
    return 0;
}
int yywrap()
{
    return 1;
}
