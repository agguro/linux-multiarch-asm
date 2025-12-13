;name: dwordbcd2ascii.asm
;
;description: convert 32 bit bcd in rdi to ascii in rax
;
;build: nasm -felf64 dwordbcd2ascii.asm -o dwordbcd2ascii.o

bits 64

global dwordbcd2ascii

section .text

dwordbcd2ascii:
    push    rcx
    push    rdx
    mov	    eax,edi
    mov	    edx,eax
    ;split words
    shl	    rdx,16
    or	    rax,rdx
    mov	    rcx,0x0000FFFF0000FFFF
    and	    rax,rcx
    ;split bytes
    mov	    rdx,rax
    shl	    rdx,8
    or	    rax,rdx
    mov	    rcx,0x00FF00FF00FF00FF
    and	    rax,rcx
    ;split nibbles
    mov	    rdx,rax
    shl	    rdx,4
    or	    rax,rdx
    mov	    rcx,0x0F0F0F0F0F0F0F0F
    and	    rax,rcx
    ;make ascii
    mov     rcx,0x3030303030303030
    add     rax,rcx
    pop     rdx
    pop     rcx
    ret
