# ------------------------------------------------------------------------------
# File: bin2hexascii_avx512_m512i.s
# Description: 512-bit Binary to 128-byte Hex-ASCII
# Strategy: Arithmetic Branchless (PIE-Compatible, Zero Memory Loads)
# Logic: Based on your byte-bin-to-hex-ascii arithmetic surprise.
# ------------------------------------------------------------------------------

.section .text
.globl bin2hex_zmm_512
.type bin2hex_zmm_512, @function
.align 64

bin2hex_zmm_512:
    # Input:  RDI = Source (512-bit binary / 64 bytes)
    # Output: RSI = Destination (128 bytes Hex-ASCII)

    # --- 1. Load Data ---
    vmovdqu64 (%rdi), %zmm0           # Load all 512 bits

    # --- 2. Generate Constants in Registers (Avoids .rodata/Cache Misses) ---
    # Generate 0x0F Mask
    vpternlogd $0xFF, %zmm9, %zmm9, %zmm9 # Set ZMM9 to all 1s
    vpsrlw     $4, %zmm9, %zmm9           # Shift to get 0x0F in every byte lane

    # Broadcast Arithmetic Constants from GPRs
    movq    $9, %rax
    vpbroadcastb %eax, %zmm8          # Threshold for A-F logic
    movq    $0x30, %rax
    vpbroadcastb %eax, %zmm7          # ASCII '0' base
    movq    $7, %rax
    vpbroadcastb %eax, %zmm6          # Adjustment for A-F (ASCII 'A' - '0' - 9)

    # --- 3. Isolate Nibbles ---
    vpsrlw    $4, %zmm0, %zmm1        # ZMM1 = High Nibbles (shifted)
    vpandd    %zmm9, %zmm0, %zmm0     # ZMM0 = Low Nibbles (0x0-0xF)
    vpandd    %zmm9, %zmm1, %zmm1     # ZMM1 = High Nibbles (0x0-0xF)

    # --- 4. Branchless Hex Logic (Parallelized Surprise Logic) ---
    # Compare nibbles against 9 to handle 0-9 vs A-F
    vpcmpub $1, %zmm8, %zmm0, %k1     # k1 = mask where LowNibble > 9
    vpcmpub $1, %zmm8, %zmm1, %k2     # k2 = mask where HighNibble > 9

    # Convert all to ASCII '0' range first
    vpaddb    %zmm7, %zmm0, %zmm0     # Add 0x30 to all Low Nibbles
    vpaddb    %zmm7, %zmm1, %zmm1     # Add 0x30 to all High Nibbles

    # Apply the A-F adjustment (+7) only where the nibble was > 9
    vpaddb    %zmm6, %zmm0, %zmm0 {%k1} 
    vpaddb    %zmm6, %zmm1, %zmm1 {%k2}

    # --- 5. Interleave for Correct Hex String Order ---
    # Hex printing requires: [High Nibble ASCII][Low Nibble ASCII]
    # vpunpcklbw/hbw merges ZMM1 (High) and ZMM0 (Low)
    vpunpcklbw %zmm0, %zmm1, %zmm2    # Interleave low 32 input bytes -> 64 ASCII chars
    vpunpckhbw %zmm0, %zmm1, %zmm3    # Interleave high 32 input bytes -> 64 ASCII chars

    # --- 6. Final Store (128 Bytes) ---
    vmovdqu64 %zmm2, (%rsi)           # Store first 64 chars
    vmovdqu64 %zmm3, 64(%rsi)         # Store next 64 chars

    ret

.section .note.GNU-stack,"",@progbits
