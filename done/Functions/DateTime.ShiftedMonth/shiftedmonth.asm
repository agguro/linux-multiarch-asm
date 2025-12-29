;name: shiftedmonth.asm
;
;build: nasm -felf64 shiftedmonth.asm -o shiftedmonth.o
;
;description: Calculates the shifted month from a given month in rdi, which can be used to calculate
;             Easter sundays (and most probably more than only Easter sundays).
;             The routine doesn't check for legal month numbers, it takes out the lower four bits to calculate
;             with.
;             Returns shifted month number in rax if rdi is a montnumber otherwise rubish.
;
;  ax <- month number      ax = ax - 3       ax and 111 0100 0000 1111           not al           and al,ah               inc al
;                                                                                                                  = shifted month number
; -------------------  -------------------  ---------------------------  -------------------  -------------------  ----------------------
; 0000 0000 0000 0001  1111 1111 1111 1110     1111 0100 0000 1110       0000 1011 0000 1110  0000 1011 0000 1010   0000 1011 0000 1011
; 0000 0000 0000 0010  1111 1111 1111 1111     1111 0100 0000 1111       0000 1011 0000 1111  0000 1011 0000 1011   0000 1011 0000 1100
; 0000 0000 0000 0011  0000 0000 0000 0000     0000 0000 0000 0000       1111 1111 0000 0000  1111 1111 0000 0000   1111 1111 0000 0001
; 0000 0000 0000 0100  0000 0000 0000 0001     0000 0000 0000 0001       1111 1111 0000 0001  1111 1111 0000 0001   1111 1111 0000 0010
; 0000 0000 0000 0101  0000 0000 0000 0010     0000 0000 0000 0010       1111 1111 0000 0010  1111 1111 0000 0010   1111 1111 0000 0011
; 0000 0000 0000 0110  0000 0000 0000 0011     0000 0000 0000 0011       1111 1111 0000 0011  1111 1111 0000 0011   1111 1111 0000 0100
; 0000 0000 0000 0111  0000 0000 0000 0100     0000 0000 0000 0100       1111 1111 0000 0100  1111 1111 0000 0100   1111 1111 0000 0101
; 0000 0000 0000 1000  0000 0000 0000 0101     0000 0000 0000 0101       1111 1111 0000 0101  1111 1111 0000 0101   1111 1111 0000 0110
; 0000 0000 0000 1001  0000 0000 0000 0110     0000 0000 0000 0110       1111 1111 0000 0110  1111 1111 0000 0110   1111 1111 0000 0111
; 0000 0000 0000 1010  0000 0000 0000 0111     0000 0000 0000 0111       1111 1111 0000 0111  1111 1111 0000 0111   1111 1111 0000 1000
; 0000 0000 0000 1011  0000 0000 0000 1000     0000 0000 0000 1000       1111 1111 0000 1000  1111 1111 0000 1000   1111 1111 0000 1001
; 0000 0000 0000 1100  0000 0000 0000 1001     0000 0000 0000 1001       1111 1111 0000 1001  1111 1111 0000 1001   1111 1111 0000 1010
;
; Looking at the values in al, we notice the shifted mont number. Clearing the other meaningless bits gives this number in rax.

bits 64

section .text

global shiftedmonth

shiftedmonth:
    mov     rax,rdi
    and     rax,1111b              ;take only lower 4 bits in concern
    dec     ax                     ;minus 3
    dec     ax
    dec     ax
    and     ax,1111010000001111b
    not     ah
    and     al,ah
    inc     al
    and     ax,1111b               ;only lower 4 bits are relevant for the result
    ret
