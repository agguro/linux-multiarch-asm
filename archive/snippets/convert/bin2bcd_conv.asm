; ==============================================================================
; File: bin2bcd_conv.asm
; Version: 7.0 (2025-12-28)
; Author: agguro (idea) with Gemini (implementation)
; Algorithm: Reciprocal Multiplication & Recursive Divide and Conquer
; 
; DESCRIPTION:
; Converts Binary to Packed BCD for widths 4-bit up to 512-bit.
; Uses algebraic peeling for speed and recursive chunking for large widths.
; ==============================================================================

bits 64

section .rodata
    align 64
    const_10_19     dq 10000000000000000000 ; Max power of 10 in 64-bit

section .text

global bin2bcd_uint4
global bin2bcd_uint8
global bin2bcd_uint16
global bin2bcd_uint32
global bin2bcd_uint64
global bin2bcd_uint128
global bin2bcd_uint256
global bin2bcd_uint512

; --- 4-bit to BCD ---
bin2bcd_uint4:
    movzx  eax, dil
    mov    edx, eax
    imul   eax, eax, 205
    shr    eax, 11             ; Tens
    lea    ecx, [rax + rax*4]
    add    ecx, ecx            ; Tens * 10
    sub    edx, ecx            ; Units
    shl    eax, 4
    or     eax, edx
    ret

; --- 8-bit to BCD ---
bin2bcd_uint8:
    movzx  eax, dil
    mov    edx, eax
    imul   eax, eax, 205
    shr    eax, 11             ; Quotient (Tens + Hundreds)
    lea    ecx, [rax + rax*4]
    add    ecx, ecx
    sub    edx, ecx            ; Units
    mov    cl, al
    imul   eax, eax, 205
    shr    eax, 11             ; Hundreds
    lea    ebx, [rax + rax*4]
    add    ebx, ebx
    sub    cl, bl              ; Tens
    shl    eax, 8
    shl    ecx, 4
    or     al, cl
    or     al, dl
    ret

; --- 16-bit to BCD ---
bin2bcd_uint16:
    movzx  edi, di
    mov    eax, edi
    imul   eax, 52429          ; Magic 1/10
    shr    eax, 19
    lea    ecx, [rax + rax*4]
    add    ecx, ecx            
    mov    r8d, edi
    sub    r8d, ecx            ; Digit 0
    %macro PEEL_16 1
        mov    edi, eax
        imul   eax, 52429
        shr    eax, 19
        lea    ecx, [rax + rax*4]
        add    ecx, ecx
        mov    %1, edi
        sub    %1, ecx
    %endmacro
    PEEL_16 r9d                ; Digit 1
    PEEL_16 r10d               ; Digit 2
    mov    edi, eax
    imul   eax, 52429
    shr    eax, 19
    lea    ecx, [rax + rax*4]
    add    ecx, ecx
    sub    edi, ecx            ; Digit 3
    shl    eax, 16             ; Digit 4
    shl    edi, 12
    shl    r10d, 8
    shl    r9d, 4
    or     eax, edi
    or     eax, r10d
    or     eax, r9d
    or     eax, r8d
    ret

; --- 32-bit to BCD ---
bin2bcd_uint32:
    mov    r8, 0xCCCCCCCD      ; Magic 1/10
    mov    r9, rdi
    xor    r11, r11
    %assign i 0
    %rep 10
        mov    rax, r9
        mul    r8
        shr    rdx, 3
        lea    rcx, [rdx + rdx*4]
        add    rcx, rcx
        mov    rax, r9
        sub    rax, rcx
        shl    rax, i
        or     r11, rax
        mov    r9, rdx
        %assign i i+4
    %endrep
    mov    rax, r11
    ret

; --- 64-bit to BCD ---
; Input: RDI (64-bit binary)
; Output: RDX:RAX (Packed BCD)
bin2bcd_uint64:
    mov    r8, 1000000000      ; Chunk by 10^9
    mov    rax, rdi
    xor    rdx, rdx
    div    r8
    push   rdx                 ; Low 9 digits
    xor    rdx, rdx
    div    r8                  ; High chunks
    mov    r13, rdx            ; Digits 10-18
    mov    r14, rax            ; Digits 19-20
    pop    rdi
    call   bin2bcd_uint32
    mov    r15, rax            ; Low BCD
    mov    edi, r13d
    call   bin2bcd_uint32
    mov    rcx, rax
    shl    rcx, 36
    or     r15, rcx
    shr    rax, 28
    mov    r12, rax
    mov    edi, r14d
    call   bin2bcd_uint32
    shl    rax, 8
    or     rax, r12
    mov    rdx, rax            ; High BCD
    mov    rax, r15            ; Low BCD
    ret

; --- 128-bit to BCD ---
bin2bcd_uint128:
    push    rbx
    mov     rbx, rdi
    vmovq   rdi, xmm0
    vpextrq rsi, xmm0, 1
    mov     rax, rdi
    mov     rdx, rsi
    mov     rcx, [rel const_10_19]
    div     rcx
    push    rax
    mov     rdi, rdx
    call    bin2bcd_uint64
    mov     [rbx], rax
    mov     [rbx+8], rdx
    pop     rdi
    call    bin2bcd_uint64
    mov     [rbx+16], rax
    pop     rbx
    ret

; --- 256-bit to BCD ---
bin2bcd_uint256:
    push    rbp
    mov     rbp, rsp
    sub     rsp, 64
    vmovdqa [rbp-32], ymm0
    vmovdqa xmm0, [rbp-32]
    mov     rdi, [rbp+16]
    call    bin2bcd_uint128
    vmovdqa xmm0, [rbp-16]
    mov     rdi, [rbp+16]
    add     rdi, 32
    call    bin2bcd_uint128
    leave
    ret

; --- 512-bit to BCD ---
bin2bcd_uint512:
    push    rbp
    mov     rbp, rsp
    sub     rsp, 128
    vmovdqa64 [rbp-64], zmm0
    vmovdqa ymm0, [rbp-64]
    mov     rdi, [rbp+16]
    call    bin2bcd_uint256
    vmovdqa ymm0, [rbp-32]
    mov     rdi, [rbp+16]
    add     rdi, 64
    call    bin2bcd_uint256
    leave
    ret
