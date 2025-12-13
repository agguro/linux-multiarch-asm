/* raw.s - Pure Assembler (geen CPP) */

/* .include is een assembler commando (geen #include) */
/* Zorg dat unistd.h in je include pad staat */
.include "unistd.h"

    .section .rodata
msg_raw:
    .ascii "1. Hello from raw.s (.include & .equ)\n"
len_raw = . - msg_raw

    .section .text
    .globl print_raw

print_raw:
    /*
     * Hier gebruiken we de .equ constanten uit unistd.h
     * STDOUT en __NR_write zijn beschikbaar omdat
     * de assembler de regels met '#' als commentaar zag,
     * en de .equ regels heeft uitgevoerd.
     */
    
    /* 1. Adres laden */
    leaq msg_raw(%rip), %rsi

    /* 2. Syscall (Handmatig, zonder macro) */
    mov $__NR_write, %rax
    mov $STDOUT, %rdi
    /* %rsi is al gezet */
    mov $len_raw, %rdx
    syscall

    ret
