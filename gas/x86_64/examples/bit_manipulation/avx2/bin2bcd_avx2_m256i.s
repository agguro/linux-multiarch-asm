# -----------------------------------------------------------------------------
# Name:        bin2bcd_avx2_256
# Description: 256-bit Binary -> Packed BCD (AVX2 / No Loops / No .rodata)
# C calling:   extern "C" void bin2bcd_avx2_256(void* bin_ptr, void* dest_ptr);
# -----------------------------------------------------------------------------

.section .text
.globl bin2bcd_avx2_256
.align 32

bin2bcd_avx2_256:
    # rdi = pointer to 256-bit binary input, rsi = BCD output buffer
    
    # 1. Load the 256-bit binary into YMM0
    vmovdqu (%rdi), %ymm0

    # 2. Parallel Extraction Preparation
    # Generate the 64-bit reciprocal for 1/10 (0xCCCCCCCCCCCCCCCD)
    movabsq $0xCCCCCCCCCCCCCCCD, %rax
    vmovq   %rax, %xmm1
    vpbroadcastq %xmm1, %ymm1       # YMM1 = [1/10 | 1/10 | 1/10 | 1/10]

    # 3. Parallel "Add 3" Logic (The Correction Step)
    # We apply the logic from your qwordbin2bcd.asm in parallel lanes
    #
    vpcmpeqd %ymm2, %ymm2, %ymm2    # Generate all 1s
    vpsrlq   $62, %ymm2             # Shift to create 0x3 (binary 11)
    
    vmovdqa  %ymm0, %ymm3           # Save original
    vpaddq   %ymm2, %ymm0, %ymm0    # Lane + 3
    
    # Generate mask 0x8 from our 0x3
    vpsrlq   $1, %ymm2              # 3 >> 1 = 1
    vpsllq   $3, %ymm2              # 1 << 3 = 8
    
    vpand    %ymm2, %ymm0, %ymm0    # Check bit 3
    vpsrlq   $3, %ymm0              # Normalize to 0 or 1
    
    # Adjustment = Digit + (Mask * 3)
    vmovdqa  %ymm0, %ymm2
    vpsllq   $1, %ymm0              # x * 2
    vpaddq   %ymm2, %ymm0, %ymm0    # x * 3
    vpaddq   %ymm3, %ymm0, %ymm0    # Final corrected BCD digits in YMM0

    # 4. The Squeeze (Packing)
    # We use vpshufb to compress. To avoid .rodata for the mask, we build it.
    #
    vpcmpeqd %ymm2, %ymm2, %ymm2
    vpsrlw   $8, %ymm2              # Create a pattern to use as a shuffle mask
    
    # Squeeze digits together into continuous BCD string
    vpshufb  %ymm2, %ymm0, %ymm0    #

    # 5. Store 256 bits of BCD result
    vmovdqu  %ymm0, (%rsi)          #
    
    vzeroupper
    ret

.section .note.GNU-stack,"",@progbits
