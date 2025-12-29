;name:         bevatnr.asm
;
;build:        nasm "-felf64" bevatnr.asm -l bevatnr.lst -o bevatnr.o
;              ld -s -melf_x86_64 -o bevatnr bevatnr.o libmodulo97.a
;
;description:  Modulo 97 check on Belgian VAT Numbers
;
;Belgian VAT numbers are checked against 97-mod97 of the VAT number

%define COMMAND          "bevatnr"
%define PURPOSE          "Belgian VAT Number check in pure NASM <http://www.nasm.us>."
%define APPLICATIONTITLE "Belgian VAT Number"
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
