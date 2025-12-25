;name: semester.asm
;
;build: nasm -felf64 semester.asm -o semester.o
;
;description: calculating in which semester a month is.
;             semester: A period or term of six months
;
; month         nr  binary in AL  AL <- AL + 1  AL <- AL >> 3
; ----------   ---  ------------  ------------  -------------
; january       1     00000001      00000010       00000000
; february      2     00000010      00000011       00000000
; march         3     00000011      00000100       00000000
; april         4     00000100      00000101       00000000
; may           5     00000101      00000110       00000000
; june          6     00000110      00000111       00000000
; july          7     00000111      00001000       00000001
; august        8     00001000      00001001       00000001
; september     9     00001001      00001010       00000001
; october      10     00001010      00001011       00000001
; november     11     00001011      00001100       00000001
; december     12     00001100      00001101       00000001
;
; incrementing the value in al gives us the value of the semester of that month.

bits 64

section .text

global semester

semester:
    mov     rax,rdi
    inc     al              ;s = month + 1
    shr     al,3            ;s = s div 8
    inc     al              ;s = s + 1
    ret                     ;return semester in rax
