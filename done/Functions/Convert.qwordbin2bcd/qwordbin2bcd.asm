;name: qwordbin2bcd.asm
;
;description: qwordbin2bcd.packed:   Branch free qword to packed bcd conversion.
;             qwordbin2bcd.unpacked: Qword to unpacked bcd conversion.
;
;use:
;packed bcd:   mov      rdi,hexadecimal
;              call     qwordbin2bcd.packed
;
;unpacked bcd: mov      rdi,hexadecimal
;              call     qwordbin2bcd.unpacked
;
;This program is tested "a little bit". To check all values I stopped the loop after
;39 minutes and I didn't got all numbers.  So I dear to say that the algoritm works by
;recursion.
;if it worked for 0,1,10b,100b,1000b,... and for 1,11b,111b,...,1111111111....1111b (64bits) then
;it works for all 64 bit numbers. The algorithm can be optimized but then again it will not be as short
;as it is now. (At least the packed one, the unpacking still takes time and registers).
;
;build: nasm -felf64 qwordbin2bcd.asm -o qwordbin2bcd.o

bits 64

global qwordbin2bcd.packed
global qwordbin2bcd.unpacked

section .text

qwordbin2bcd.unpacked:
    ;convert rdi to packed bcd, the result is returned in rdx:rax (20 digits max)
    call    qwordbin2bcd.packed
    push    rcx                     ;save used registers
    push    r9
    push    r10
    xor     r8,r8                   ;don't forget or the results will be wrong
    ;we can optimize here and convert only significant digits
    ;and skip leading zero digits.  The conversion here is a brute one,
    ;just unpack all digits.
    shl     edx,4                   ;4 most significant digits in edx
    ror     dx,4                    ;unpack them
    shl     edx,8
    ror     dx,4
    ror     dl,4
    mov     r8,rdx                  ;save 4 most significant digits in r8
    mov     rdx,rax                 ;get 16 least significants in rdx
    shl     rax,32                  ;split into low 8 digits and
    shr     rdx,32                  ;high 8 digits
    shr     rax,32
    mov     r9,rax                  ;unpack side by side the digits
    mov     r10,rdx
    shl     r9,16
    shl     r10,16
    or      rax,r9
    or      rdx,r10
    mov     rcx,0x0000FFFF0000FFFF
    and     rax,rcx
    and     rdx,rcx
    mov     r9,rax
    mov     r10,rdx
    shl     r9,8
    shl     r10,8
    or      rax,r9
    or      rdx,r10
    mov     rcx,0x00FF00FF00FF00FF
    and     rax,rcx
    and     rdx,rcx
    mov     r9,rax
    mov     r10,rdx
    shl     r9,4
    shl     r10,4
    or      rax,r9
    or      rdx,r10
    mov     rcx,0x0F0F0F0F0F0F0F0F
    and     rax,rcx
    and     rdx,rcx
    pop     r10                             ;restore used registers
    pop     r9
    pop     rcx
    ret
    
qwordbin2bcd.packed:
    push    rbx
    push    rcx
    push    r8
    push    r9
    mov     rbx,rdi                         ;value in rdx
    mov     rax,rdi                         ;and value in rax
    mov     rcx,61                          ;number of bits to shift = 64 - 3
    shr     rax,cl                          ;bits 63,62,61 in al
    shl     rbx,3                           ;shift out bits 63,62 and 61
    ;all bits are in place to start
.repeat:       
    ;check digits
    ;this is the branch free method, it adds 3 to all digits, shift out the 4 bit of each digit
    ;making bit 2,1 and 0 zero.  Bit 3 of each digit is either 1 or 0.  Add to the original digit
    ;this bit and its double (shl) adds 3 again to those digits who are greater than 4.
    push    rcx
    mov     r8,rdx
    mov     r9,rax
    mov     rcx,0x3333333333333333
    add     r8,rcx
    add     r9,rcx
    mov     rcx,0x8888888888888888
    and     r8,rcx
    and     r9,rcx
    shr     r8,3
    shr     r9,3
    add     rax,r9
    add     rdx,r8
    shl     r8,1
    shl     r9,1
    add     rax,r9
    add     rdx,r8
    pop     rcx
    rcl     rbx,1
    rcl     rax,1
    rcl     rdx,1
    loop    .repeat
    pop     r9
    pop     r8
    pop     rcx
    pop     rbx
    ret
