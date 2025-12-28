; name: bcd2ascii_conv.asm
; version: version 2.6 - 2025-12-28
; algorithm: SWAR / Vectorized Parallel Spreading
; description: Converts packed BCD to ASCII strings for various bit widths.
; build: release: nasm -felf64 bcd2ascii_conv.asm -o bcd2ascii_conv.o
;      : debug:   nasm -felf64 -g -F dwarf bcd2ascii_conv.asm -o bcd2ascii_conv.debug.o 

bits 64

global bcd2ascii_uint4
global bcd2ascii_uint8
global bcd2ascii_uint16
global bcd2ascii_uint32
global bcd2ascii_uint64
global bcd2ascii__m128i
global bcd2ascii__m256i
global bcd2ascii__m512i

section .text

; --- 4-bit Nibble to ASCII ---
; name: bcd2ascii_uint4
; version: version 2.6 - 2025-12-28
; algorithm: Simple Masking
; description: Convert 4-bit BCD to 1 ASCII char
; C: uint8_t bcd2ascii_uint4(uint8_t bcd);
bcd2ascii_uint4:
    movzx   eax, dil        ; move input to eax
    and     al, 0x0f        ; keep lower 4 bits
    or      al, 0x30        ; convert to ascii
    ret

; --- 8-bit Byte to ASCII ---
; name: bcd2ascii_uint8
; version: version 2.6 - 2025-12-28
; algorithm: Simple Masking
; description: Convert 8-bit packed BCD to 2 ASCII chars
; C: uint16_t bcd2ascii_uint8(uint8_t bcd);
bcd2ascii_uint8:
    movzx   eax, dil        ; zero-extend input
    mov     edx, eax        ; copy for second nibble
    shr     al, 4           ; isolate high nibble
    add     al, '0'         ; convert to ascii
    shl     eax, 8          ; move to ah position
    and     dl, 0x0f        ; isolate low nibble
    add     dl, '0'         ; convert to ascii
    or      al, dl          ; combine results
    ret

; --- 16-bit Word to ASCII ---
; name: bcd2ascii_uint16
; version: version 2.6 - 2025-12-28
; algorithm: SWAR / Parallel Spreading
; description: Convert 16-bit packed BCD to 4 ASCII chars
; C: uint32_t bcd2ascii_uint16(uint16_t bcd);
bcd2ascii_uint16:
    movzx   eax, di         ; move 16-bit input
    mov     edx, eax        ; copy for spreading
    shl     edx, 8          ; spread bytes
    or      eax, edx        ; merge
    and     eax, 0x00ff00ff ; isolate bytes
    mov     edx, eax        ; copy for nibble spread
    shl     edx, 4          ; spread nibbles
    or      eax, edx        ; merge
    and     eax, 0x0f0f0f0f ; isolate nibbles
    add     eax, 0x30303030 ; convert all to ascii
    ret

; --- 32-bit Dword to ASCII ---
; name: bcd2ascii_uint32
; version: version 2.6 - 2025-12-28
; algorithm: Parallel Spreading (SWAR)
; description: Convert 32-bit packed BCD to 8 ASCII chars
; C: uint64_t bcd2ascii_uint32(uint32_t bcd);
bcd2ascii_uint32:
    mov     eax, edi        ; move 32-bit input
    mov     rdx, rax        ; copy for spreading
    shl     rdx, 16         ; split words
    or      rax, rdx        ; merge
    mov     r8, 0x0000ffff0000ffff ; word mask
    and     rax, r8         ; isolate words
    mov     rdx, rax        ; copy for byte spread
    shl     rdx, 8          ; split bytes
    or      rax, rdx        ; merge
    mov     r8, 0x00ff00ff00ff00ff ; byte mask
    and     rax, r8         ; isolate bytes
    mov     rdx, rax        ; copy for nibble spread
    shl     rdx, 4          ; split nibbles
    or      rax, rdx        ; merge
    mov     r8, 0x0f0f0f0f0f0f0f0f ; nibble mask
    and     rax, r8         ; isolate nibbles
    add     rax, 0x3030303030303030 ; convert to ascii
    ret

; --- 64-bit Qword to ASCII ---
; name: bcd2ascii_uint64
; version: version 2.6 - 2025-12-28
; algorithm: Parallel Spreading (Hierarchical)
; description: Convert 64-bit packed BCD to 16 ASCII chars via memory
; C: void bcd2ascii_uint64(uint64_t bcd, uint64_t *out_low, uint64_t *out_high);
bcd2ascii_uint64:
    push    rsi             ; save destination pointers
    push    rdx
    mov     rsi, rdi        ; save input data
    shr     rdi, 32         ; process high 32 bits
    call    bcd2ascii_uint32
    pop     rdx             ; restore high destination pointer
    mov     [rdx], rax      ; store high 8 ASCII chars
    mov     rdi, rsi        ; process low 32 bits
    call    bcd2ascii_uint32
    pop     rsi             ; restore low destination pointer
    mov     [rsi], rax      ; store low 8 ASCII chars
    ret

; --- 128-bit XMM to ASCII ---
; name: bcd2ascii__m128i
; version: version 2.6 - 2025-12-28
; algorithm: Vectorized Unpack (SIMD)
; description: Convert 128-bit packed BCD to 32 ASCII chars via memory
; C: void bcd2ascii__m128i(__m128i bcd, __m128i *out_low, __m128i *out_high);
bcd2ascii__m128i:
    vmovdqa xmm1, xmm0      ; copy data
    vpsrlw  xmm0, xmm0, 4   ; isolate high nibbles
    vpand   xmm0, xmm0, [rel .mask_low_nibble]
    vpand   xmm1, xmm1, [rel .mask_low_nibble]
    vpunpcklbw xmm2, xmm0, xmm1 ; unpack low bytes
    vpunpckhbw xmm3, xmm0, xmm1 ; unpack high bytes
    vpaddb  xmm2, xmm2, [rel .ascii_bias]
    vpaddb  xmm3, xmm3, [rel .ascii_bias]
    vmovdqa [rdi], xmm2     ; store low 16 bytes
    vmovdqa [rsi], xmm3     ; store high 16 bytes
    ret

; --- 256-bit YMM to ASCII ---
; name: bcd2ascii__m256i
; version: version 2.6 - 2025-12-28
; algorithm: Vectorized Unpack (AVX2)
; description: Convert 256-bit packed BCD to 64 ASCII chars via memory
; C: void bcd2ascii__m256i(__m256i bcd, __m256i *out_low, __m256i *out_high);
bcd2ascii__m256i:
    vpsrlw  ymm2, ymm0, 4
    vpand   ymm2, ymm2, [rel .mask_low_nibble_y]
    vpand   ymm0, ymm0, [rel .mask_low_nibble_y]
    vpunpcklbw ymm1, ymm2, ymm0 
    vpunpckhbw ymm0, ymm2, ymm0 
    vpaddb  ymm1, ymm1, [rel .ascii_bias_y]
    vpaddb  ymm0, ymm0, [rel .ascii_bias_y]
    vmovdqa [rdi], ymm1
    vmovdqa [rsi], ymm0
    ret

; --- 512-bit ZMM to ASCII ---
; name: bcd2ascii__m512i
; version: version 2.6 - 2025-12-28
; algorithm: Vectorized Unpack (AVX-512)
; description: Convert 512-bit packed BCD to 128 ASCII chars via memory
; C: void bcd2ascii__m512i(__m512i bcd, __m512i *out_low, __m512i *out_high);
bcd2ascii__m512i:
    vpsrlw  zmm2, zmm0, 4
    vpandq  zmm2, zmm2, [rel .mask_low_nibble_z]
    vpandq  zmm0, zmm0, [rel .mask_low_nibble_z]
    vpunpcklbw zmm1, zmm2, zmm0
    vpunpckhbw zmm0, zmm2, zmm0
    vpaddb  zmm1, zmm1, [rel .ascii_bias_z]
    vpaddb  zmm0, zmm0, [rel .ascii_bias_z]
    vmovdqa64 [rdi], zmm1
    vmovdqa64 [rsi], zmm0
    ret

section .rodata
    align 64
    .mask_low_nibble    times 16 db 0x0f
    .mask_low_nibble_y  times 32 db 0x0f
    .mask_low_nibble_z  times 64 db 0x0f
    .ascii_bias         times 16 db 0x30
    .ascii_bias_y       times 32 db 0x30
    .ascii_bias_z       times 64 db 0x30
