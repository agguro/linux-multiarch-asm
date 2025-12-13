;name: wordbin2bcd.asm
;
;description:  wordbin2bcd.packed:   Branch free word to packed bcd conversion.
;              wordbin2bcd.unpacked: Word to unpacked bcd conversion.
;
;use:
;packed bcd:   mov      rdi,hexadecimal
;              call     wordbin2bcd.packed
;
;unpacked bcd: mov      rdi,hexadecimal
;              call     wordbin2bcd.unpacked
;
;build: nasm -felf64 wordbin2bcd.asm -o wordbin2bcd.o

bits 64

global wordbin2bcd.packed
global wordbin2bcd.unpacked

section .text
    
wordbin2bcd.unpacked:
    ;unpack the bcd number,the result is returned in rax
    call    wordbin2bcd.packed                  ;convert to packed bcd
    push    rdx                                 ;save used registers
    push    rcx
    mov     rdx,rax                             ;save value in rdx
    shl     rdx,16                              ;start unpacking the digits
    or      rax,rdx
    mov     rcx,0x0000FFFF0000FFFF
    and     rax,rcx
    mov     rdx,rax
    shl     rdx,8
    or      rax,rdx
    mov     rcx,0x000000FF00FF00FF
    and     rax,rcx
    mov     rdx,rax
    shl     rdx,4
    or      rax,rdx
    mov     rcx,0x00000F0F0F0F0F0F
    and     rax,rcx
    pop     rcx                                 ;save used registers
    pop     rdx
    ret

wordbin2bcd.packed:
    ;convert value in rdi to unpacked bcd, result is returned in rax
    push    rdx                                 ;save uesed registers
    push    rcx
    mov     rax,rdi                             ;value in rax
    and     rax,0xFFFF                          ;only least significant word counts
    mov     cl,13                               ;bits to shift in = 16 - 3
    ror     rax,cl                              ;put 3 most significant bits in al
.repeat:    
    push    rcx                                 ;save bit counter
    ;branch free conversion of word to bcd
    mov     rdx,rax                             ;value in rdx
    mov     rcx,0x0000000003333333              ;add 3 to each digit
    add     rdx,rcx
    mov     rcx,0x0000000008888888              ;keep fourth bit of result
    and     rdx,rcx
    shr     rdx,3                               ;put in it bit position 0
    add     rax,rdx                             ;add 1 to rax if rdx = 1
    shl     rdx,1
    add     rax,rdx                             ;add 2 to rax if rdx = 1
    rol     rax,1                               ;shift in next bit left of rax 
    pop     rcx                                 ;restore loop counter
    loop    .repeat                             ;decrement bit counter and repeat if still not zero
    pop     rcx                                 ;restore used registers
    pop     rdx
    ret
