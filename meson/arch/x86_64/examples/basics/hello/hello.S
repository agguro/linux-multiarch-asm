#include <asm/unistd.h>

    .section .data
msg:
    .ascii  "Hello from x86\n"
len = . - msg

    .section .text
    .globl _start

_start:

    /* write(1, msg, len) */
    mov $__NR_write, %rax     # syscall number
    mov $1, %rdi               # fd = stdout
    lea msg(%rip), %rsi        # pointer to message, lea for position independent code
    mov $len, %rdx             # length
    syscall

    /* exit(0) */
    mov $__NR_exit, %rax
    xor %rdi, %rdi             # exit code = 0
    syscall

