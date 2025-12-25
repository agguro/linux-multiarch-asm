;name: wordbcd2ascii.asm
;
;description: convert 16 bit packed bcd in rdi to ascii in eax.
;
;build: nasm -felf64 wordbcd2ascii.asm -o wordbcd2ascii.o

bits 64

global wordbcd2ascii

section .text

wordbcd2ascii:
    mov     rax,rdi
    and     rax,0xFFFF    
    or      eax,0x33330000
    rol     eax,4
    ror     ax,4
    rol     eax,8
    ror     ax,4
    ror     al,4
    ret
