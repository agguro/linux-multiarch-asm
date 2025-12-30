/*
===============================================================================
  bcd2bin_avx512_m512i
===============================================================================

  Purpose
  -------
  Convert a packed BCD decimal number into a 512-bit unsigned integer,
  using a branchless Horner scheme with radix 10^16.

  The result is returned in an AVX-512 ZMM register (__m512i).

  This routine is designed for:
    - fixed-width big integers
    - deterministic execution (no branches)
    - ABI correctness
    - PIE safety
    - high performance ingestion of large decimal numbers

-------------------------------------------------------------------------------
  Function Prototype (C / C++)
-------------------------------------------------------------------------------

  #include <immintrin.h>

  extern "C"
  __m512i bcd2bin_avx512_m512i(const void* bcd);

-------------------------------------------------------------------------------
  Calling Convention
-------------------------------------------------------------------------------

  System V AMD64 ABI (Linux / BSD / macOS on x86-64)

  Input:
    rdi = pointer to packed BCD buffer (see layout below)

  Output:
    zmm0 = 512-bit unsigned integer result (__m512i)

  Clobbers:
    - Caller-saved GPRs
    - ZMM/XMM/YMM registers (caller-saved by ABI)

  Preserves:
    - Callee-saved registers per SysV ABI

-------------------------------------------------------------------------------
  BCD Input Format (CRITICAL)
-------------------------------------------------------------------------------

  The input MUST be packed BCD, LSB-aligned.

  - 154 decimal digits total
  - 77 bytes
  - Little-endian digit order (least significant digit first)

  Byte layout:

    bcd[0]  = (digit1 << 4) | digit0
    bcd[1]  = (digit3 << 4) | digit2
    ...
    bcd[76] = (digit153 << 4) | digit152

  Where:
    - digit0 is the 10^0 digit
    - digit153 is the 10^153 digit

  Constraints:
    - Each nibble MUST be in the range 0–9
    - The high nibble of bcd[76] is unused for smaller values
    - No sign, no decimal point, no exponent

  Example:
    Decimal: 10^0
    BCD:     bcd[0] = 0x01, all other bytes = 0x00

    Decimal: 10^16
    BCD:     bcd[8] = 0x01

-------------------------------------------------------------------------------
  Algorithm Overview
-------------------------------------------------------------------------------

  The conversion uses Horner's method with radix 10^16:

      Acc = B0
      Acc = Acc * 10^16 + B1
      Acc = Acc * 10^16 + B2
      ...
      Acc = Acc * 10^16 + B9

  Where:
    - B0  = top 10 decimal digits
    - B1..B9 = subsequent 16-digit blocks

  Each block is decoded using SWAR BCD-to-binary collapse:
    - unpack nibbles
    - accumulate with base-10 multipliers
    - no branches
    - no tables
    - no memory lookups

-------------------------------------------------------------------------------
  Size Limits
-------------------------------------------------------------------------------

  - Maximum decimal digits: 154
  - Maximum value: 10^154 − 1
  - Fits entirely within 512 bits (2^512 − 1)

  Larger decimal values will overflow silently and produce undefined results.

-------------------------------------------------------------------------------
  Build Requirements
-------------------------------------------------------------------------------

  - x86-64 CPU with AVX-512F
  - or Intel SDE (for testing/emulation)

  Example build:

      gcc -O2 -mavx512f -c bcd2bin_avx512_m512i.s
      g++ -O2 -mavx512f test.cpp bcd2bin_avx512_m512i.o

  Example run under SDE:

      /opt/sde/sde64 -icl -- ./test

-------------------------------------------------------------------------------
  Notes
-------------------------------------------------------------------------------

  - This routine is intentionally fixed-width and non-generic.
  - It is equivalent in purpose to a decimal-ingest front-end of a bignum
    library (e.g. GMP), but specialized for exactly 512 bits.
  - No dynamic memory, no loops, no branches.
  - Deterministic instruction path.

===============================================================================
*/
-

.section .text
.globl bcd2bin_avx512_m512i
.type bcd2bin_avx512_m512i, @function
.align 64

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

    .irp reg, %r9,%r10,%r11,%r12,%r13,%r14,%r15
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
    adcq $0, %r12
    adcq $0, %r13
    adcq $0, %r14
    adcq $0, %r15
.endm

# ------------------------------------------------------------
# PROCESS_BLOCK_10
#   Decode top 10 digits (5 bytes, LSB-aligned)
#   Acc = block
# ------------------------------------------------------------
.macro PROCESS_BLOCK_10 offset
    movq    \offset(%rdi), %rax
    movabsq $0x000000FFFFFFFFFF, %rbx
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

    movabsq $0x0000FFFF0000, %rbx
    movq    %rax, %rdx
    shr     $16, %rdx
    andq    %rbx, %rax
    andq    %rbx, %rdx
    imul    $10000, %rdx, %rdx
    addq    %rdx, %rax

    movq    %rax, %r8
.endm

# ------------------------------------------------------------
# Entry: __m512i bcd2bin_avx512_m512i(const void* src)
# ------------------------------------------------------------
bcd2bin_avx512_m512i:
    pushq %rbp
    pushq %rbx
    pushq %r12
    pushq %r13
    pushq %r14
    pushq %r15

    xorq %r8,  %r8
    xorq %r9,  %r9
    xorq %r10, %r10
    xorq %r11, %r11
    xorq %r12, %r12
    xorq %r13, %r13
    xorq %r14, %r14
    xorq %r15, %r15

    # 154-digit Horner chain (MSB -> LSB)
    PROCESS_BLOCK_10  72
    PROCESS_BLOCK_16  64
    PROCESS_BLOCK_16  56
    PROCESS_BLOCK_16  48
    PROCESS_BLOCK_16  40
    PROCESS_BLOCK_16  32
    PROCESS_BLOCK_16  24
    PROCESS_BLOCK_16  16
    PROCESS_BLOCK_16   8
    PROCESS_BLOCK_16   0

    # Pack r8..r15 -> zmm0
    vmovq   %r8,  %xmm0
    vpinsrq $1, %r9,  %xmm0, %xmm0

    vmovq   %r10, %xmm1
    vpinsrq $1, %r11, %xmm1, %xmm1
    vinserti128 $1, %xmm1, %ymm0, %ymm0

    vmovq   %r12, %xmm2
    vpinsrq $1, %r13, %xmm2, %xmm2

    vmovq   %r14, %xmm3
    vpinsrq $1, %r15, %xmm3, %xmm3
    vinserti128 $1, %xmm3, %ymm2, %ymm1

    vinserti64x4 $1, %ymm1, %zmm0, %zmm0

    popq %r15
    popq %r14
    popq %r13
    popq %r12
    popq %rbx
    popq %rbp
    ret

