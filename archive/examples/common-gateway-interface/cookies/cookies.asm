;Name:         cookies.asm
;
;Build:        nasm -felf64 cookies.asm -o cookies.o
;              ld -s -melf_x86_64 -o cookies cookies.o
;
;Description:  set cookies
;              Send cookies to web client demo

bits 64

[list -]
    %include "unistd.inc"
[list +]

section .data

cookies:
    db "Set-Cookie:UserID=XYZ", 10
    db "Set-Cookie:Password=XYZ123", 10
    db "Set-Cookie:Domain=www.agguro.org", 10
    db "Set-Cookie:Path=/", 10
    db "Content-type: text/html", 10, 10
    db "<pre>Check your browser cookies for UserID, Password, Domain and Path cookie</pre>"
cookies.len: equ $-cookies

section .text

global _start  
_start:

    syscall write,stdout,cookies,cookies.len
    syscall exit,0
