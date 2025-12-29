;name: hello.asm
;
;build: nasm -felf64 hello.asm -o hello.o
;       ld -melf_x86_64 -o hello hello.o
;
;description: writes 'Hello world!" to stdout

[list -]
     %include "unistd.inc"
[list +]

bits 64

section .data

    message:   db "Hello world!",10
    .len:      equ $-message
        
section .text
     global _start
     
_start:
    syscall write,stdout,message,message.len
    syscall exit,0
