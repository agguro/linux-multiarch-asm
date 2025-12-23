#include <asm/unistd.h>

.section .rodata
msg: .string "Hello from RISC-V\n"
len =   . - msg

.text
.globl _start

_start:

    # write(1, msg, len)
    li      a7, __NR_write       # Syscall constante uit header
    li      a0, 1
    la      a1, msg
    li      a2, len
    ecall

    # exit(0)
    li      a7, __NR_exit
    li      a0, 0
    ecall
