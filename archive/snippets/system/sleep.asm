; name       : sleep.asm
; description: running the program will pause execution rdi seconds.
; source     : https://stackoverflow.com/questions/3351940/detecting-the-memory-page-size/3351960#3351960
; build      : release: nasm -f elf64 -I ../../../includes -o sleep.o sleep.asm
;              debug  : nasm -f elf64 -I ../../../includes -g -Fdwarf -o sleep.debug.o sleep.asm

bits 64

[list -]
    %include "unistd.inc"
[list +]

global sleep

section .text

sleep:
    push    rbp
    mov     rbp,rsp
    push    0                           ;no nanosecs
    push    rdi                         ;seconds on stack
    syscall nanosleep,rsp,0
    mov     rsp,rbp
    pop     rbp
    ret
