;name:         beidcard.asm
;
;build:        nasm "-felf64" beidcard.asm -l beidcard.lst -o beidcard.o
;              ld -s -melf_x86_64 -o beidcard beidcard.o libmodulo97.a
;
;description:  Modulo 97 check on Belgian ID card Numbers

%define COMMAND          "beid"
%define PURPOSE          "Belgian ID card number check in pure NASM <http://www.nasm.us>."
%define APPLICATIONTITLE "Belgian ID card"
%define NUMBERLENGTH     12
%define NUMBERSTRING     "12"

%macro MODULO97CHECK 0
    mov     rdi, rax
    call    modulo97.check
%endm

[list -]
    %include "mod97template.asm"
[list +]
