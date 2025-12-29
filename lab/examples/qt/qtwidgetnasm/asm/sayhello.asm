;name: sayhello.asm
;
;description: returns the address of the unicode string 'Hello from Nasm' to the
;             calling program.  The caller can display the text in whatever Widget
;             possible.

bits 64

%include "../inc/sayhello.inc"

global sayhello

section .rodata
    ;for QStrings we must use unicode
    ;use four trailing zeros or you will see chinese characters
    hello:  db  "H",0,"e",0,"l",0,"l",0,"o",0," ",0,"f",0,"r",0,"o",0,"m",0," ",0,"N",0,"a",0,"s",0,"m",0,".",0,0,0,0

section .text

sayhello:
    ;return pointer to caller
    mov rax, hello
    ret
