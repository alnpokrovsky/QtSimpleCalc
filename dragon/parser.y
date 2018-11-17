%{
#include <stdio.h>
#include <ctype.h>
#define YYSTYPE double
void yyerror(char *s) {
    fprintf (stderr, "%s\n", s);
}
extern int yylex(void);
%}

%token NUMBER

%left '+' '-'
%left '*' '/'
%right UMINUS
%%

lines   : lines expr '\n'   { printf("%g\n", $2); }
        | lines '\n'
        | /* empty */
        ;
expr    : expr '+' expr     { $$ = $1 + $3; }
        | expr '-' expr     { $$ = $1 - $3; }
        | expr '*' expr     { $$ = $1 * $3; }
        | expr '/' expr     { $$ = $1 / $3; }
        | '(' expr ')'      { $$ = $2; }
        | '-' expr %prec UMINUS { $$ = -$2; }
        | NUMBER
        ;
%%