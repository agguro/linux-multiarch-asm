;name: inputdemo.asm
;
;description: The program asks for some input and writes it to stdout.
;
;build: nasm -felf64 -Fdwarf -g -l inputdemo.lst inputdemo.asm -o inputdemo.o
;       ld -g -melf_x86_64 inputdemo.o -o inputdemo 
;
;Thanks to GunnerInc (DreamInCode) for the routine to clear the buffer.

bits 64

[list -]
    %include "unistd.inc"
[list +]

;number of bytes to read into the buffer
%define  BUFFERLENGTH    15

global _start

section .bss
    buffer:
    .start: resb    BUFFERLENGTH
    .dummy: resb    1		    ; help buffer to clear STDIN on buffer overflow
    .length equ     $-buffer.start
    
section .rodata
    question:
    .start:   db      "Enter some text, only first 15 characters will be replied: "
    .length   equ     $-question.start
    
section .text

_start:
    ;print the QUESTION
    mov     rsi,question			;start of message
    mov     rdx,question.length                 ;the length of the message to display
    call    Write
    ;read the answer
    syscall read,stdin, buffer, buffer.length
    push    rax                                 ;save bytes read
    ;check if more characters are given than the length of the buffer
    cmp     rax,buffer.length                   ;are there more characters than allowed?
    jl      WriteAnswer                         ;no, so write buffercontent to STDOUT
    cmp     byte[rsi+rdx-1],10                  ;last character is EOL?
    je      WriteAnswer                         ;yes, also write the buffercontent to STDOUT
    mov     byte[rsi+rdx-1],13                  ;no, put carriage-return in place
clearSTDIN:                                     ;Check for extra characters in the buffer
    syscall read,stdin,buffer.dummy,1           ;read next byte from buffer
    cmp     byte[rsi],10                        ;is it EOL?
    jne     clearSTDIN                          ;no continue with the next
    ;at this point we've read all the remaining bytes
WriteAnswer:   
    mov     rsi,buffer
    mov     rdx,buffer.length
    call    Write
    syscall exit,0
Write:
    ;rsi and rdx contains the pointer to the string and his length respectively
    syscall write,stdout
    ret
