;name:         structmsg.asm
;
;build:        nasm "-felf64" structmsg.asm -l structmsg.lst -o structmsg.o
;              ld -s -melf_x86_64 -o structmsg structmsg.o libmodulo97.a
;
;description:  Modulo 97 check on Structured messages
;
;Structured messages are controlled by just using modulo 97.
;Such a message is 12 digits long and the last two are the checkdigits.

%define COMMAND          "structmsg"
%define PURPOSE          "Structured message check in pure NASM <http://www.nasm.us>."
%define APPLICATIONTITLE "Structured message"
%define NUMBERLENGTH     12
%define NUMBERSTRING     "12"

%macro MODULO97CHECK 0
    mov     rdi, rax
    call    modulo97.check
%endm

[list -]
    %include "mod97template.asm"
[list +]
