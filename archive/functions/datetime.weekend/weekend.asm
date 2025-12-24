;name: weekend.asm
;
;build: nasm -felf64 weekend.asm -o weekend.o
;
;description: determine whether a day is a weekend day or not. 
;
;
; day         nr   binary in al  al <- al + 2  al <- al >> 4
; ----------  ---  ------------  ------------  -------------
; Monday       1     00000001      00000011     00000000
; Tuesday      2     00000010      00000100     00000000
; Wednesday    3     00000011      00000101     00000000
; Thursday     4     00000100      00000110     00000000
; Friday       5     00000101      00000111     00000000
; Saturday     6     00000110      00001000     00000001
; Sundag       7     00000111      00001001     00000001
;
; incrementing the value in al by one and erasing all bits in ah gives the value of the semester of that month.

bits 64

section .text

global weekend

weekend:
; determine whether a day is a weekend day or not.
    mov     rax,rdi
    inc     al          ;day = day + 1
    inc     al          
    shr     al,3        ;get only bit 3
    ret                 ;return weekend in al.
