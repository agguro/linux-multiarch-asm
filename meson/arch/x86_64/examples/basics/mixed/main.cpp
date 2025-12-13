/* main.cpp */
#include "unistd.h"

/* Externe functies declareren (uit de .s en .S files) */
extern "C" void print_raw();
extern "C" void print_wrapper();

void print_cpp() {
    const char* msg = "3. Hello from C++ (Inline ASM & #define)\n";
    long len = 41;

    /* * Inline Assembly.
     * Hier worden __NR_write en STDOUT door de C-preprocessor
     * vervangen door '1' voordat de assembler het ziet.
     */
    asm volatile (
        "syscall"
        : /* geen output */
        : "a" ((long)__NR_write),
          "D" ((long)STDOUT),
          "S" (msg),
          "d" (len)
        : "rcx", "r11", "memory"
    );
}

int main() {
    print_raw();     // De .s file
    print_wrapper(); // De .S file
    print_cpp();     // De C++ inline

    return 0;
}
