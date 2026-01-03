/*
===============================================================================
  bcd2bin_sse2_m128i_swar
===============================================================================

  Purpose
  -------
  Convert a packed BCD decimal number into a 128-bit unsigned integer.

  This is the SSE2 / XMM variant of the BCD→binary conversion family.
  It is the smallest fixed-width member and is valid on all x86-64 CPUs.

-------------------------------------------------------------------------------
  Function Prototype (C / C++)
-------------------------------------------------------------------------------

  #include <emmintrin.h>

  extern "C"
  __m128i bcd2bin_sse2_m128i(const void* bcd);

-------------------------------------------------------------------------------
  Calling Convention
-------------------------------------------------------------------------------

  SysV AMD64 ABI (Linux / BSD / macOS on x86-64)

  Input:
    rdi = pointer to packed BCD buffer (LSB-aligned)

  Output:
    xmm0 = 128-bit unsigned integer result (__m128i)

  Clobbers:
    - rax, rbx, rcx, rdx, rsi
    - xmm registers (caller-saved by ABI)

  Preserves:
    - callee-saved registers per SysV ABI

-------------------------------------------------------------------------------
  BCD Input Format (MANDATORY)
-------------------------------------------------------------------------------

  - LSB-aligned packed BCD
  - Maximum decimal digits: 38
  - BCD buffer size: 19 bytes

  Layout:

    bcd[0]  = (digit1 << 4) | digit0   ; 10^0, 10^1
    bcd[1]  = (digit3 << 4) | digit2
    ...
    bcd[18] = (digit37 << 4) | digit36 ; high nibble unused

  Constraints:
    - Each nibble must be in range 0–9
    - No sign, no decimal point, no exponent
    - Values ≥ 10^38 overflow silently

-------------------------------------------------------------------------------
  Algorithm Overview
-------------------------------------------------------------------------------

  Horner’s method with radix 10^16:

      Acc = B0
      Acc = Acc * 10^16 + B1
      Acc = Acc * 10^16 + B2

  Where:
    - B0 = top 6 decimal digits
    - B1..B2 = subsequent 16-digit blocks

  SWAR BCD collapse is used for each block:
    - nibble unpack
    - base-10 accumulation
    - branchless integer math

-------------------------------------------------------------------------------
  Size Limits
-------------------------------------------------------------------------------

  Maximum representable value:
    10^38 − 1

  This fits within 128 bits:
    floor(128 * log10(2)) = 38 digits

-------------------------------------------------------------------------------
  Build Requirements
-------------------------------------------------------------------------------

  - x86-64 CPU (SSE2 is mandatory in x86-64)

  Assemble:
      as bcd2bin_sse2_m128i.s -o bcd2bin_sse2_m128i.o

  Link (example):
      g++ -O2 -msse2 test.cpp bcd2bin_sse2_m128i.o

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
.globl bcd2bin_sse2_m128i
.type  bcd2bin_sse2_m128i, @function
.align 16

# ------------------------------------------------------------
# PROCESS_BLOCK_16
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

    movq    %r9, %rax
    mulq    %rcx
    addq    %rbx, %rax
    adcq    $0, %rdx
    movq    %rax, %r9

    addq    %rsi, %r8
    adcq    $0, %r9
.endm

# ------------------------------------------------------------
# PROCESS_BLOCK_6
#   Acc = block (top 6 digits)
# ------------------------------------------------------------
.macro PROCESS_BLOCK_6 offset
    movq    \offset(%rdi), %rax
    movabsq $0x00000000000FFFFF, %rbx
    andq    %rbx, %rax

    movq    %rax, %rdx
    shr     $4, %rdx
    movabsq $0x0F0F0F0F0F, %rbx
    andq    %rbx, %rax
    andq    %rbx, %rdx
    imul    $10, %rdx, %rdx
    addq    %rdx, %rax

    movabsq $0x00FF00FF00FF, %rbx
    movq    %rax, %rdx
    shr     $8, %rdx
    andq    %rbx, %rax
    andq    %rbx, %rdx
    imul    $100, %rdx, %rdx
    addq    %rdx, %rax

    movq    %rax, %r8
.endm

# ------------------------------------------------------------
# __m128i bcd2bin_sse2_m128i(const void* bcd)
# ------------------------------------------------------------
bcd2bin_sse2_m128i:
    pushq %rbp
    pushq %rbx

    xorq %r8, %r8
    xorq %r9, %r9

    # 38-digit Horner chain (MSB → LSB)
    PROCESS_BLOCK_6   16
    PROCESS_BLOCK_16   8
    PROCESS_BLOCK_16   0

    # pack r8:r9 → xmm0
    movq    %r8, %xmm0
    pinsrq  $1, %r9, %xmm0

    popq %rbx
    popq %rbp
    ret

