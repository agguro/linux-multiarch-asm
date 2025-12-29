;name: dwordbcd2bin.asm
;
;description:  dwordbcd2bin: packed bcd dword to binary conversion.
;
;use:
;packed bcd:   mov      rdi,packedbcd
;              call     dwordbcd2bin
;The algorithm is the same as for a single nibble.  The number of necessary
;loops is determined empirically.  Because we use this algorithm we can used
;the upper 32 bits of rax to hold the bits to process and store the result in
;eax.
;
;build: nasm -felf64 dwordbcd2bin.asm -o dwordbcd2bin.o

bits 64

global dwordbcd2bin

section .text

dwordbcd2bin:
    ;convert packed bcd in EAX to binary in RAX.
    push    rcx                         ;save used registers
    push    rdx
    push    r9                          ;to hold 0x333....
    push    r10                         ;to hold 0x888....
    mov     r9,0x3333333300000000
    mov     r10,0x8888888800000000
    mov     rax,rdi                     ;value in rax
    shl     rax,31                      ;shift bits 31 to 1 in upper RAX
    mov     rcx,24                      ;times we need to repeat
.repeat:
    mov     rdx,rax                     ;value in rdx
    shr     rdx,32                      ;shift out saved bits in eax
    shl     rdx,32
    add     rdx,r9                      ;add 3 to each nibble
    and     rdx,r10                     ;mask off bit 0,1 and 2 from each nibble
    shr     rdx,2                       ;divide by 4, giving 2 or 0
    sub     rax,rdx                     ;subtract 2 or 0 from original
    shr     rdx,1                       ;divide by 2, giving 1 or 0
    sub     rax,rdx                     ;subtract either 1 or 0
    ror     rax,1                       ;save rightmost 0 in eax
    loop    .repeat
    shr     rax,7                       ;shift bits back in place
    pop     r10                         ;restore used registers
    pop     r9
    pop     rdx
    pop     rcx
    ret
