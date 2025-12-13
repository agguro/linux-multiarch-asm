#include "syscalls.h"

.intel_syntax noprefix

.section .data
    msg:    .ascii  "Hello from x86\n"
    len =   . - msg

.section .text
.global _start

_start:
    mov     rax, __NR_write
    mov     rdi, 1
    lea     rsi, msg
    mov     rdx, len   
    syscall
   
    mov     rax, __NR_exit
    mov     rdi, 0
    
    syscall

.section .note.GNU-stack,"",@progbits