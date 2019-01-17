#include <stdio.h>

extern int yyparse(void);

int main()
{
    for(;;) {
        yyparse();
    }
    return 0;
}
