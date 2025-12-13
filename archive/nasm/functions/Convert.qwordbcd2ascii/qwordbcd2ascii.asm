;name: qwordbcd2ascii.asm
;
;description: convert 64 bit bcd in rdi to ascii in rdx:rax
;build: nasm -felf64 qwordbcd2ascii.asm -o qwordbcd2ascii.o
;

bits 64

global qwordbcd2ascii

section .text

qwordbcd2ascii:
    push    rcx
    push    r8
    push    r9
    mov	    rdx,rdi
    ;split dwords
    mov	    eax,edx
    shr	    rdx,32
    ;split words
    mov	    r8,rax
    mov	    r9,rdx
    shl	    r8,16
    shl	    r9,16
    or	    rax,r8
    or	    rdx,r9
    mov	    rcx,0x0000FFFF0000FFFF
    and	    rax,rcx
    and	    rdx,rcx
    ;split bytes
    mov	    r8,rax
    mov	    r9,rdx
    shl	    r8,8
    shl	    r9,8
    or	    rax,r8
    or	    rdx,r9
    mov	    rcx,0x00FF00FF00FF00FF
    and	    rax,rcx
    and	    rdx,rcx
    ;split nibbles
    mov	    r8,rax
    mov	    r9,rdx
    shl	    r8,4
    shl	    r9,4
    or	    rax,r8
    or	    rdx,r9
    mov	    rcx,0x0F0F0F0F0F0F0F0F
    and	    rax,rcx
    and	    rdx,rcx
    ;rdx:rax contains now the split nibbles of rdi 
    mov     rcx,0x3030303030303030
    add     rdx,rcx
    add     rax,rcx
    pop     r9
    pop     r8
    pop     rcx
    ret
