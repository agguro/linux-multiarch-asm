;name: hello.asm
;
;description: example of a build with cmake and nasm
;
;build:
;    in the project root directory
;    cmake .
;    make

global  _start

section .data
msg     db      'Hello world', 0x0A
.len    equ     $ - msg

section .text

_start:
    xor     rax,rax
    inc     rax             ;syscall for write
    mov     rdi,rax         ;stdout also 1
    mov     rsi,msg         ;address of the message
    mov     rdx,msg.len     ;length of the message
    syscall
    mov     rax,60          ;syscall for exit
    xor     rdi,rdi         ;return 0
    syscall