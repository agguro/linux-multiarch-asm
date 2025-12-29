;name:         besiscard.asm
;
;build:        nasm "-felf64" besiscard.asm -l besiscard.lst -o besiscard.o
;              ld -s -melf_x86_64 -o besiscard besiscard.o libmodulo97.a
;
;description:  Modulo 97 check on Belgian SIS card Numbers

%define COMMAND          "besiscard"
%define PURPOSE          "Belgian SIS card Number check in pure NASM <http://www.nasm.us>."
%define APPLICATIONTITLE "Belgian SIS card Number"
%define NUMBERLENGTH     10
%define NUMBERSTRING     "10"

%macro MODULO97CHECK 0
    mov     rdi, rax
    call    modulo97.check
%endm

[list -]
    %include "mod97template.asm"
[list +]
