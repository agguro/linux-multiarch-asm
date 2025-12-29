/* arch/x86_64/examples/basics/mixed/main.cpp */

#include "unistd.h"

/* Declare external functions (defined in the .s and .S files) */
extern "C" void print_raw();
extern "C" void print_wrapper();

void print_cpp() {
    const char* msg = "3. Hello from C++ (Inline ASM & #define)\n";
    long len = 41;

    /*
     * Inline Assembly.
     * Here, __NR_write and STDOUT are substituted by the C preprocessor
     * (replaced by their numeric values) before the assembler even sees them.
     */
    asm volatile (
        "syscall"
        : /* no output */
        : "a" ((long)__NR_write),  // Loads __NR_write into %rax
          "D" ((long)STDOUT),      // Loads STDOUT into %rdi
          "S" (msg),               // Loads address of msg into %rsi
          "d" (len)                // Loads len into %rdx
        : "rcx", "r11", "memory"   // Clobber list (registers changed by syscall)
    );
}

int main() {
    print_raw();     // The raw .s file
    print_wrapper(); // The preprocessed .S file
    print_cpp();     // The C++ inline function

    return 0;
}
