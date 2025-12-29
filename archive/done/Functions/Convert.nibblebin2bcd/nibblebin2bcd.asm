;name: nibblebin2bcd.asm
;
;description:  nibblebin2bcd.packed:   Branch free nibble to packed bcd conversion.
;              nibblebin2bcd.unpacked: Nibble to unpacked bcd conversion.
;
;use:
;packed bcd:   mov      rdi,hexadecimal
;              call     nibblebin2bcd.packed
;
;unpacked bcd: mov      rdi,hexadecimal
;              call     nibblebin2bcd.unpacked
;
;algorithm:
;with compare:      cmp al,5
;                   jb  .skip           ;use jb (unsigned), not jl (signed)
;                   add al,3
;            .skip:
;                   .....
;The algorithm is ok for nibbles and bytes.  When dealing with bigger registers (16,32,64)
;we have to shift and compare a lot.
;consider the loops we have to made for each bit....(I didn't calculate this)
;
;datatype:      digits  values
;nibble           2     [0..15]
;byte             3     [0..255]
;word             5     [0..65535]
;dword           10     [0..4294967295]
;qword           20     [0..18446744073709551615]
;
;I found an algorithm:
;reminder: only 3 bits ahave to be taken in account.
;nibble  add 3?   +3    >>3    nibble + value * 3
;------  ------  ----  -----  --------------------
; 0000      no   0011   0000         0000
; 0001      no   0100   0000         0001
; 0010      no   0101   0000         0010
; 0011      no   0110   0000         0011
; 0100      no   0111   0000         0100
; 0101     yes   1000   0001         1000
; 0110     yes   1001   0001         1001
; 0111     yes   1010   0001         1010
;
;build: nasm -felf64 nibblebin2bcd.asm -o nibblebin2bcd.o

bits 64

global nibblebin2bcd.packed
global bibblebin2bcd.unpacked

section .text

nibblebin2bcd.unpacked:
    ;convert nibble in rdi to bcd in rax
    call    nibblebin2bcd.packed
    shl     ax,4                        ;unpack digits
    shr     al,4
    ret
    
nibblebin2bcd.packed:
    ;convert nibble to bcd branch free.  It's a longer algorithm but
    ;more usefull when dealing with larger numbers.  I've used bit 63
    ;to keep bit 0 of rdi, this can also be done with the use eax as lang
    ;as you leave place for the bcd digits. (which is no problem here)
    mov     rax,rdi                     ;value in rax
    ror     rax,1                       ;bits 2,1 and 0 in AL
    push    rdx                         ;save used register
    mov     dl,al                       ;digit in dl
    add     dl,3                        ;add 3 anyway
    and     dl,8                        ;keep fourth bit of previous result
    shr     dl,3                        ;shift to bit 0 position, we have either 0 or 1
    add     al,dl                       ;add 0 or 1 to digit
    shl     dl,1                        ;make 0 or 2
    add     al,dl                       ;add 0 or 2 to digit
    rol     rax,1                       ;shift in next bit
    pop     rdx                         ;save used register
    ret
