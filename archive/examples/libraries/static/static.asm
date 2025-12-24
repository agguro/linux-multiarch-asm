;name: staticlib.asm
;
;build: - release version:
;         nasm -f elf64 staticlib.asm -o staticlib.o
;         ar rcs staticlib.a staticlib.o
;       - debug /development version:
;         nasm -felf64 -Fdwarf staticlib.asm -o staticlib-dev.o
;         ar rcs staticlib-dev.a staticlib-dev.o
;
;description: static library (archivefile) demo

[list -]
    %include "unistd.inc"
[list +]     

bits 64

global writestring

section .rodata

    message:    db  "hello, you are in the static library",10
    .len:       equ $-message
    
section .text

writestring:

    syscall write, stdout, message, message.len
    ret
