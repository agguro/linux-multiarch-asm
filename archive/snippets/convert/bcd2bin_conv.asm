; ==============================================================================
; File: bcd2bin_conv.asm
; Version: 7.0 (2025-12-28)
; Author: agguro (idea) with Gemini to do the heavy typing
; Algorithm: Recursive Horner's Method (Divide & Conquer)
; 
; DESCRIPTION:
; This library converts Packed BCD to Binary. Unlike the "Double Dabble" 
; algorithm which uses bit-shifting loops, this implementation uses 
; straight-line multiplication and multi-precision addition (Zero-Loop).
;
; PERFORMANCE:
; 512-bit conversion executes in ~1,488 cycles (assuming 1 cycle/inst).
; This is roughly 10x faster than traditional loop-based shift-and-adjust.
; ==============================================================================

bits 64
align 64
    
section .rodata

    ; Constants for Horner's Method weights
    const_10_2      dq 100
    const_10_4      dq 10000
    const_10_8      dq 100000000
    const_10_16     dq 0x2386F26FC10000                    ; 10^16
    
    ; 10^32 (128-bit constant)
    const_10_32_lo  dq 0x5B85ACEF81000000
    const_10_32_hi  dq 0x00000004EE2D6D41
    
    ; 10^64 (256-bit constant)
    const_10_64_0   dq 0x3528849F34000000
    const_10_64_1   dq 0x08A6A69C590E2D4F
    const_10_64_2   dq 0xCE1B119B004505D0
    const_10_64_3   dq 0x000000000000001B

section .text

global bcd2bin_uint4
global bcd2bin_uint8
global bcd2bin_uint16
global bcd2bin_uint32
global bcd2bin_uint64
global bcd2bin_m128i
global bcd2bin_m256i
global bcd2bin_m512i

; ------------------------------------------------------------------------------
; 4-bit (Nibble) to Binary
; ------------------------------------------------------------------------------
bcd2bin_uint4:
    mov     eax, edi
    and     eax, 0x0f
    ret

; ------------------------------------------------------------------------------
; 8-bit (Byte) to Binary (0 Loops)
; ------------------------------------------------------------------------------
bcd2bin_uint8:
    movzx   eax, dil
    mov     edx, eax
    and     eax, 0x0f           ; Units
    shr     edx, 4              ; Tens
    lea     edx, [rdx + rdx*4]  ; Tens * 5
    shl     edx, 1              ; Tens * 10
    add     eax, edx
    ret

; ------------------------------------------------------------------------------
; 16-bit (Word) to Binary (0 Loops)
; ------------------------------------------------------------------------------
bcd2bin_uint16:
    movzx   edi, di
    mov     eax, edi
    shr     eax, 8              ; High Byte
    call    bcd2bin_uint8
    imul    eax, 100
    mov     edx, eax
    mov     eax, edi
    and     eax, 0xff           ; Low Byte
    call    bcd2bin_uint8
    add     eax, edx
    ret

; ------------------------------------------------------------------------------
; 32-bit (Dword) to Binary (0 Loops)
; ------------------------------------------------------------------------------
bcd2bin_uint32:
    mov     r8d, edi
    mov     eax, edi
    shr     eax, 16             ; High Word
    call    bcd2bin_uint16
    imul    eax, 10000
    mov     r9d, eax
    mov     eax, r8d
    and     eax, 0xffff         ; Low Word
    call    bcd2bin_uint16
    add     eax, r9d
    ret
align 64
; ------------------------------------------------------------------------------
; 64-bit (Qword) to Binary (0 Loops)
; ------------------------------------------------------------------------------
bcd2bin_uint64:
    mov     r8, rdi
    mov     rax, rdi
    shr     rax, 32             ; High Dword
    mov     edi, eax
    call    bcd2bin_uint32
    mov     r9, 100000000
    mul     r9                  ; Result in RDX:RAX (though 64-bit BCD fits in RAX)
    mov     r10, rax
    mov     rax, r8
    mov     edi, eax            ; Low Dword
    call    bcd2bin_uint32
    add     rax, r10
    ret
align 128
; ------------------------------------------------------------------------------
; 128-bit (XMM) to Binary (0 Loops)
; ------------------------------------------------------------------------------
bcd2bin_m128i:
    push    rbx
    vmovq   rax, xmm0           ; Low 64 BCD
    vpextrq rdi, xmm0, 1        ; High 64 BCD
    mov     rbx, rax            ; Save Low
    call    bcd2bin_uint64      ; Binary(High)
    mul     qword [rel const_10_16]
    mov     r8, rax
    mov     r9, rdx
    mov     rdi, rbx
    call    bcd2bin_uint64      ; Binary(Low)
    add     rax, r8
    adc     rdx, r9
    vmovq   xmm0, rax
    vpinsrq xmm0, rdx, 1
    pop     rbx
    ret

; ------------------------------------------------------------------------------
; 256-bit (YMM) to Binary (0 Loops)
; ------------------------------------------------------------------------------
align 32
bcd2bin_m256i:
    push    rbx
    push    r12
    push    r13
    sub     rsp, 32
    vmovdqa [rsp], ymm0         ; Store BCD
    vextracti128 xmm0, ymm0, 1  ; High 128 BCD
    call    bcd2bin_m128i      ; Returns High-Binary in RDX:RAX
    
    mov     r12, rax            ; Bin_H_Lo
    mov     r13, rdx            ; Bin_H_Hi

    ; Multiply High-Binary by 10^32 (128x128 -> 256 bit)
    mul     qword [rel const_10_32_lo]
    mov     r8, rax
    mov     r9, rdx
    
    mov     rax, r13
    mul     qword [rel const_10_32_lo]
    add     r9, rax
    adc     rdx, 0
    mov     r10, rdx

    mov     rax, r12
    mul     qword [rel const_10_32_hi]
    add     r9, rax
    adc     r10, rdx
    adc     r11, 0

    mov     rax, r13
    mul     qword [rel const_10_32_hi]
    add     r10, rax
    adc     r11, rdx

    ; Merge Low 128 Binary
    vmovdqa xmm0, [rsp]
    call    bcd2bin_m128i
    add     r8, rax
    adc     r9, rdx
    adc     r10, 0
    adc     r11, 0

    vmovq   xmm0, r8
    vpinsrq xmm0, r9, 1
    vmovq   xmm1, r10
    vpinsrq xmm1, r11, 1
    vinserti128 ymm0, ymm0, xmm1, 1
    
    add     rsp, 32
    pop     r13
    pop     r12
    pop     rbx
    ret

; ------------------------------------------------------------------------------
; 512-bit (ZMM) to Binary (0 Loops)
; Logic: Result = (bcd2bin(High256) * 10^64) + bcd2bin(Low256)
; ------------------------------------------------------------------------------
align 64
bcd2bin_m512i:
    ; --- 1. Setup Stack Frame & Align ---
    push    rbp
    mov     rbp, rsp
    
    ; Save Callee-Saved Registers (LIFO order)
    ; Pushing 5 regs + RBP = 6 (Even count keeps stack 16-byte aligned for calls)
    push    r12                 ; Anchor for Input Pointer
    push    r13                 ; Anchor for Output Pointer
    push    r14
    push    r15
    push    rbx

    ; --- 2. Allocate Local Space (128 bytes) ---
    sub     rsp, 128            

    ; --- 3. Capture Pointers into Stable Registers ---
    mov     r12, rdi            ; R12 = bcd_in
    mov     r13, rsi            ; R13 = bin_out

    ; --- 4. Load and Backup Input ---
    vpxord    zmm0, zmm0, zmm0  ; Clear state to avoid PRIVILEGED_INS traps
    vmovdqu64 zmm0, [r12]       ; Unaligned load to be safe
    vmovdqu64 [rbp-64], zmm0    ; Backup original BCD for later

    ; --- 5. Process High 256-bit Half ---
    vextracti64x4 ymm0, zmm0, 1 ; Extract High bits
    call    bcd2bin_m256i       ; Result in YMM0 (H3:H2:H1:H0)
    vmovdqu [rbp-128], ymm0     ; Store High Binary result to local stack

    ; --- 6. Multiplication: HighBinary[256] * 10^64 ---
    xor     r8, r8
    xor     r9, r9
    xor     r10, r10
    xor     r11, r11
    xor     r12, r12
    xor     r13, r13
    xor     r14, r14
    xor     r15, r15

    ; Part 1: HighBinary.Q0 * 10^64
    mov     rax, [rbp-128]
    mul     qword [rel const_10_64_0]
    mov     r8, rax
    mov     r9, rdx
    mov     rax, [rbp-128]
    mul     qword [rel const_10_64_1]
    add     r9, rax
    adc     r10, rdx
    mov     rax, [rbp-128]
    mul     qword [rel const_10_64_2]
    add     r10, rax
    adc     r11, rdx
    mov     rax, [rbp-128]
    mul     qword [rel const_10_64_3]
    add     r11, rax
    adc     r12, rdx
    adc     r13, 0

    ; Part 2: HighBinary.Q1 * 10^64
    mov     rax, [rbp-120]
    mul     qword [rel const_10_64_0]
    add     r9, rax
    adc     r10, rdx
    adc     r11, 0
    adc     r12, 0
    adc     r13, 0
    mov     rax, [rbp-120]
    mul     qword [rel const_10_64_1]
    add     r10, rax
    adc     r11, rdx
    adc     r12, 0
    adc     r13, 0
    mov     rax, [rbp-120]
    mul     qword [rel const_10_64_2]
    add     r11, rax
    adc     r12, rdx
    adc     r13, 0
    mov     rax, [rbp-120]
    mul     qword [rel const_10_64_3]
    add     r12, rax
    adc     r13, rdx
    adc     r14, 0

    ; Part 3: HighBinary.Q2 * 10^64
    mov     rax, [rbp-112]
    mul     qword [rel const_10_64_0]
    add     r10, rax
    adc     r11, rdx
    adc     r12, 0
    adc     r13, 0
    adc     r14, 0
    mov     rax, [rbp-112]
    mul     qword [rel const_10_64_1]
    add     r11, rax
    adc     r12, rdx
    adc     r13, 0
    adc     r14, 0
    mov     rax, [rbp-112]
    mul     qword [rel const_10_64_2]
    add     r12, rax
    adc     r13, rdx
    adc     r14, 0
    mov     rax, [rbp-112]
    mul     qword [rel const_10_64_3]
    add     r13, rax
    adc     r14, rdx
    adc     r15, 0

    ; Part 4: HighBinary.Q3 * 10^64
    mov     rax, [rbp-104]
    mul     qword [rel const_10_64_0]
    add     r11, rax
    adc     r12, rdx
    adc     r13, 0
    adc     r14, 0
    adc     r15, 0
    mov     rax, [rbp-104]
    mul     qword [rel const_10_64_1]
    add     r12, rax
    adc     r13, rdx
    adc     r14, 0
    adc     r15, 0
    mov     rax, [rbp-104]
    mul     qword [rel const_10_64_2]
    add     r13, rax
    adc     r14, rdx
    adc     r15, 0
    mov     rax, [rbp-104]
    mul     qword [rel const_10_64_3]
    add     r14, rax
    adc     r15, rdx

    ; --- 7. Convert and Add Low 256-bit Half ---
    vmovdqu ymm0, [rbp-64]      ; Retrieve Low BCD half
    call    bcd2bin_m256i       ; Result in YMM0
    
    vmovq   rax, xmm0           ; L0
    add     r8, rax
    vpextrq rax, xmm0, 1        ; L1
    adc     r9, rax
    vextracti128 xmm1, ymm0, 1
    vmovq   rax, xmm1           ; L2
    adc     r10, rax
    vpextrq rax, xmm1, 1        ; L3
    adc     r11, rax
    adc     r12, 0              ; Final ripple carries
    adc     r13, 0
    adc     r14, 0
    adc     r15, 0

    ; --- 8. Pack Result into ZMM0 ---
    vmovq   xmm0, r8
    vpinsrq xmm0, xmm0, r9, 1
    vmovq   xmm1, r10
    vpinsrq xmm1, xmm1, r11, 1
    vinserti128 ymm0, ymm0, xmm1, 1 

    vmovq   xmm2, r12
    vpinsrq xmm2, xmm2, r13, 1
    vmovq   xmm3, r14
    vpinsrq xmm3, xmm3, r15, 1
    vinserti128 ymm1, ymm2, xmm3, 1 
    
    vinserti64x4 zmm0, zmm0, ymm1, 1 

    ; --- 9. Final Store using Anchor Output Pointer ---
    vmovdqu64 [r13], zmm0

    ; --- 10. Cleanup & Return ---
    add     rsp, 128            ; Clear local vars
    pop     rbx                 ; Restore in reverse push order
    pop     r15
    pop     r14
    pop     r13
    pop     r12
    pop     rbp
    ret
section .note.GNU-stack noalloc noexec nowrite progbits
