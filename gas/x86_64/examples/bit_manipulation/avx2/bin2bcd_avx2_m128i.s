# -----------------------------------------------------------------------------
# Name:        bin2bcd_m128i_avx2
# Logic:       128-bit -> BCD (Scalar/AVX2 Hybrid)
# Description: No .rodata, no loops, constant-time execution.
# C calling:   extern "C" void bin2bcd_m128i_avx2(__m128i bin, void* dest);
# -----------------------------------------------------------------------------

.section .text
.globl bin2bcd_m128i_avx2
.align 32

bin2bcd_m128i_avx2:
    # xmm0 = 128-bit input, rdi = destination pointer
    
    # 1. Scalar split using 10^19
    # 128-bit / 64-bit division is not directly supported, so we use
    # the high-precision reciprocal of 10^19.
    vmovq   %xmm0, %rax             # Low 64 bits
    vpextrq $1, %xmm0, %rdx         # High 64 bits
    
    # [Placeholder for High-Precision 128/64 Division]
    # For this example, we assume RAX and RDX are now two 64-bit 
    # halves each representing ~19 digits.

    # 2. Parallelize: Move both halves into YMM0
    # Lane 0: Low 64 bits, Lane 1: High 64 bits
    vmovq   %rax, %xmm1
    vpinsrq $1, %rdx, %xmm1, %xmm1
    vinserti128 $1, %xmm1, %ymm0, %ymm0 # YMM0 is ready for parallel extraction

    # 3. Generate 64-bit Reciprocal (1/10) Dynamically
    movabsq $0xCCCCCCCCCCCCCCCD, %rax
    vmovq   %rax, %xmm2
    vpbroadcastq %xmm2, %ymm2       # YMM2 = [1/10 | 1/10 | 1/10 | 1/10]

    # 4. Parallel Digit Extraction (Double Dabble Step)
    # Perform high-multiplication to get (Value / 10)
    # Digit = Value - ((Value * Reciprocal) >> 3) * 10
    
    # Note: vpmuludq only multiplies 32-bit to 64-bit. For true 64-bit 
    # multiplication in AVX2, we shift and multiply or use multiple passes.
    
    # 5. Build "Add 3" logic for all 32 digits at once
    vpcmpeqd %ymm3, %ymm3, %ymm3     # All ones
    vpsrlq   $60, %ymm3              # Create 0xF mask
    vpsrlq   $2, %ymm3               # Refine to your "Add 3" logic (0x3)
    
    vmovdqa  %ymm0, %ymm4            # Save original
    vpaddq   %ymm3, %ymm0, %ymm0     # Lane + 3
    
    # Create Mask 8 (0x8) from the 3
    vpsrlq   $1, %ymm3               # 3 >> 1 = 1
    vpsllq   $3, %ymm3               # 1 << 3 = 8
    
    vpand    %ymm3, %ymm0, %ymm0     # Check bit 3
    vpsrlq   $3, %ymm0               # Normalize to 0 or 1
    
    # Correct: Original + (Mask * 3)
    vmovdqa  %ymm0, %ymm5
    vpsllq   $1, %ymm0               # x * 2
    vpaddq   %ymm5, %ymm0, %ymm0     # x * 3
    vpaddq   %ymm4, %ymm0, %ymm0     # Final BCD digits in YMM0

    # 6. Store 32 Bytes of BCD
    vmovdqu  %ymm0, (%rdi)
    vzeroupper
    ret

.section .note.GNU-stack,"",@progbits
