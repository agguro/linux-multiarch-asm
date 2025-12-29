; brute_force_pincode.asm
; This is a quick and dirty program to bruto force the pincode of the ./timo#1 question.
; Reading the reversed source code of timo#1 we are looking for a 3 byte combination
; which satisfy the following equation.
; Given the input with a trailing 0x0A (the input is always terminated with 0x0A):
; b0,b1,b2,0xA (the comma is for readability only and doesn't make part of the input bytes)
; then the next equation must be solved:
;
; ((0x539 + b1 + b2 + 0xA) * 2 ) / 0x11 + 0x30 = b0
; the quotient of the division is omited, only the remainder is necessary, which means that
; in fact we're using modulo 17.  

%include "unistd.inc"

bits 64

section .text
global _start

_start:

    ;bytes cannot be zero because input is 4 bytes long
    xor     r15,r15                     ;we start with 0 for all input bytes
    mov     r15,0x303030                ;start with digits (pincode)
.loop:
    mov     rax,0x539
    add     rax,0x0A                    ;add 0xA
    xor     rdx,rdx
    mov     dl,r15b                     ;b2 in dl
    ror     r15,8                       ;b1 in r15b 
    add     rax,rdx                     ;add b2
    mov     dl,r15b                     ;b1 in dl
    ror     r15,8                       ;b0 in r15b to compare with
    add     rax,rdx                     ;add b1
    add     rax,rax                     ;* 2 as in original source, shl is faster
    xor     rdx,rdx                     ;register for remainder zero
    mov     rbx,0x11
    div     ebx                         ;edx:eax = eax / ebx, edx has remainder
    add     dl,0x30                     ;add 0x30
    mov     al,r15b                     ;b0 in al
    rol     r15,16                      ;all bytes back in place
    xor     dl,al                       ;xor dl and b0
    jz      .got_one
.next_attempt:    
    inc     r15                         ;next combination
    cmp     r15,0x1000000               ;end of all combinations reached?
    jne     .loop                       ;next attempt
    syscall exit,0
.got_one:
    int     3                           ;break to watch r15
    jmp     .next_attempt

;human readable solutions:
;        because add is commutative (a+b = b+a)
;"0  "   "0  "
;"0 1"   "01 "
;"0 B"   "0B "
;"0 S"   "0S "
;"0!0"   "0!0"
;...
;"002"   "020"
;...
;"011"   "011"
;"978"   "987"
;
; To make a good brute force program we must deal with symmetries, which, my opinion, halves
; the necessary loop.  Anyway the first solution don't take too long.
; The line mov r15,0x303030 is added after a first observation of the results in a debugger, this gives us:
; 002 011 020 ....
; If we only calculate b0 for b1 and b2 = 0...9 then we have less than 100 solutions, ruling out the non-decimals
; gives us a lot of pincodes that can be used.
; the pseudocode:
; for b1 = 0x30 to 0x39
;    for b2 = 0x30 to 0x39
;        b0 = ((0x539 + b1 + b2 + 0xA) * 2 ) / 0x11 + 0x30
;        if (b0 > 0x2F && b0 < 0x3A)
;           print b0
;    next b2
; next b1