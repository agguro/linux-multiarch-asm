;name: %{FileName}.asm
;
;description:
;

bits 64

%include "../%{FileName}/%{FileName}.inc"

global main

section .bss
;uninitialized read-write data 

section .data
;initialized read-write data

section .rodata
;read-only data

section .text

main:
    push    rbp
    mov     rbp,rsp

    ;TODO: put your code here...

    xor     rax,rax             ;return error code
    mov     rsp,rbp
    pop     rbp
    ret                         ;exit is handled by compiler
