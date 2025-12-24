;name: qwordbin2hexascii.asm
;
;description: branch free conversion of qword in rax to ascii in rdx:rax
;             use of r8, r9, rcx, rdx, xmm1 and xmm2 requires SSE.
;
;build: nasm -felf64 qwordbin2hexascii.asm -o qwordbin2hexascii.o

bits 64
   
global qwordbin2hexascii

section .text

qwordbin2hexascii:
    push    rcx
    push    r8
    push    r9
    push    r10
    push    r11
    push    r12
    push    r13
    push    r14
    push    r15
    movq    r10,xmm0                ;lower 64 bits in rax
    movhlps xmm0,xmm0               ;move higher 64 bits of xmm0
    movq    r11,xmm0                ;high 64 bits in rdx
    movq    r12,xmm1                ;lower 64 bits in rax
    movhlps xmm1,xmm1               ;move higher 64 bits of xmm0
    movq    r13,xmm1                ;high 64 bits in rdx
    movq    r14,xmm2                ;lower 64 bits in rax
    movhlps xmm2,xmm2               ;move higher 64 bits of xmm0
    movq    r15,xmm2                ;high 64 bits in rdx
    
    mov     rax,rdi                 ;qword in rax
    ;unpack qword in rax into two dwords in rdx and rax
    mov     edx,eax                 ;low dword in edx
    shr     rax,32                  ;high dword in eax
    ;unpack dwords into words
    mov     r8,rax
    mov     r9,rdx
    shl     r8,16
    shl     r9,16
    or      rax,r8
    or      rdx,r9
    mov     rcx,0x0000FFFF0000FFFF
    and     rax,rcx
    and     rdx,rcx
    ;unpack words into bytes
    mov     r8,rax
    mov     r9,rdx
    shl     r8,8
    shl     r9,8
    or      rax,r8
    or      rdx,r9
    mov     rcx,0x00FF00FF00FF00FF
    and     rax,rcx
    and     rdx,rcx
    ;unpack bytes into nibbles
    mov     r8,rax
    mov     r9,rdx
    shl     r8,4
    shl     r9,4
    or      rax,r8
    or      rdx,r9
    mov     rcx,0x0F0F0F0F0F0F0F0F
    and     rax,rcx
    and     rdx,rcx
    ;load unpacked qword into xmm0
    movq    xmm0,rdx                ;lower nibble is xmm0
    pinsrq  xmm0,rax,0x01           ;insert higher nibbles in xmm0
    shl     rcx,4                   ;load mask in xmm1
    movq    xmm1,rcx
    pinsrq  xmm1,rcx,0x01
    mov     rax,0x0606060606060606  ;load const for addition in xmm2
    movq    xmm2,rax
    pinsrq  xmm2,rax,0x01
    ;here the convertion starts
    paddb   xmm0,xmm2
    pand    xmm1,xmm0
    psubb   xmm0,xmm2 
    psrlw   xmm1,1
    psubb   xmm0,xmm1
    psrlw   xmm1,3
    psubb   xmm0,xmm1
    psrlw   xmm2,1
    paddb   xmm1,xmm2
    psllw   xmm1,4
    paddb   xmm0,xmm1
    movq    rax,xmm0                ;lower 64 bits in rax
    movhlps xmm0,xmm0               ;move higher 64 bits of xmm0
    movq    rdx,xmm0                ;high 64 bits in rdx
    ;restore registers
    movq    xmm0,r10                ;lower 64 bits in xmm0
    pinsrq  xmm0,r11,0x01           ;insert higher 64 bits in xmm0
    movq    xmm1,r12                ;lower 64 bits in xmm1
    pinsrq  xmm1,r13,0x01           ;insert higher 64 bits in xmm1
    movq    xmm2,r14                ;lower 64 bits in xmm2
    pinsrq  xmm2,r15,0x01           ;insert higher 64 bits in xmm2    
    pop     r15
    pop     r14
    pop     r13
    pop     r12
    pop     r11
    pop     r10
    pop     r9
    pop     r8
    pop     rcx
    ret
