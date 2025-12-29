;name: wordbcd2bin.asm
;
;description:  wordbcd2bin: packed bcd word to binary conversion.
;
;use:
;packed bcd:   mov      rdi,packedbcd
;              call     wordbcd2bin
;
;build: nasm -felf64 wordbcd2bin.asm -o wordbcd2bin.o

bits 64

global wordbcd2bin

section .text

wordbcd2bin:
    ;convert packed bcd in AX to binary in EAX.
    push    rcx                 ;save used registers
    push    rdx
    mov     rax,rdi             ;value in rax
    and     ax,0xFFFF           ;only low word counts
    ror     eax,1               ;save bit 0
    mov     rcx,10              ;loop counter
.repeat:
    mov     dx,ax               ;ax in temp register dx
    add     dx,0x3333           ;add 3 to each nibble
    and     dx,0x8888           ;keep bit 3 of each nibble
    shr     dx,2                ;divide result by 4
    sub     ax,dx               ;subtract either 2 or 0 from each nibble in ax
    shr     dx,1                ;divide result by 2
    sub     ax,dx               ;subtract either 1 or 0 from each nibble in ax 
    ror     eax,1               ;save lowest nibble
    loop    .repeat             ;repeat until number is converted
    rol     eax,11              ;result in 5 lowest nibbles
    pop     rdx                 ;restore used registers
    pop     rcx
    ret
