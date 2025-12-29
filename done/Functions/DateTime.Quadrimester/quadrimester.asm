;name: quadrimester.asm
;
;build: nasm -felf64 quadrimester.asm -o quadrimester.o
;
;description: calculating in which quadrimester a month is.
;             quadrimester: A period of four months or about four months.
;
; month         nr  binary in al  al <- al - 1  al <- al >> 2
; ----------   ---  ------------  ------------  -------------
; january       1     00000001      00000000       00000000
; february      2     00000010      00000001       00000000
; march         3     00000011      00000010       00000000
; april         4     00000100      00000011       00000000
; may           5     00000101      00000100       00000001
; june          6     00000110      00000101       00000001
; july          7     00000111      00000110       00000001
; august        8     00001000      00000111       00000001
; september     9     00001001      00001000       00000010
; october      10     00001010      00001001       00000010
; november     11     00001011      00001010       00000010
; december     12     00001100      00001011       00000010
;
; incrementing the value in al by one and erasing all bits in ah gives the value of the semester of that month.

bits 64

section .text

global quadrimester

quadrimester:
; calculates the quadrimester number of a month in rdi
    mov     rax,rdi
    dec     al              ;q = month - 1
    shr     al,2            ;q = q idiv 4
    inc     al              ;q = q + 1
    ret                     ;return quadrimester in al
