#include <stdlib.h>

int exp() {
    int a = 3, b = 7;
    int c,d;
    int *p;

    c = a + b; //SSA

    p = &d;
    *(p+3) = a - b; 
    //*p = a + b; // non-SSA
    d = a + b;

    return c;
}