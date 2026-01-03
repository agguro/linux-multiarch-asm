/*
===============================================================================
  bcd2bin_sse2_m128i
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

.section .rodata
.align 16
mul_10_1:
    .word 10, 1, 10, 1, 10, 1, 10, 1
mul_100_1_d:
    .long 100, 1, 100, 1

.section .text
.globl bcd2bin_sse2_m128i
.type  bcd2bin_sse2_m128i, @function
.align 16

# ------------------------------------------------------------
# __m128i bcd2bin_sse2_m128i(const void* bcd)
# ------------------------------------------------------------
bcd2bin_sse2_m128i:
    pushq %rbp
    pushq %rbx
    pushq %rax
    pushq %rdi

    # read the digits in xmm1, xmm2, xmm3

    movdqu  (%rdi), %xmm1       ; xmm1 = 16 digits (bytes)
    movdqu  16(%rdi), %xmm2     ; xmm2 = 16 digits (bytes)
    pxor    %xmm3, %xmm3        ; zero xmm3
    movq    32(%rdi), %xmm3     ; load only 8 bytes (bytes 32..39)
    movl    32(%rdi), %eax      ; load bytes 32..35 (4 bytes)
    movd    %eax, %xmm3
    movw    36(%rdi), %ax       ; load bytes 36..37 (2 bytes)
    pinsrw  $2, %ax, %xmm3      ; insert into word lane 2

    # keep xmm15 for masks
    pxor      %xmm15, %xmm15    ; xmm15 = 0

    # unpack digits (bytes -> words)
    movdqa     %xmm1,%xmm4
    movdqa     %xmm1,%xmm5        ;
    punpcklbw %xmm15, %xmm4      ; xmm4 = 8 words: d0..d7
    punpckhbw %xmm15, %xmm5      ; xmm5 = 8 words: d8..d15

    movdqa     %xmm2,%xmm6
    movdqa     %xmm2,%xmm7        ;
    punpcklbw %xmm15, %xmm6      ; xmm6 = 8 words: d0..d7
    punpckhbw %xmm15, %xmm7      ; xmm7 = 8 words: d8..d15

    movdqa     %xmm3,%xmm8
    movdqa     %xmm3,%xmm9        ;
    punpcklbw %xmm15, %xmm8      ; xmm4 = 8 words: d0..d7
    punpckhbw %xmm15, %xmm9      ; xmm5 = 8 words: d8..d15

    # what I have so far:

    # xmm0 inientionally not used keep it as final destination for result
    #                         rdi -> ptr to digits[38]
    #                         ------------------------
    #             xmm1                   xmm2                  xmm3
    #         digits 0..15           digits 16..31           digits 32..37
    #      xmm4        xmm5        xmm6        xmm7        xmm8        xmm9
    #   dig[0..7]   dig[0..7]   dig[0..7]   dig[0..7]   dig[0..7]   dig[0..7]
    #
    # ------------------------------------------------------------------------- 
    #
    # later performance check: xmm1, xmm2, xmm3 aren't needed anymore

    # execute dn * 10 + d(n+1)

    movdqa  mul_10_1(%rip), %xmm15          # read multiplier 10

    pmaddwd %xmm15, %xmm4    ; xmm0 = 4 dwords: (d0*10+d1), (d2*10+d3), ...
    pmaddwd %xmm15, %xmm5    ; xmm2 = same for upper digits
    pmaddwd %xmm15, %xmm6    ; xmm0 = 4 dwords: (d0*10+d1), (d2*10+d3), ...
    pmaddwd %xmm15, %xmm7    ; xmm2 = same for upper digits
    pmaddwd %xmm15, %xmm8    ; xmm0 = 4 dwords: (d0*10+d1), (d2*10+d3), ...
    pmaddwd %xmm15, %xmm9    ; xmm2 = same for upper digits

    # execute ddn * 100 + dd(n+1)

    movdqa  mul_100_1_d(%rip), %xmm15        # read multiplier 100
    
    pmuldq  %xmm15, %xmm4   ; xmm4 = [p0*100, p2*100]
    pmuldq  %xmm15, %xmm6   ; xmm6 = [p0*100, p2*100]
    pmuldq  %xmm15, %xmm8   ; xmm8 = [p0*100, p2*100]

    psrldq  $4, %xmm4    ; shifts p1 into low position
    psrldq  $4, %xmm6
    psrldq  $4, %xmm8

    paddq   %xmm4, %xmm5
    paddq   %xmm6, %xmm7
    paddq   %xmm8, %xmm9

    

    
    popq %rdi    
    popq %rax
    popq %rbx
    popq %rbp
    ret

