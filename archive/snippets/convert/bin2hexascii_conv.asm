; ==============================================================================
; File: bin2hexascii_conv.asm
; Version: 7.7 (2025-12-28)
; Description: Fixed Procedure Names, SDE Alignment Errors, and Immediates.
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
    movzx   eax, dil
    and     al, 0x0F           ;
    cmp     al, 10             ;
    setge   cl                 ;
    movzx   ecx, cl            ;
    imul    ecx, 7             ; Magic 7
    add     al, '0'            ;
    add     al, cl             ;
    ret

; --- 8-bit Byte to Hex-ASCII ---
bin2hexascii_uint8:
    movzx   edi, dil
    mov     eax, edi
    shr     al, 4              ; High nibble
    and     dil, 0x0F          ; Low nibble
    
    ; Process High (Digit 1)
    cmp     al, 10
    setge   cl
    movzx   ecx, cl
    imul    ecx, 7
    add     al, '0'
    add     al, cl
    
    ; Process Low (Digit 2)
    cmp     dil, 10
    setge   cl
    movzx   ecx, cl
    imul    ecx, 7
    add     dil, '0'
    add     dil, cl
    
    shl     eax, 8             ; Shift Digit 1 to AH
    mov     al, dil            ; Digit 2 in AL
    ret

; --- 16-bit Word to Hex-ASCII ---
bin2hexascii_uint16:
    movzx   eax, di
    mov     edx, eax
    shl     edx, 8
    or      eax, edx
    and     eax, 0x00FF00FF    ; Spread to bytes
    mov     edx, eax
    shl     edx, 4
    or      eax, edx
    and     eax, 0x0F0F0F0F    ; Spread to nibbles
    
    mov     edx, eax
    add     edx, 0x06060606    ;
    and     edx, 0x10101010    ; Identify A-F
    shr     edx, 4             ;
    imul    edx, 7             ;
    add     eax, 0x30303030    ;
    add     eax, edx           ;
    bswap   eax                ;
    ret

; --- 32-bit Dword to Hex-ASCII ---
bin2hexascii_uint32:
    mov     eax, edi
    mov     rdx, rax
    shl     rdx, 16
    or      rax, rdx
    mov     rcx, 0x0000FFFF0000FFFF
    and     rax, rcx           ;
    mov     rdx, rax
    shl     rdx, 8
    or      rax, rdx
    mov     rcx, 0x00FF00FF00FF00FF
    and     rax, rcx           ;
    mov     rdx, rax
    shl     rdx, 4
    or      rax, rdx
    mov     rcx, 0x0F0F0F0F0F0F0F0F
    and     rax, rcx           ;
    
    mov     rdx, rax
    mov     r8, 0x0606060606060606
    add     rdx, r8
    mov     r8, 0x1010101010101010
    and     rdx, r8            ;
    shr     rdx, 4             ;
    imul    rdx, 7             ;
    mov     r8, 0x3030303030303030 ; Fix 64-bit overflow
    add     rax, r8            ;
    add     rax, rdx           ;
    bswap   rax                ;
    ret

; --- 64-bit Qword to Hex-ASCII ---
bin2hexascii_uint64:
    push    r12
    mov     r12, rdi
    shr     rdi, 32
    call    bin2hexascii_uint32
    mov     rdx, rax           ; High results
    mov     rdi, r12
    call    bin2hexascii_uint32
    ; Low results in RAX
    pop     r12
    ret

; --- 128-bit Binary to Hex-ASCII ---
bin2hexascii_uint128:
    push    r12
    mov     r12, rsi
    vmovdqu xmm0, [rdi]        ; Unaligned Load
    vmovq   rdi, xmm0
    call    bin2hexascii_uint64
    mov     [r12], rax
    mov     [r12+8], rdx
    vpextrq rdi, xmm0, 1
    call    bin2hexascii_uint64
    mov     [r12+16], rax
    mov     [r12+24], rdx
    pop     r12
    ret

; --- 256-bit Binary to Hex-ASCII ---
bin2hexascii_uint256:
    push    rbp
    mov     rbp, rsp
    push    r12
    push    r13
    mov     r12, rdi
    mov     r13, rsi
    vmovdqu ymm0, [r12]        ; Unaligned Load
    
    vextracti128 xmm0, ymm0, 0
    vmovdqu [rbp-32], xmm0     ; Save temp
    lea     rdi, [rbp-32]
    mov     rsi, r13
    call    bin2hexascii_uint128
    
    vextracti128 xmm0, ymm0, 1
    vmovdqu [rbp-32], xmm0
    lea     rdi, [rbp-32]
    lea     rsi, [r13+32]
    call    bin2hexascii_uint128
    
    pop     r13
    pop     r12
    pop     rbp
    ret

; --- 512-bit Binary to Hex-ASCII ---
bin2hexascii_uint512:
    push    rbp
    mov     rbp, rsp
    push    r12
    push    r13
    mov     r12, rdi
    mov     r13, rsi
    vpxord    zmm0, zmm0, zmm0 ;
    vmovdqu64 zmm0, [r12]      ; Unaligned Load
    
    vextracti64x4 ymm0, zmm0, 0
    vmovdqu [rbp-64], ymm0     ;
    lea     rdi, [rbp-64]
    mov     rsi, r13
    call    bin2hexascii_uint256
    
    vextracti64x4 ymm0, zmm0, 1
    vmovdqu [rbp-64], ymm0
    lea     rdi, [rbp-64]
    lea     rsi, [r13+64]
    call    bin2hexascii_uint256
    
    pop     r13
    pop     r12
    pop     rbp
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
