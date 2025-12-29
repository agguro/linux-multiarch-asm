;name: bytebcd2bin.asm
;
;description:  bytebcd2bin: packed bcd byte to binary conversion.
;
;use:
;packed bcd:   mov      rdi,packedbcd
;              call     bytebcd2bin
;
;build: nasm -felf64 bytebcd2bin.asm -o bytebcd2bin.o

bits 64

global bytebcd2bin

section .text

bytebcd2bin:
    ;convert packed bcd in AL to binary in AX.
    push    rcx                 ;save used register
    mov     rax,rdi             ;value in rax
    and     al,0xFF             ;only low byte count
    ror     eax,1               ;save bit 0
    mov     rcx,4               ;number of loops
.repeat:    
    mov     ah,al               ;al in ah
    add     ah,0x33             ;add 3 to each nibble of AH
    and     ah,0x88             ;keep bit 3 of nibbles in AH
    shr     ah,2                ;divide ah by 4                        
    sub     al,ah               ;subtract either 2 or 0 from al
    shr     ah,1                ;divide ah by 2
    sub     al,ah               ;subtract either 1 or 0 from al
    xor     ah,ah               ;make ah zero
    ror     eax,1               ;save lowest bit
    loop    .repeat             ;continue until converted
    rol     eax,5               ;saved bits to AX
    pop     rcx                 ;restore used register
    ret
