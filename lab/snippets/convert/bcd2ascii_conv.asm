; ==============================================================================
; File: bcd2ascii_conv.asm
; Version: 8.1 (Final Integration - Fully Commented)
;
; Description:
;   A high-performance library for converting PACKED BCD values into ASCII
;   digit strings. Supports scalar sizes from 4-bit up to 64-bit and vector
;   sizes up to 512-bit using composable routines.
;
;   Packed BCD format:
;     - Each 4-bit nibble represents one decimal digit (0–9)
;     - No validation is performed for invalid BCD digits (A–F)
;
;   Output:
;     - Fixed-width ASCII strings
;     - Big-endian human-readable digit order
;
; Architecture:
;   - Branchless
;   - Constant time
;   - SIMD-style arithmetic even in scalar code
;   - ABI-safe (callee-saved registers preserved)
;
; ==============================================================================

bits 64

; ------------------------------------------------------------------------------
; Public API
; ------------------------------------------------------------------------------

global bcd2ascii_uint4
global bcd2ascii_uint8
global bcd2ascii_uint16
global bcd2ascii_uint32
global bcd2ascii_uint64
global bcd2ascii_m128i
global bcd2ascii_m256i
global bcd2ascii_m512i

section .text

; ------------------------------------------------------------------------------
; bcd2ascii_uint4
;
; Convert a single BCD nibble to one ASCII character.
;
; Input:
;   DIL  = packed BCD digit in low nibble
;
; Output:
;   AL   = ASCII character ('0'–'9')
;
; Notes:
;   - Upper nibble ignored
;   - No digit validation
; ------------------------------------------------------------------------------

bcd2ascii_uint4:
    movzx   eax, dil            ; Zero-extend input byte
    and     al, 0x0F            ; Isolate low nibble (BCD digit)
    or      al, 0x30            ; Add ASCII bias ('0')
    ret

; ------------------------------------------------------------------------------
; bcd2ascii_uint8
;
; Convert one packed BCD byte into two ASCII characters.
;
; Input:
;   DIL = [ high nibble | low nibble ]
;
; Output:
;   AX  = ASCII(high) | ASCII(low)
;
; Example:
;   DIL = 0x42 → AX = '4''2'
; ------------------------------------------------------------------------------

bcd2ascii_uint8:
    movzx   eax, dil            ; Load BCD byte
    mov     edx, eax            ; Copy for low digit

    shr     al, 4               ; Move high nibble → low
    and     dl, 0x0F            ; Isolate low nibble

    or      al, 0x30            ; Convert high digit to ASCII
    or      dl, 0x30            ; Convert low digit to ASCII

    shl     edx, 8              ; Position low digit as second character
    or      eax, edx            ; Merge → AX = 2 ASCII chars
    ret

; ------------------------------------------------------------------------------
; bcd2ascii_uint16
;
; Convert a 16-bit packed BCD word into four ASCII characters.
;
; Input:
;   DI   = 4 packed BCD digits
;
; Output:
;   EAX  = 4 ASCII characters
;
; Strategy:
;   - Spread bytes
;   - Spread nibbles
;   - Mask digits
;   - Add ASCII bias in parallel
;   - Byte-swap for human order
; ------------------------------------------------------------------------------

bcd2ascii_uint16:
    movzx   eax, di             ; Load 16-bit BCD value
    mov     edx, eax
    shl     edx, 8
    or      eax, edx            ; Duplicate bytes

    and     eax, 0x00FF00FF     ; Spread bytes: 00AA00BB
    mov     edx, eax
    shl     edx, 4
    or      eax, edx            ; Spread nibbles into bytes

    and     eax, 0x0F0F0F0F     ; Mask each digit
    add     eax, 0x30303030     ; Add ASCII '0' to all bytes
    bswap   eax                 ; Fix big-endian string order
    ret

; ------------------------------------------------------------------------------
; bcd2ascii_uint32
;
; Convert a 32-bit packed BCD value into eight ASCII characters.
;
; Input:
;   EDI  = 8 packed BCD digits
;
; Output:
;   RAX  = 8 ASCII characters
;
; Notes:
;   - Fully parallel conversion
;   - Uses mask-and-shift widening
; ------------------------------------------------------------------------------

bcd2ascii_uint32:
    mov     eax, edi            ; Load BCD
    mov     rdx, rax
    shl     rdx, 16
    or      rax, rdx            ; Duplicate halves

    mov     rcx, 0x0000FFFF0000FFFF
    and     rax, rcx            ; Spread words

    mov     rdx, rax
    shl     rdx, 8
    or      rax, rdx

    mov     rcx, 0x00FF00FF00FF00FF
    and     rax, rcx            ; Spread bytes

    mov     rdx, rax
    shl     rdx, 4
    or      rax, rdx

    mov     rcx, 0x0F0F0F0F0F0F0F0F
    and     rax, rcx            ; Isolate digits

    mov     r8, 0x3030303030303030
    add     rax, r8             ; Convert to ASCII
    bswap   rax                 ; Correct display order
    ret

; ------------------------------------------------------------------------------
; bcd2ascii_uint64
;
; Convert 64-bit packed BCD → 16 ASCII bytes
;
; Input:
;   rdi = packed BCD (8 bytes)
;   rsi = pointer to 16-byte ASCII destination
;
; Clobbers:
;   xmm0–xmm5
;
; Requires:
;   SSE2
; ------------------------------------------------------------------------------

bcd2ascii_uint64:

    ; ----------------------------------------------------------
    ; 1) Load 64-bit packed BCD into XMM
    ; ----------------------------------------------------------
    movq    xmm0, rdi            ; lower 8 bytes used

    ; ----------------------------------------------------------
    ; 2) Create nibble mask: xmm1 = 0x0F everywhere
    ; ----------------------------------------------------------
    pcmpeqb xmm1, xmm1           ; xmm1 = 0xFF
    psrlw   xmm1, 4              ; xmm1 = 0x0F

    ; ----------------------------------------------------------
    ; 3) Extract LOW nibbles
    ; ----------------------------------------------------------
    pand    xmm2, xmm0, xmm1

    ; ----------------------------------------------------------
    ; 4) Extract HIGH nibbles
    ; ----------------------------------------------------------
    psrlw   xmm3, xmm0, 4
    pand    xmm3, xmm3, xmm1

    ; ----------------------------------------------------------
    ; 5) Create ASCII bias: xmm4 = '0'
    ; ----------------------------------------------------------
    mov     eax, 0x30
    movd    xmm4, eax
    pshufd  xmm4, xmm4, 0        ; broadcast 0x30

    ; ----------------------------------------------------------
    ; 6) Convert digits → ASCII
    ; ----------------------------------------------------------
    paddb   xmm2, xmm4           ; low digits
    paddb   xmm3, xmm4           ; high digits

    ; ----------------------------------------------------------
    ; 7) Interleave HIGH / LOW digits
    ; ----------------------------------------------------------
    punpcklbw xmm5, xmm3, xmm2   ; 16 ASCII bytes

    ; ----------------------------------------------------------
    ; 8) Store result
    ; ----------------------------------------------------------
    movdqu  [rsi], xmm5

    ret



; ------------------------------------------------------------------------------
; bcd2ascii_m128i
;
; Convert 128-bit packed BCD → 32 ASCII bytes
;
; Input:
;   rdi = pointer to 16-byte packed BCD source
;   rsi = pointer to 32-byte ASCII destination
;
; Clobbers:
;   xmm0–xmm6
;
; Requires:
;   SSE2
; ------------------------------------------------------------------------------

bcd2ascii_m128i:

    ; ----------------------------------------------------------
    ; 1) Load packed BCD (16 bytes)
    ; ----------------------------------------------------------
    vmovdqu xmm0, [rdi]

    ; ----------------------------------------------------------
    ; 2) Create nibble mask: xmm1 = 0x0F everywhere
    ; ----------------------------------------------------------
    vpcmpeqb xmm1, xmm1, xmm1     ; xmm1 = 0xFF
    psrlw    xmm1, 4              ; xmm1 = 0x0F

    ; ----------------------------------------------------------
    ; 3) Extract LOW nibbles
    ; ----------------------------------------------------------
    pand     xmm2, xmm0, xmm1

    ; ----------------------------------------------------------
    ; 4) Extract HIGH nibbles
    ; ----------------------------------------------------------
    psrlw    xmm3, xmm0, 4
    pand     xmm3, xmm3, xmm1

    ; ----------------------------------------------------------
    ; 5) Create ASCII bias: xmm4 = '0'
    ; ----------------------------------------------------------
    mov      eax, 0x30
    movd     xmm4, eax
    pshufd   xmm4, xmm4, 0        ; broadcast byte 0x30

    ; ----------------------------------------------------------
    ; 6) Convert digits → ASCII
    ; ----------------------------------------------------------
    paddb    xmm2, xmm4           ; low digits
    paddb    xmm3, xmm4           ; high digits

    ; ----------------------------------------------------------
    ; 7) Interleave HIGH / LOW digits
    ; ----------------------------------------------------------
    punpcklbw xmm5, xmm3, xmm2    ; ASCII bytes 0–15
    punpckhbw xmm6, xmm3, xmm2    ; ASCII bytes 16–31

    ; ----------------------------------------------------------
    ; 8) Store ASCII output
    ; ----------------------------------------------------------
    movdqu   [rsi],      xmm5
    movdqu   [rsi + 16], xmm6

    ret



; ------------------------------------------------------------------------------
; bcd2ascii_m256i
;
; Convert 256-bit packed BCD → 64 ASCII bytes
;
; Input:
;   rdi = pointer to 32-byte packed BCD
;   rsi = pointer to 64-byte ASCII destination
;
; Clobbers:
;   ymm0–ymm6
;
; Requires:
;   AVX2
; ------------------------------------------------------------------------------
bcd2ascii_m256i:

    ; ----------------------------------------------------------
    ; 1) Load packed BCD (32 bytes)
    ; ----------------------------------------------------------
    vmovdqu ymm0, [rdi]

    ; ----------------------------------------------------------
    ; 2) Create nibble mask: ymm1 = 0x0F everywhere
    ; ----------------------------------------------------------
    vpcmpeqb ymm1, ymm1, ymm1     ; ymm1 = 0xFF
    vpsrlw   ymm1, ymm1, 4        ; ymm1 = 0x0F

    ; ----------------------------------------------------------
    ; 3) Extract LOW nibbles
    ; ----------------------------------------------------------
    vpand    ymm2, ymm0, ymm1

    ; ----------------------------------------------------------
    ; 4) Extract HIGH nibbles
    ; ----------------------------------------------------------
    vpsrlw   ymm3, ymm0, 4
    vpand    ymm3, ymm3, ymm1

    ; ----------------------------------------------------------
    ; 5) Create ASCII bias: ymm4 = '0'
    ; ----------------------------------------------------------
    mov      eax, 0x30
    vpbroadcastb ymm4, eax

    ; ----------------------------------------------------------
    ; 6) Convert digits → ASCII
    ; ----------------------------------------------------------
    vpaddb   ymm2, ymm2, ymm4     ; low digits
    vpaddb   ymm3, ymm3, ymm4     ; high digits

    ; ----------------------------------------------------------
    ; 7) Interleave HIGH / LOW digits
    ; ----------------------------------------------------------
    vpunpcklbw ymm5, ymm3, ymm2   ; ASCII bytes 0–31
    vpunpckhbw ymm6, ymm3, ymm2   ; ASCII bytes 32–63

    ; ----------------------------------------------------------
    ; 8) Store ASCII output
    ; ----------------------------------------------------------
    vmovdqu [rsi],      ymm5
    vmovdqu [rsi + 32], ymm6

    vzeroupper
    ret



; ------------------------------------------------------------------------------
; bcd2ascii_m512i
;
; Input:
;   rdi = pointer to 64-byte packed BCD
;   rsi = pointer to 128-byte ASCII output
;
; Clobbers:
;   zmm0–zmm5
;
; Requires:
;   AVX-512F + AVX-512BW
; ------------------------------------------------------------------------------

bcd2ascii_m512i:

    ; Load packed BCD
    vmovdqu8 zmm0, [rdi]

    ; ----------------------------------------------------------
    ; Create nibble mask: zmm1 = 0x0F everywhere
    ; ----------------------------------------------------------
    vpcmpeqb zmm1, zmm1, zmm1     ; zmm1 = 0xFF
    vpsrlw  zmm1, zmm1, 4         ; zmm1 = 0x0F

    ; ----------------------------------------------------------
    ; Extract LOW nibbles
    ; ----------------------------------------------------------
    vpandd  zmm2, zmm0, zmm1

    ; ----------------------------------------------------------
    ; Extract HIGH nibbles
    ; ----------------------------------------------------------
    vpsrlw  zmm3, zmm0, 4
    vpandd  zmm3, zmm3, zmm1

    ; ----------------------------------------------------------
    ; Create ASCII bias: zmm4 = '0'
    ; ----------------------------------------------------------
    mov     eax, 0x30
    vpbroadcastb zmm4, eax

    ; ----------------------------------------------------------
    ; Convert digits → ASCII
    ; ----------------------------------------------------------
    vpaddb  zmm2, zmm2, zmm4
    vpaddb  zmm3, zmm3, zmm4

    ; ----------------------------------------------------------
    ; Interleave HIGH / LOW digits
    ; ----------------------------------------------------------
    vpunpcklbw zmm5, zmm3, zmm2
    vpunpckhbw zmm6, zmm3, zmm2

    ; ----------------------------------------------------------
    ; Store ASCII output
    ; ----------------------------------------------------------
    vmovdqu8 [rsi],      zmm5
    vmovdqu8 [rsi + 64], zmm6

    ret


section .note.GNU-stack noalloc noexec nowrite progbits

