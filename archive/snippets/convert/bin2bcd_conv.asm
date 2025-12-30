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


section .note.GNU-stack noalloc noexec nowrite progbits
