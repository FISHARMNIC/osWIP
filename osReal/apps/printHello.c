#include "includes/application.c"
#include "includes/stdio.c"

int myVar = 123;

void main()
{
    char* char1 = "hello";
    //volatile char* char2 = "byebye";
    myputs_test(char1);
    // reads from bad address. needs to be offset
    myputi_test(myVar);
}