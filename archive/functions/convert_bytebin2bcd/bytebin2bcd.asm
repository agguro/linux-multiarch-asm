;name: bytebin2bcd.asm
;
;description:  bytebin2bcd.packed:   Branch free byte to packed bcd conversion.
;              bytebin2bcd.unpacked: Byte to unpacked bcd conversion.
;
;use:
;packed bcd:   mov      rdi,hexadecimal
;              call     bytebin2bcd.packed
;
;unpacked bcd: mov      rdi,hexadecimal
;              call     bytebin2bcd.unpacked
;
;build: nasm -felf64 bytebin2bcd.asm -o bytebin2bcd.o

bits 64

global bytebin2bcd.packed
global bytebin2bcd.unpacked

section .text

bytebin2bcd.unpacked:
    ;convert rdi to packed bcd, result is in rax
    ;a byte has max 3 bcd digits. [0..255]
    call    bytebin2bcd.packed
    ;unpack the digits
    shl     rax,8
    ror     ax,4
    ror     al,4
    ret

bytebin2bcd.packed:
    push    rcx                 ;save used registers
    push    rdx
    mov     rax,rdi             ;value in rax
    and     rax,0xFF            ;only low byte will be converted
    mov     cl,5                ;bits to shift = 8 - 3
    ror     rax,cl              ;put 3 most significant bits in al
.repeat:
    push    rcx                 ;save bit counter
    mov     rdx,rax             ;digits in rdx
    add     rdx,0x33            ;add 3 anyway
    and     rdx,0x88            ;keep each fourth bit of previous result
    and     rdx,rcx             ;keep fourth bit 
    shr     rdx,3               ;we have either 0 or 1
    add     rax,rdx             ;add 0 or 1 to each digit
    shl     rdx,1               ;make 0 or 2
    add     rax,rdx             ;add 0 or 2 to each digit in rax
    pop     rcx                 ;restore bit counter
    rol     rax,1               ;shift in next bit left of rax
    loop    .repeat             ;decrement bit counter and repeat if still not zero
    pop     rdx                 ;save used registers
    pop     rcx
    ret
