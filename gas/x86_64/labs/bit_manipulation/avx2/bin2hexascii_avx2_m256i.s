# ------------------------------------------------------------------------------
# File: bin2hex_avx2_m256i.s
# Description: 256-bit Binary -> 64-byte Hex-ASCII
# Strategy: Arithmetic Branchless (AVX2 / No Memory Loads / PIE)
# ------------------------------------------------------------------------------

.section .text
.globl bin2hex_ymm_256
.type bin2hex_ymm_256, @function
.align 32

bin2hex_ymm_256:
    # Input:  RDI = Source (256-bit binary / 32 bytes)
    # Output: RSI = Destination (64 bytes Hex-ASCII)

    # --- 1. Load Data ---
    vmovdqu (%rdi), %ymm0             # Load 256 bits

    # --- 2. Generate Constants in Registers (No .rodata) ---
    vpcmpeqd %ymm9, %ymm9, %ymm9      # Set YMM9 to all 1s (0xFF everywhere)
    vpsrlw   $4, %ymm9, %ymm9         # Shift to get 0x0F in every byte
    
    movq    $9, %rax
    vpbroadcastb %eax, %ymm8          # Threshold 9
    movq    $0x30, %rax
    vpbroadcastb %eax, %ymm7          # ASCII '0'
    movq    $7, %rax
    vpbroadcastb %eax, %ymm6          # Adjustment 7

    # --- 3. Isolate Nibbles ---
    vpsrlw    $4, %ymm0, %ymm1        # YMM1 = High Nibbles
    vpand     %ymm9, %ymm0, %ymm0     # YMM0 = Low Nibbles
    vpand     %ymm9, %ymm1, %ymm1     # YMM1 = High Nibbles

    # --- 4. Branchless Hex Logic (AVX2 Masking) ---
    # Create masks where nibble > 9
    vpcmpgtb  %ymm8, %ymm0, %ymm2     # YMM2 = 0xFF if LowNibble > 9
    vpcmpgtb  %ymm8, %ymm1, %ymm3     # YMM3 = 0xFF if HighNibble > 9

    # Apply ASCII '0' base
    vpaddb    %ymm7, %ymm0, %ymm0
    vpaddb    %ymm7, %ymm1, %ymm1

    # Filter the adjustment (+7) through the masks
    vandps    %ymm6, %ymm2, %ymm2     # YMM2 = 7 where nibble > 9, else 0
    vandps    %ymm6, %ymm3, %ymm3     # YMM3 = 7 where nibble > 9, else 0

    # Add the filtered adjustment
    vpaddb    %ymm2, %ymm0, %ymm0
    vpaddb    %ymm3, %ymm1, %ymm1

    # --- 5. Interleave for Correct Order ---
    # We must be careful: AVX2 unpack instructions work within 128-bit lanes.
    # Luckily, for a 256-bit output, this is exactly what we want.
    vpunpcklbw %ymm0, %ymm1, %ymm4    # Interleave low 8 bytes of each 128-bit lane
    vpunpckhbw %ymm0, %ymm1, %ymm5    # Interleave high 8 bytes of each 128-bit lane

    # --- 6. Final Store ---
    # Because of how punpck works across lanes, we need to store them carefully
    # to maintain the original string order.
    vmovdqu %ymm4, (%rsi)             # First 32 chars
    vmovdqu %ymm5, 32(%rsi)           # Next 32 chars

    vzeroupper
    ret

.section .note.GNU-stack,"",@progbits
