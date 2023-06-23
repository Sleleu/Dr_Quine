#include <stdio.h>

/*
    Colleen print it's own code
*/

void display_code()
{
    char *output = "#include <stdio.h>%c%c/*%c    Colleen print it's own code%c*/%c%cvoid display_code()%c{%c    char *output = %c%s%c;%c    printf(output, 10, 10, 10, 10, 10, 10, 10, 10, 34, output, 34, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10);%c}%c%cint main()%c{%c    /*%c        Hey ! I'm inside%c    */%c    display_code();%c    return (0);%c}%c";
    printf(output, 10, 10, 10, 10, 10, 10, 10, 10, 34, output, 34, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10);
}

int main()
{
    /*
        Hey ! I'm inside
    */
    display_code();
    return (0);
}
