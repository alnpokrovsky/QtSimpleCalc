%{
    #include <stdio.h>
    #include <stdint.h>
    #include "parser.tab.h"
%}

%option yylineno
%option noyywrap

digit   [0-9]
number	{digit}+(\.{digit}+)?(E[+-]?{digit}+)?

%%

[ ]         { /* skip blanks */ }
;.*$        { /* comment */ }
{number}	{ sscanf(yytext, "%lf", &yylval);
              return NUMBER; }
\n|.		{ return yytext[0]; }

%%

