;name: leapyear.asm
;
;Build: nasm "-felf64" leapyear.asm -l leapyear.lst -o leapyear.o
;
;description: the function calculates if a year in rdi (hexadecimal) is leap or not.
;             rax returns 0 if not leap otherwise 1

bits 64

global leapyear

section .text

leapyear:
    push	rbx               ;save used registers
    push	rcx
    push	rdx
    mov		rax,rdi
    xor		rcx,rcx           ;assume not leap, rcx = 0
    test	rax,3             ;last two bits 0?
    jnz		.@1               ;if not year is not disible by 4 -> no leapyear
    inc		rcx               ;assume year is a leapyear, rcx = 1
    xor		rdx,rdx           ;prepare rdx for division
    mov		rbx,100           ;year / 100
    div		rbx
    and		rdx,rdx           ;remainder = 0?
    jnz		.@1               ;no, no leapyear
    ; multiples of 100 aren't leap years except if last two bits
    ; are zero 0 (divisible by 4) then also divisible by 400
    test	rax,3
    jz		.@1               ;yes, leap year
    dec		rcx               ;no, not leap year, rcx = 0
.@1:
    mov		rax, rcx          ;mov result in RAX
    pop		rdx
    pop		rcx
    pop		rbx
    ret
