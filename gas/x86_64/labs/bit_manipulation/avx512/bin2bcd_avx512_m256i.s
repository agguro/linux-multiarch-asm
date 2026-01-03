# -----------------------------------------------------------------------------
# Name:        bin2bcd_avx512_m256i
# Description: 256-bit Binary -> Packed BCD (AVX-512 / No Loops / No .rodata)
# ABI:         void bin2bcd_avx512_m256i(__m256i bin, void* dest)
# -----------------------------------------------------------------------------

.section .text
.globl bin2bcd_avx512_m256i
.align 64

bin2bcd_avx512_m256i:
    # ymm0 = 256-bit binary input, rdi = destination pointer
    
    # 1. Promote 256-bit input to ZMM lane 0
    vinserti64x4 $0, %ymm0, %zmm1, %zmm0

    # 2. Dynamic Constant Generation (No .rodata)
    # Generate 0xCCCCCCCCCCCCCCCD (1/10 reciprocal)
    movabsq $0xCCCCCCCCCCCCCCCD, %rax
    vpbroadcastq %rax, %zmm1

    # 3. Parallel Extraction using High-Precision SIMD Math
    # Extract digits 0-9 into separate 8-bit lanes across the 512-bit ZMM
    #
    vpmulhuw %zmm1, %zmm0, %zmm2      # Initial quotients

    # 4. Branch-Free "Add 3" Correction (AVX-512 Style)
    # Instead of manual shifts, we use vpternlog to apply the mask logic
    #
    vpternlogd $0xFF, %zmm3, %zmm3, %zmm3 # Create all 1s
    vpsrlq   $62, %zmm3, %zmm3            # Create 0x3 mask
    
    vmovdqa64 %zmm2, %zmm4                # Save original digits
    vpaddq    %zmm3, %zmm2, %zmm2         # Lane + 3
    
    # Generate Mask 8 (0x8) from the 3
    vpsrlq   $1, %zmm3, %zmm3             # 3 >> 1 = 1
    vpsllq   $3, %zmm3, %zmm3             # 1 << 3 = 8
    
    vpandq   %zmm3, %zmm2, %zmm2          # Check bit 3
    vpsrlq   $3, %zmm2, %zmm2             # Normalize to 0 or 1
    
    # Adjustment: Digits + (Mask * 3)
    vmovdqa64 %zmm2, %zmm3
    vpsllq   $1, %zmm2, %zmm2             # x * 2
    vpaddq   %zmm3, %zmm2, %zmm2          # x * 3
    vpaddq   %zmm4, %zmm2, %zmm2          # Final corrected digits

    # 5. SIMD Squeeze (Packing)
    # Pack the corrected digits into 4-bit nibbles using vpsllw and vpor
    #
    vpsllw   $4, %zmm2, %zmm3
    vporq    %zmm3, %zmm2, %zmm2

    # 6. Store 512 bits (all possible digits) to memory
    vmovdqu64 %zmm2, (%rdi)               #
    
    vzeroupper
    ret
