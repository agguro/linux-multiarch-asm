/* arch/x86_64/examples/basics/mixed/rw.s */
/* Pure Assembler (no CPP) */

/* .include is an assembler directive (not #include) */
/* Ensure unistd.h is in your include path */

.include "unistd.h"

    .section .rodata
msg_raw:
    .ascii "1. Hello from raw.s (.include & .equ)\n"
len_raw = . - msg_raw

    .section .text
    .globl print_raw

print_raw:
    /*
     * Here we use the .equ constants from unistd.h.
     * STDOUT and __NR_write are available because
     * the assembler treated lines starting with '#' as comments,
     * and executed the .equ lines.
     */
    
    /* 1. Load address */
    leaq msg_raw(%rip), %rsi

    /* 2. Syscall (Manual, without macro) */
    mov $__NR_write, %rax
    mov $STDOUT, %rdi
    /* %rsi is already set */
    mov $len_raw, %rdx
    syscall

    ret
