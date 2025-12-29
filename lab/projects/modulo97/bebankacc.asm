;name:         bebankacc.asm
;
;build:        nasm "-felf64" bebankacc.asm -l bebankacc.lst -o bebankacc.o
;              ld -s -melf_x86_64 -o bebankacc bebankacc.o libmodulo97.a
;
;description:  Modulo 97 check on Belgian Bankaccount Numbers

%define COMMAND          "bebankacc"
%define PURPOSE          "Belgian bank account number check in pure NASM <http://www.nasm.us>."
%define APPLICATIONTITLE "Belgian bank account number"
%define NUMBERLENGTH     12
%define NUMBERSTRING     "12"

%macro MODULO97CHECK 0
    mov     rdi, rax
    call    modulo97.check
%endm

[list -]
    %include "mod97template.asm"
[list +]
