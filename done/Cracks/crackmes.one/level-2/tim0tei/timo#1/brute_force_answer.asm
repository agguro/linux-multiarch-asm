; brute_force_answer.asm
; This is a quick and dirty program to bruto force the answer of the ./timo#1 question.
; This program checks for any value in r15 from 0x01010101 to 0xFFFFFFFF when the condition
; eax == 0x6fcd79a2 is true, r15 has a valid combination in reversed byte order.

%include "unistd.inc"

bits 64

section .text
global _start

_start:

    ;bytes cannot be zero because input is 4 bytes long
    mov     r15, 0x01010101
.loop2:
    ;initialize start values (original program)    
    mov     eax, 0x811c9dc5
    mov     edi, 0x1000193
    mov     rcx,4                       ;bytes to deal with, from input
    xor     ebx,ebx                     ;ebx = 0
.loop1:    
    mul     edi                         ;eax = eax * edi
    mov     bl,r15b                     ;move byte in bl
    xor     eax,ebx                     ;
    ror     r15d,8                      ;next byte in place
    dec     ecx                         ;byte count - 1
    jne     .loop1                      ;if byte count not zero repeat loop
    cmp     eax,0x86cfdcf8              ;else if result = 0x86cfdcf8 then we can stop
    je      .got_one                    ;stop at first right combination
.nextattempt:    
    inc     r15d                        ;next attempt
    test    r15d,r15d                   ;if r15d was 0xFFFFFFFF then it is zero now
    jne     .loop2                      ;repeat for next attempt
    jmp     .exit                       
.got_one:
    int     3                           ;break program to be able to read r15
    ;the 4 bytes in r15d are in reversed order
    jmp     .nextattempt                ;try to find more passwords
.exit:
    syscall exit,0

; result:
; r15          reversed     ASCII
;4c29074f      4f07294c     O.)L
;5543482b      2b484355     +HCU        <-- most human friendly and answer to question (internet)
;6194bf99      99bf9461     ...a
