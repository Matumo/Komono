
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "valgrind/memcheck.h"

int main() {
    // addr = 1, init = 0
    char* test = malloc(10);
    printf("0: addr %lu\n---\n", VALGRIND_CHECK_MEM_IS_ADDRESSABLE(test, 10));
    printf("0: addr & init %lu\n---\n", VALGRIND_CHECK_MEM_IS_DEFINED(test, 10));

    // addr = 1, init = 1
    memset(test, 0, 10);
    printf("1: addr %lu\n---\n", VALGRIND_CHECK_MEM_IS_ADDRESSABLE(test, 10));
    printf("1: addr & init %lu\n---\n", VALGRIND_CHECK_MEM_IS_DEFINED(test, 10));

    // addr = 0, init = 0
    free(test);
    printf("2: addr %lu\n---\n", VALGRIND_CHECK_MEM_IS_ADDRESSABLE(test, 10));
    printf("2: addr & init %lu\n---\n", VALGRIND_CHECK_MEM_IS_DEFINED(test, 10));

    // addr = 1, init = 0
    //VALGRIND_MAKE_MEM_UNDEFINED(test, 10);

    // addr = 1, init = 1
    VALGRIND_MAKE_MEM_DEFINED(test, 10);

    // addr = 0, init = 0
    VALGRIND_MAKE_MEM_NOACCESS(test, 10);

    printf("3: addr %lu\n---\n", VALGRIND_CHECK_MEM_IS_ADDRESSABLE(test, 10));
    printf("3: addr & init %lu\n---\n", VALGRIND_CHECK_MEM_IS_DEFINED(test, 10));

    // avoid
    memset(test, 0, 10);
}
