;name: trimester.asm
;
;build: nasm -felf64 trimester.asm -o trimester.o
;
;description: calculating in which trimester a month is.
;             trimester: A period of three months or about three months
;
; month         nr  binary in al  ah = ah <- al  ah <- ah + 1  ah <- ah >> 3  ah <- ah << 1   al <- al + ah   al = al >> 2
; ----------   ---  ------------  -------------  ------------  -------------  --------------  -------------   ------------
; january       1     00000001      00000001       00000010       00000000       00000000        00000001       00000000
; february      2     00000010      00000010       00000011       00000000       00000000        00000001       00000000
; march         3     00000011      00000011       00000100       00000000       00000000        00000011       00000000
; april         4     00000100      00000100       00000101       00000000       00000000        00000100       00000001
; may           5     00000101      00000101       00000110       00000000       00000000        00000101       00000001
; june          6     00000110      00000110       00000111       00000000       00000000        00000110       00000001
; july          7     00000111      00000111       00001000       00000001       00000010        00001001       00000010
; august        8     00001000      00001000       00001001       00000001       00000010        00001010       00000010
; september     9     00001001      00001001       00001010       00000001       00000010        00001011       00000010
; october      10     00001010      00001010       00001011       00000001       00000010        00001100       00000011
; november     11     00001011      00001011       00001100       00000001       00000010        00001101       00000011
; december     12     00001100      00001100       00001101       00000001       00000010        00001110       00000011
;
; incrementing the value in al by one and erasing all bits in ah gives us the value of the trimester of that month.

bits 64
                
section .text

global trimester

trimester:

    mov     rax,rdi
    mov     ah, al          ;month in ah
    inc     ah              ;q = month + 1
    shr     ah,3            ;s = left most bit of q, other bits are destroyed
    shl     ah,1            ;s = s * 2
    add     al,ah           ;q = q + s
    shr     al,2            ;q = q div 4
    inc     al              ;q = q + 1
    xor     ah,ah           ;clear ah
    ret                     ;return trimester in rax
