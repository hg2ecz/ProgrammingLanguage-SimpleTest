// gcc -Wall -O2 teszt1.c -o teszt1

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    long toval = atoll(argv[1]);
    long i, j, sumval = 0;
    for (i=0; i<toval; i++) {
        for (j=0; j<toval; j++) {
            sumval += i+(j^1);
        }
    }
    printf("C: %lu\n", sumval);
}

