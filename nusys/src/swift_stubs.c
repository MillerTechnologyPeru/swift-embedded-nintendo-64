#include <stddef.h>

void *__stack_chk_guard = (void *)0xdeadbeef;

void __stack_chk_fail(void) {
    while (1);
}

int posix_memalign(void **memptr, size_t alignment, size_t size) {
    extern void *malloc(size_t);
    void *ptr = malloc(size);
    if (ptr) {
        *memptr = ptr;
        return 0;
    }
    return 12;
}

void free(void *ptr) {
}