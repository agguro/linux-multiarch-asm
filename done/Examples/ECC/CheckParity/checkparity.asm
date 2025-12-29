;name: checkparity.asm
;
;description: check the parity bit against a databit string with the parity variant
;             taken into account.  There is a difference in the parity flag (PF) of
;             a CPU (x86 in this case) and the parity bit of a databit string.
;
;             !!! This routine can only be used to check if a bitstring is wrong.
;             You cannot use this routine to check if a databit string is correct
;
;             because of the nature of the algorithm for calculating parity bits.
;             (when two bits changes of value for example)
;example: data send is: 0110111 -> parity bit = 1 for variant EVEN -> 01101111
;                                               0 for variant ODD ->  01101110
;         but when the data received is 00111111 then parity bit for 0011111 is 1 for variant EVEN
;                                                                           and 0 for variant ODD
;         the bitstrings 01101111 and 00111111 are legal ones taken the parity bit into account but
;                                              only the first one is the correct one.
;         same goes up for variant parity ODD
;update: 17/04/2021

bits 64

%include "unistd.inc"
%include "sys/termios.inc"

%define VARIANT_EVEN    0
%define VARIANT_ODD     1

global _start

section .bss
;uninitialized read-write data 

section .data
;initialized read-write data

section .rodata
;read-only data
    ;bit 0 is parity bit
    databits1:   dq  01101110b
    databits2:   dq  01101111b
;some messages to have some interaction...
    bitstring1: db  "checking 01101110...",10
    .len:       equ $-bitstring1
    bitstring2: db  "checking 01101111...",10
    .len:       equ $-bitstring2
    variant1:   db  "for parity variant EVEN: result: "
    .len:       equ $-variant1
    variant2:   db  "for parity variant ODD: result: "
    .len:       equ $-variant2
    right:      db  "data seems ok.", 10
    .len:       equ $-right
    wrong:      db  "data is definitely wrong.", 10
    .len:       equ $-wrong

section .text

_start:

;we cannot check the parity of the entire 64 bit word on a Intel x86
;therefor this routine
    syscall write,stdout,bitstring1,bitstring1.len
    syscall write,stdout,variant1,variant1.len
    mov     rdi,qword[databits1]
    mov     rsi,VARIANT_EVEN
    call    checkparity
    call    decision

    syscall write,stdout,variant2,variant2.len
    mov     rdi,qword[databits1]
    mov     rsi,VARIANT_ODD
    call    checkparity
    call    decision

    syscall write,stdout,bitstring2,bitstring2.len
    syscall write,stdout,variant1,variant1.len
    mov     rdi,qword[databits2]
    mov     rsi,VARIANT_EVEN
    call    checkparity
    call    decision

    syscall write,stdout,variant2,variant2.len
    mov     rdi,qword[databits2]
    mov     rsi,VARIANT_ODD
    call    checkparity
    call    decision

    syscall exit,0

decision:
    test    rax,rax
    jz      .wrong
    syscall write,stdout,right,right.len
    ret
.wrong:
    syscall write,stdout,wrong,wrong.len
    ret

checkparity:
    push    rdx
    mov     rax,rdi
    shr     rax,1               ;rule out all but the parity-bit
    add     rax,0               ;check parity of databits with p-flag
                                ;0 when odd, 1 when even
    pushf                       ;push flags on stack
    pop     rdx                 ;get flags from stack
    and     rdx,100b            ;mask all but p-flag
    shr     rdx,2               ;p-flag in lower bit of rdx
    xor     rdx,1               ;invert result, p-flag = not(p-bit) however
    xor     rdx,rsi             ;take variant into account
    shl     rax,1               ;make place for parity bit
    add     rdx,rax             ;put p-flag in place and in rdx
    xor     rax,rax             ;assume data is wrong
    cmp     rdx,rdi             ;test calculated data against given databits
    jne     .done               ;data is wrong
    inc     rax                 ;data seems ok
.done:
    pop     rdx
    ret
