;name: qchar.asm
;
;description:
;

bits 64

global getunicode
global setunicode

section .text

getunicode:

    xor     rax,rax             ; rax = 0
    mov     ax,word[rdi]        ; get unicode in ax
    ret

setunicode:
    mov     ax,0x0047
    ret
