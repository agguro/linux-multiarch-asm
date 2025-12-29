;name:         bedrvrlic.asm
;
;build:        nasm "-felf64" bedrvrlic.asm -l bedrvrlic.lst -o bedrvrlic.o
;              ld -s -melf_x86_64 -o bedrvrlic bedrvrlic.o libmodulo97.a
;
;description:  Modulo 97 check on Belgian Drivers Licenses
;
;Belgian drivers license numbers are checked against 97-mod97 of the number

%define COMMAND          "bedrvrlic"
%define PURPOSE          "Belgian drivers license number check in pure NASM <http://www.nasm.us>."
%define APPLICATIONTITLE "Belgian drivers license"
%define NUMBERLENGTH     10
%define NUMBERSTRING     "10"

%macro MODULO97CHECK 0
    ; RAX has the converted number, we need to extract the last two decimal digits
    xor     rdx, rdx
    mov     rbx, 100
    div     rbx                      ; RDX = checkdigits, RAX = number
    mov     rcx, 97
    sub     rcx, rdx                 ; RCX = 97 - modulo97(number)
    xor     rdx, rdx
    mul     rbx                      ; RAX = number * 100
    add     rax, rcx                 ; new number to check
    mov     rdi, rax
    call    modulo97.check
%endm

[list -]
    %include "mod97template.asm"
[list +]
