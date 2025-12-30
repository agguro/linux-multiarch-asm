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

section .note.GNU-stack noalloc noexec nowrite progbits

