/*
===============================================================================
  bcd2bin_avx2_m256i
===============================================================================

  Purpose
  -------
  Convert a packed BCD decimal number into a 256-bit unsigned integer.

  This is the AVX2 / YMM variant of the BCD→binary conversion family.
  It uses SWAR digit collapse and Horner’s method with radix 10^16.
  The result is returned directly in a YMM register.

-------------------------------------------------------------------------------
  Function Prototype (C / C++)
-------------------------------------------------------------------------------

  #include <immintrin.h>

  extern "C"
  __m256i bcd2bin_avx2_m256i(const void* bcd);

-------------------------------------------------------------------------------
  Calling Convention
-------------------------------------------------------------------------------

  SysV AMD64 ABI (Linux / BSD / macOS on x86-64)

  Input:
    rdi = pointer to packed BCD buffer (LSB-aligned)

  Output:
    ymm0 = 256-bit unsigned integer result (__m256i)

  Clobbers:
    - rax, rbx, rcx, rdx, rsi
    - ymm/xmm registers (caller-saved by ABI)

  Preserves:
    - callee-saved registers per SysV ABI

-------------------------------------------------------------------------------
  BCD Input Format (MANDATORY)
-------------------------------------------------------------------------------

  - LSB-aligned packed BCD
  - Maximum decimal digits: 77
  - BCD buffer size: 39 bytes

  Layout:

    bcd[0]  = (digit1 << 4) | digit0   ; 10^0, 10^1
    bcd[1]  = (digit3 << 4) | digit2
    ...
    bcd[38] = (digit76 << 4) | digit75 ; high nibble unused

  Constraints:
    - Each nibble must be in range 0–9
    - No sign, no decimal point, no exponent
    - Values ≥ 10^77 overflow silently

-------------------------------------------------------------------------------
  Algorithm Overview
-------------------------------------------------------------------------------

  Horner’s method with radix 10^16:

      Acc = B0
      Acc = Acc * 10^16 + B1
      Acc = Acc * 10^16 + B2
      Acc = Acc * 10^16 + B3
      Acc = Acc * 10^16 + B4

  Where:
    - B0 = top 13 decimal digits
    - B1..B4 = subsequent 16-digit blocks

  Each block is decoded using SWAR:
    - unpack BCD nibbles
    - accumulate base-10 weights
    - no tables, no branches

-------------------------------------------------------------------------------
  Size Limits
-------------------------------------------------------------------------------

  Maximum representable value:
    10^77 − 1

  This fits entirely within 256 bits:
    floor(256 * log10(2)) = 77 digits

-------------------------------------------------------------------------------
  Build Requirements
-------------------------------------------------------------------------------

  - x86-64 CPU with AVX2 support
  - Or Intel SDE for emulation

  Assemble:
      as bcd2bin_avx2_m256i.s -o bcd2bin_avx2_m256i.o

  Link (example):
      g++ -O2 -mavx2 test.cpp bcd2bin_avx2_m256i.o

  Run under SDE (if needed):
      sde64 -haswell -- ./test

-------------------------------------------------------------------------------
  Notes
-------------------------------------------------------------------------------

  - No branches
  - No .rodata
  - PIE-safe
  - Deterministic instruction path
  - Assembly-only design

===============================================================================
*/

.section .text
.globl bcd2bin_avx2_m256i
.type  bcd2bin_avx2_m256i, @function
.align 32

# ------------------------------------------------------------
# PROCESS_BLOCK_16
#   Decode 16 digits (8 bytes, LSB-aligned)
#   Acc = Acc * 10^16 + block
# ------------------------------------------------------------
.macro PROCESS_BLOCK_16 offset
    movq    \offset(%rdi), %rax
    movq    %rax, %rdx
    shr     $4, %rdx
    movabsq $0x0F0F0F0F0F0F0F0F, %rbx
    andq    %rbx, %rax
    andq    %rbx, %rdx
    imul    $10, %rdx, %rdx
    addq    %rdx, %rax

    movabsq $0x00FF00FF00FF00FF, %rbx
    movq    %rax, %rdx
    shr     $8, %rdx
    andq    %rbx, %rax
    andq    %rbx, %rdx
    imul    $100, %rdx, %rdx
    addq    %rdx, %rax

    movabsq $0x0000FFFF0000FFFF, %rbx
    movq    %rax, %rdx
    shr     $16, %rdx
    andq    %rbx, %rax
    andq    %rbx, %rdx
    imul    $10000, %rdx, %rdx
    addq    %rdx, %rax

    movq    %rax, %rdx
    shr     $32, %rdx
    imul    $100000000, %rdx, %rdx
    addq    %rdx, %rax

    movq    %rax, %rsi

    movabsq $10000000000000000, %rcx

    movq    %r8, %rax
    mulq    %rcx
    movq    %rax, %r8
    movq    %rdx, %rbx

    .irp reg, %r9,%r10,%r11
        movq \reg, %rax
        mulq %rcx
        addq %rbx, %rax
        adcq $0, %rdx
        movq %rax, \reg
        movq %rdx, %rbx
    .endr

    addq %rsi, %r8
    adcq $0, %r9
    adcq $0, %r10
    adcq $0, %r11
.endm

# ------------------------------------------------------------
# PROCESS_BLOCK_13
#   Decode top 13 digits (7 bytes, LSB-aligned)
#   Acc = block
# ------------------------------------------------------------
.macro PROCESS_BLOCK_13 offset
    movq    \offset(%rdi), %rax
    movabsq $0x00FFFFFFFFFFFFFF, %rbx
    andq    %rbx, %rax

    movq    %rax, %rdx
    shr     $4, %rdx
    movabsq $0x0F0F0F0F0F0F0F, %rbx
    andq    %rbx, %rax
    andq    %rbx, %rdx
    imul    $10, %rdx, %rdx
    addq    %rdx, %rax

    movabsq $0x00FF00FF00FF00FF, %rbx
    movq    %rax, %rdx
    shr     $8, %rdx
    andq    %rbx, %rax
    andq    %rbx, %rdx
    imul    $100, %rdx, %rdx
    addq    %rdx, %rax

    movabsq $0x0000FFFF0000FFFF, %rbx
    movq    %rax, %rdx
    shr     $16, %rdx
    andq    %rbx, %rax
    andq    %rbx, %rdx
    imul    $10000, %rdx, %rdx
    addq    %rdx, %rax

    movq    %rax, %r8
.endm

# ------------------------------------------------------------
# Entry: __m256i bcd2bin_avx2_m256i(const void* src)
# ------------------------------------------------------------
bcd2bin_avx2_m256i:
    pushq %rbp
    pushq %rbx

    xorq %r8,  %r8
    xorq %r9,  %r9
    xorq %r10, %r10
    xorq %r11, %r11

    # 256-bit Horner chain (MSB -> LSB)
    PROCESS_BLOCK_13  32
    PROCESS_BLOCK_16  24
    PROCESS_BLOCK_16  16
    PROCESS_BLOCK_16   8
    PROCESS_BLOCK_16   0

    # Pack r8..r11 -> ymm0
    vmovq   %r8,  %xmm0
    vpinsrq $1, %r9,  %xmm0, %xmm0

    vmovq   %r10, %xmm1
    vpinsrq $1, %r11, %xmm1, %xmm1

    vinserti128 $1, %xmm1, %ymm0, %ymm0

    popq %rbx
    popq %rbp
    ret

