;Project:      helloworld
;Name:         main.asm
;Build:        ./make.sh
;Run:          ./hello
;Description:  Writes 'Hello world!" to STDOUT

[list -]
     %include "unistd.inc"
[list +]

bits 64

extern print

section .data

    message:db "Hello world!",10
     .len:	equ $-message
        
section .text
     global _start
     
_start:
     mov  rdi,message
     mov   rsi,message.len
     call print
     syscall exit