; name        : inputdemo.asm
; description : The program asks for some input and writes it to stdout.
; build       : release: nasm -f elf64  -I ../../../includes inputdemo.asm -o inputdemo.o
;                        ld -m elf_x86_64 -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o inputdemo inputdemo.o
;               debug  : nasm -f elf64 -I ../../../includes -g -Fdwarf -o inputdemo.debug.o inputdemo.asm
;                        ld -m elf_x86_64 -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o inputdemo.debug *.o

; Credits     : Thanks to GunnerInc (DreamInCode) for the buffer clearing routine.

bits 64

[list -]
    %include "unistd.inc"
[list +]

; Number of bytes to read into the buffer
%define  BUFFERLENGTH    15

section .bss
    buffer:
    .start:  resb    BUFFERLENGTH
    .dummy:  resb    1            ; help buffer to clear STDIN on buffer overflow
    .length: equ     $ - buffer.start
    
section .rodata
    question:
    .start:  db      "Enter some text, only first 15 characters will be replied: "
    .length: equ     $ - question.start
    
section .text
    global _start
_start:
    ; --- Print the QUESTION ---
    lea     rsi, [rel question.start]
    mov     rdx, question.length
    call    Write

    ; --- Read the answer ---
    lea     rsi, [rel buffer.start]
    mov     rdx, buffer.length
    syscall read, stdin, rsi, rdx
    
    ; RAX contains the number of bytes read
    push    rax                         ; save bytes read
    
    ; --- Check for Buffer Overflow ---
    ; If bytes read < buffer.length, user didn't exceed limit
    cmp     rax, buffer.length
    jl      WriteAnswer                 
    
    ; If bytes read == buffer.length, check if the last byte is a Line Feed (10)
    ; If it isn't, there is still data sitting in the STDIN pipe
    lea     rsi, [rel buffer.start]
    mov     rdx, buffer.length
    cmp     byte [rsi + rdx - 1], 10    
    je      WriteAnswer                 ; Last char was EOL, no need to clear

    ; No EOL found, we must clear the STDIN stream to prevent trailing data
    ; from affecting the next read.
.clearSTDIN:
    lea     rsi, [rel buffer.dummy]
    syscall read, stdin, rsi, 1         ; Read 1 byte into dummy buffer
    cmp     byte [rsi], 10              ; Is it EOL?
    jne     .clearSTDIN                 ; Keep reading until EOL found

WriteAnswer:   
    lea     rsi, [rel buffer.start]
    mov     rdx, buffer.length
    call    Write
    
    syscall exit, 0

; --- Utility Function ---
Write:
    ; RSI : pointer to string
    ; RDX : length
    syscall write, stdout, rsi, rdx
    ret
