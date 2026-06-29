// Runtime shims required by the embedded Swift object.
//
// Embedded Swift's allocator calls posix_memalign/free, and -O code may emit
// stack-protector references. Provide minimal implementations backed by
// libdragon's malloc. Compiled by the libdragon GCC so the ABI matches.

#include <stddef.h>
#include <stdlib.h>

void *__stack_chk_guard = (void *)0xdeadbeef;

void __stack_chk_fail(void) {
    while (1);
}

int posix_memalign(void **memptr, size_t alignment, size_t size) {
    (void)alignment;
    void *ptr = malloc(size);
    if (ptr) {
        *memptr = ptr;
        return 0;
    }
    return 12;  // ENOMEM
}
