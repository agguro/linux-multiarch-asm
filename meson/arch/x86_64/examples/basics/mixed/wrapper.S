/* wrapper.S - Preprocessed Assembler */

#include "syscalls.h"

    .section .rodata
msg_wrapper:
    .ascii "2. Hello from wrapper.S (#include & macros)\n"
len_wrapper = . - msg_wrapper

    .section .text
    .globl print_wrapper

print_wrapper:
    /*
     * Hier gebruiken we de volle kracht van je setup:
     * - #include (C preprocessor)
     * - _syscall macro
     * - PIE addressing
     */
    
    leaq msg_wrapper(%rip), %rsi
    _syscall write, $STDOUT, %rsi, $len_wrapper
    
    ret
