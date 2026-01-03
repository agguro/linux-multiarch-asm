# -----------------------------------------------------------------------------
# Name:        bin2bcd_avx512_m512i
# Description: 512-bit Binary -> Packed BCD (AVX-512 / No Loops / No .rodata)
# Logic:       Parallel Reciprocal Extraction + Branch-Free "Add 3"
# ABI:         void bin2bcd_avx512_m512i(__m512i bin, void* dest)
# -----------------------------------------------------------------------------

.section .text
.globl bin2bcd_avx512_m512i
.align 64

bin2bcd_avx512_m512i:
    # zmm0 = 512-bit binary input, rdi = destination pointer
    
    # 1. Dynamic Constant Generation (No .rodata)
    # Generate 0xCCCCCCCCCCCCCCCD (1/10 reciprocal) for parallel extraction
    movabsq $0xCCCCCCCCCCCCCCCD, %rax
    vpbroadcastq %rax, %zmm1

    # 2. Parallel Extraction (Extraction of raw 8-bit digits)
    #
    # Multiply to isolate digits into 64-bit chunks across the register
    vpmulhuw %zmm1, %zmm0, %zmm2

    # 3. Parallel "Add 3" Branch-Free Correction (The Micro-Logic)
    # We apply your logic: if (digit > 4) digit += 3
    # Create the 0x3 mask (binary 11) dynamically using Ternary Logic
    vpternlogq $0xFF, %zmm3, %zmm3, %zmm3 # Create all 1s
    vpsrlq   $62, %zmm3, %zmm3            # Create 0x3 mask
    
    vmovdqa64 %zmm2, %zmm4                # Save original digits
    vpaddq    %zmm3, %zmm2, %zmm2         # Add 3 to all 64 lanes
    
    # Generate Mask 8 (0x8) from the 0x3 mask
    vpsrlq   $1, %zmm3, %zmm3             # 3 >> 1 = 1
    vpsllq   $3, %zmm3, %zmm3             # 1 << 3 = 8
    
    vpandq   %zmm3, %zmm2, %zmm2          # Check for 4th bit (indicates original > 4)
    vpsrlq   $3, %zmm2, %zmm2             # Normalize to 0 or 1
    
    # Apply the +3 correction: Original + (Mask * 3)
    vmovdqa64 %zmm2, %zmm3
    vpsllq   $1, %zmm2, %zmm2             # Mask * 2
    vpaddq   %zmm3, %zmm2, %zmm2          # (Mask * 2) + Mask = Mask * 3
    vpaddq   %zmm4, %zmm2, %zmm0          # Apply to original digits

    # 4. SIMD Packing and Squeezing
    # Shift and OR to pack two digits into every byte
    vpsllw   $4, %zmm0, %zmm1
    vporq    %zmm1, %zmm0, %zmm0          # [High Digit | Low Digit]

    # 5. Final Store
    # Store the packed BCD result to the destination buffer
    vmovdqu64 %zmm0, (%rdi)
    
    vzeroupper
    ret

.section .note.GNU-stack,"",@progbits
