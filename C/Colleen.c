#include <stdio.h>

int main()
{
    char *output = "#include <stdio.h>%c%cint main()%c{%c    char *output = %c%s%c;%c    printf(output, 10, 10, 10, 10, 34, output, 34, 10, 10, 10);%c}%c";
    printf(output, 10, 10, 10, 10, 34, output, 34, 10, 10, 10);
}
