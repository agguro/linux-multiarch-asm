;name: sleep.asm
;
;build: nasm -felf64 sleep.asm -o sleep.o
;
;description: running the program will pause execution s seconds.

bits 64

[list -]
    %include "unistd.inc"
[list +]

section .text

global sleep
sleep:
    push    rbp
    mov     rbp,rsp
    push    0                           ;no nanosecs
    push    rdi                         ;seconds on stack
    syscall nanosleep,rsp,0
    mov     rsp,rbp
    pop     rbp
    ret
