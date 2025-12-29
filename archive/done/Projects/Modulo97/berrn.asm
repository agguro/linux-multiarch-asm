;name:         berrn.asm
;
;build:        nasm "-felf64" berrn.asm -l berrn.lst -o berrn.o
;              ld -s -melf_x86_64 -o berrn berrn.o libmodulo97.a
;
;description:  Modulo 97 check on Belgian Rijksregister Numbers
;
;remark:
;Checking the Belgian Rijksregister Number is a bit more tricky. We have to deal with birthdays before the year 2000 and
;after or in the year 2000. The algorithm is as follows.
;
;   checkdigits = 97 - (n mod 97)            for years before 2000
;
;when this gives a wrong mod97 check we could have to deal with birth years after 1999.
;in this case we have to re-test with 
;   checkdigits = 97 - ((n + 20000000000) mod 97)
;
;when we extract the checkdigits from the number first, we can add 200000000 to RAX instead of 20000000000. The assembler will not comply
;with a warning: signed dword immediate exceeds bounds

%define COMMAND          "berrn"
%define PURPOSE          "Belgian Rijksregister number check in pure NASM <http://www.nasm.us>."
%define APPLICATIONTITLE "Belgian Rijksregister Number"
%define NUMBERLENGTH     11
%define NUMBERSTRING     "11"

%macro MODULO97CHECK 0
    xor     r9, r9
    ; RAX has the converted number, we need to extract the last two decimal digits
    mov     r8, rax
.retest:     
    xor     rdx, rdx
    mov     rbx, 100
    div     rbx                      ; RDX = checkdigits, RAX = number
    and     r9, r9
    jz      .before2000
    add     rax, 2000000000
.before2000:     
    mov     rcx, 97
    sub     rcx, rdx                 ; RCX = 97 - modulo97(number)
    xor     rdx, rdx
    mul     rbx                      ; RAX = number * 100
    add     rax, rcx                 ; new number to check
    mov     rdi, rax
    call    modulo97.check
    jnc     .legaldone
    and     r9, r9
    jnz     .illegaldone
    mov     rax, r8
    inc     r9
    jmp     .retest
.illegaldone:
    stc
.legaldone:    
%endm

[list -]
    %include "mod97template.asm"
[list +]
