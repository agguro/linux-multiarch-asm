;name: wordbin2hexascii.asm
;
;description: branch free conversion of a word in di to ascii in eax.
;
;build: nasm -felf64 wordbin2hexascii.asm -o wordbin2hexascii.o

bits 64

global wordbin2hexascii
       
section .text
   
wordbin2hexascii:
    push    rbx
    push    rcx
    mov	    ax,di                   ;value in ax
    ;make group of nibble separated by a zero
    ror	    rax,8
    rol	    ax,4
    shr	    al,4
    rol	    rax,16
    shr	    ax,4
    shr	    al,4
    mov	    ebx,0x06060606
    mov	    ecx,0xF0F0F0F0
    add	    eax,ebx                 ;add 0x06 to each nibble
    and	    ecx,eax                 ;keep overflow of previous result
    sub	    eax,ebx                 ;subtract 0x06 from each nibble
    shr	    ecx,1
    sub	    eax,ecx                 ;subtract from each nibble
    shr	    ecx,3
    sub	    eax,ecx
    shr	    ebx,1
    add	    ebx,ecx
    shl	    ebx,4
    or	    eax,ebx
    pop     rcx
    pop     rbx
    ret
