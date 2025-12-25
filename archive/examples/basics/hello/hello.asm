; name        : hello.asm
; description : writes 'Hello world!" to stdout
; build       : release: nasm -f elf64 -I ../../../includes -o hello.o hello.asm
;                        ld -m elf_x86_64 -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o hello *.o
;               debug  : nasm -f elf64 -I ../../../includes -g -Fdwarf -o hello.debug.o hello.asm
;                        ld -m elf_x86_64 -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o hello.debug *.o

bits 64

[list -]
     %include "unistd.inc"
[list +]

section .rodata
    message:    db "Hello world!", 10
    .len:       equ $ - message
        
section .text
     global _start
_start:
    ; PIC: Use lea with RIP-relative addressing
    lea     rsi, [rel message]
    syscall write, stdout, rsi, message.len
    
    syscall exit, 0
