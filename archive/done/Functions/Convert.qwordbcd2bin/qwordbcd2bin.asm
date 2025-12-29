;name: qwordbcd2bin.asm
;
;description:  qwordbcd2bin: packed bcd qword to binary conversion.
;
;use:
;packed bcd:   mov      rdi,packedbcd
;              call     qwordbcd2bin
;
;build: nasm -felf64 qwordbcd2bin.asm -o qwordbcd2bin.o

bits 64

global qwordbcd2bin

section .text

qwordbcd2bin:
    ;convert a packed bcd in RAX to binary in RAX
    push    rdx                         ;save used registers
    push    rcx                         ;loop counter
    push    r8                          ;result register
    push    r9                          ;nibble values 3
    push    r10                         ;bitmask
    mov     rax,rdi                     ;value in rax
    mov     rcx,51                      ;loop counter (empirically)
    mov     r9,0x3333333333333333       ;load nibble values
    mov     r10,0x8888888888888888      ;load mask
.repeat:
    rcr     rax,1                       ;rightmost bit in r8
    rcr     r8,1
    mov     rdx,rax                     ;value in rdx
    add     rdx,r9                      ;add 3 to nibbles
    and     rdx,r10                     ;mask off bit 0,1 and 2 from nibbles
    shr     rdx,2                       ;divide by 4 resulting in 2 or 0
    sub     rax,rdx                     ;subtract from original value
    shr     rdx,1                       ;divide by 2 resulting in 2 or 0
    sub     rax,rdx                     ;subtract from original
    loop    .repeat                     ;repeat loop
    rcr     rax,1                       ;remaining 3 bits in r8
    rcr     r8,1
    rcr     rax,1
    rcr     r8,1
    rcr     rax,1
    rcr     r8,1
    mov     rax,r8                      ;result in rax
    shr     rax,10                      ;correct result
    pop     r10                         ;restore used registers
    pop     r9
    pop     r8
    pop     rcx
    pop     rdx
    ret
