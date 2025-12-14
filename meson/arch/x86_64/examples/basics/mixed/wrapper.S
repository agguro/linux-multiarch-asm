/* arch/x86_64/examples/basics/mixed/wrapper.S
 * Preprocessed Assembler
*/

#include "syscalls.h"

    .section .rodata
msg_wrapper:
    .ascii "2. Hello from wrapper.S (#include & macros)\n"
len_wrapper = . - msg_wrapper

    .section .text
    .globl print_wrapper

print_wrapper:
    /*
     * Here we utilize the full power of your setup:
     * - #include (C preprocessor)
     * - _syscall macro
     * - PIE addressing
     */
    
    leaq msg_wrapper(%rip), %rsi
    _syscall $__NR_write, $STDOUT, %rsi, $len_wrapper
    
    ret
