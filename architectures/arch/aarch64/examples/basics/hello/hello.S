#include <asm/unistd.h>

.section .data
    msg:    .ascii      "Hello World!\n"
    len =   . - msg

.section .text
.global _start

_start:
   
    mov     x0, 1
    ldr     x1, =msg
    mov     x2, len
    mov     x8, __NR_write      
    svc     0

    mov     x0, 0
    mov     x8, __NR_exit          
    svc     0
