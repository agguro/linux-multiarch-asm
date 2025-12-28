; ==============================================================================
; File: bin2hexascii_conv.asm
; Version: 7.0 (2025-12-28)
; Author: agguro (idea) with Gemini (implementation)
; Description: Branch-free Binary to Hex-ASCII conversion routines.
; ==============================================================================

bits 64

global bin2hexascii_uint4
global bin2hexascii_uint8
global bin2hexascii_uint16
global bin2hexascii_uint32
global bin2hexascii_uint64
global bin2hexascii_uint128
global bin2hexascii_uint256
global bin2hexascii_uint512

section .text

; --- 4-bit Nibble to Hex-ASCII ---
bin2hexascii_uint4:
    mov     rax, rdi
    and     rax, 0x0F          ; only lower 4 bits count
    shl     ax, 4              ; shift to most significant positions
    add     ax, 0x0060         ; add 0110 to nibble
    shr     al, 4              ; move back to least significant positions
    sub     al, 6              ; subtract 6 from nibble
    and     al, 0x0F           ; mask bits 7 to 4
    sub     al, ah             ; subtract AH from AL
    shl     ah, 3              ; multiplicate AH by 8
    sub     al, ah             ; subtract AH from AL
    add     ah, 0x18           ; add 2 to bits in AH
    shl     ah, 1              ; multiply AH by two
    or      al, ah             ; make AL ASCII
    xor     ah, ah             ; zero out bits from AH
    ret

; --- 8-bit Byte to Hex-ASCII ---
bin2hexascii_uint8:
    movzx   edx, dil           ; Copy input byte to EDX
    mov     eax, edx        
    shr     al, 4              ; Isolate high nibble in AL
    and     dl, 0x0F           ; Isolate low nibble in DL
    cmp     al, 10             ; Check if nibble is 0-9 or A-F
    lea     ecx, [rax + 0x30]  ; Base: nibble + '0'
    setge   al                 ; AL = 1 if nibble >= 10, else 0
    movzx   eax, al
    lea     eax, [ecx + eax*7]  ; If A-F, add 7
    shl     eax, 8             ; Position high nibble character in AH
    cmp     dl, 10             ; Check if nibble is 0-9 or A-F
    lea     esi, [edx + 0x30]  ; Base: nibble + '0'
    setge   dl                 ; DL = 1 if nibble >= 10
    movzx   edx, dl
    lea     edx, [esi + edx*7]  ; If A-F, add 7
    or      al, dl             ; Combine results into EAX
    ret

; --- 16-bit Word to Hex-ASCII ---
bin2hexascii_uint16:
    push    rbx
    push    rcx
    mov     ax, di             ; value in ax
    ror     rax, 8             ; make group of nibble separated by a zero
    rol     ax, 4
    shr     al, 4
    rol     rax, 16
    shr     ax, 4
    shr     al, 4
    mov     ebx, 0x06060606    ; add 0x06 to each nibble
    mov     ecx, 0xF0F0F0F0    ; keep overflow
    add     eax, ebx
    and     ecx, eax
    sub     eax, ebx
    shr     ecx, 1
    sub     eax, ecx
    shr     ecx, 3
    sub     eax, ecx
    shr     ebx, 1
    add     ebx, ecx
    shl     ebx, 4
    or      eax, ebx
    pop     rcx
    pop     rbx
    ret

; --- 32-bit Dword to Hex-ASCII ---
bin2hexascii_uint32:
    push    rbx
    push    rcx
    push    rdx
    mov     eax, edi
    mov     edx, edi
    shl     rdx, 16
    or      rax, rdx           ; spread into rax
    mov     rcx, 0x0000FFFF0000FFFF
    and     rax, rcx
    mov     rdx, rax
    shl     rdx, 8
    or      rax, rdx
    mov     rcx, 0x00FF00FF00FF00FF
    and     rax, rcx
    mov     rdx, rax
    shl     rdx, 4
    or      rax, rdx
    mov     rcx, 0x0F0F0F0F0F0F0F0F
    and     rax, rcx
    mov     rbx, 0x0606060606060606
    shl     rcx, 4
    add     rax, rbx
    and     rcx, rax
    sub     rax, rbx
    shr     rcx, 1
    sub     rax, ecx
    shr     rcx, 3
    sub     rax, ecx
    shr     rbx, 1
    add     rbx, rcx
    shl     rbx, 4
    or      rax, rbx
    pop     rdx
    pop     rcx
    pop     rbx
    ret

; --- 64-bit Qword to Hex-ASCII ---
; Spreads 64-bit input in RDI into 16 bytes in XMM0 for parallel processing
    ; Uses SIMD paddb/psubb for branchless '0'-'F' mapping
bin2hexascii_uint64:
    push    rcx
    push    r8
    push    r9
    push    r10
    push    r11
    push    r12
    push    r13
    push    r14
    push    r15
    mov     rax, rdi           ; Input Qword in RDI
    mov     edx, eax           ; Low dword
    shr     rax, 32            ; High dword
    mov     r8, rax
    mov     r9, rdx
    shl     r8, 16
    shl     r9, 16
    or      rax, r8
    or      rdx, r9
    mov     rcx, 0x0000FFFF0000FFFF
    and     rax, rcx
    and     rdx, rcx
    mov     r8, rax
    mov     r9, rdx
    shl     r8, 8
    shl     r9, 8
    or      rax, r8
    or      rdx, r9
    mov     rcx, 0x00FF00FF00FF00FF
    and     rax, rcx
    and     rdx, rcx
    mov     r8, rax
    mov     r9, rdx
    shl     r8, 4
    shl     r9, 4
    or      rax, r8
    or      rdx, r9
    mov     rcx, 0x0F0F0F0F0F0F0F0F
    and     rax, rcx
    and     rdx, rcx
    movq    xmm0, rdx          ; lower nibbles
    pinsrq  xmm0, rax, 0x01    ; higher nibbles
    shl     rcx, 4
    movq    xmm1, rcx
    pinsrq  xmm1, rcx, 0x01
    mov     rax, 0x0606060606060606
    movq    xmm2, rax
    pinsrq  xmm2, rax, 0x01
    paddb   xmm0, xmm2
    pand    xmm1, xmm0
    psubb   xmm0, xmm2
    psrlw   xmm1, 1
    psubb   xmm0, xmm1
    psrlw   xmm1, 3
    psubb   xmm0, xmm1
    psrlw   xmm2, 1
    paddb   xmm1, xmm2
    psllw   xmm1, 4
    paddb   xmm0, xmm1
    movq    rax, xmm0          ; lower 8 bytes
    movhlps xmm0, xmm0
    movq    rdx, xmm0          ; high 8 bytes
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

; --- 128-bit Binary to Hex-ASCII ---
; Input:  XMM0 (128-bit binary)
; Output: [RDI] points to buffer (32 bytes)
bin2hexascii_uint128:
    push    rdi
    vmovq   rdi, xmm0           ; Low 64 bits
    call    bin2hexascii_uint64
    pop     rdi
    mov     [rdi], rax          ; Store digits 1-8
    mov     [rdi+8], rdx        ; Store digits 9-16
    vpextrq rdi, xmm0, 1        ; High 64 bits
    call    bin2hexascii_uint64
    mov     [rdi+16], rax       ; Store digits 17-24
    mov     [rdi+24], rdx       ; Store digits 25-32
    ret

; --- 256-bit Binary to Hex-ASCII ---
; Input:  YMM0 (256-bit binary)
; Output: [RDI] points to buffer (64 bytes)
bin2hexascii_uint256:
    push    rbp
    mov     rbp, rsp
    sub     rsp, 16             ; Save RDI
    mov     [rbp-8], rdi
    vextracti128 xmm0, ymm0, 0  ; Low 128 bits
    mov     rdi, [rbp-8]
    call    bin2hexascii_uint128
    vextracti128 xmm0, ymm0, 1  ; High 128 bits
    mov     rdi, [rbp-8]
    add     rdi, 32
    call    bin2hexascii_uint128
    leave
    ret

; --- 512-bit Binary to Hex-ASCII ---
; Input:  ZMM0 (512-bit binary)
; Output: [RDI] points to buffer (128 bytes)
bin2hexascii_uint512:
    push    rbp
    mov     rbp, rsp
    sub     rsp, 16
    mov     [rbp-8], rdi
    vextracti64x4 ymm0, zmm0, 0 ; Low 256 bits
    mov     rdi, [rbp-8]
    call    bin2hexascii_uint256
    vextracti64x4 ymm0, zmm0, 1 ; High 256 bits
    mov     rdi, [rbp-8]
    add     rdi, 64
    call    bin2hexascii_uint256
    leave
    ret
