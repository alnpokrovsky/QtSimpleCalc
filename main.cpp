#include "parser.tab.hpp"
#include <stdio.h>

int main()
{
    for(;;) {
        yyparse();
    }
    return 0;
}
