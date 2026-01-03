# -----------------------------------------------------------------------------
# Name:        bcd2ascii_avx512_m512i
# Description: Convert 64 bytes packed BCD (128 digits) -> 128 bytes ASCII
# Logic:       SIMD Parallel Unpacking + ASCII Bias
# C calling:   extern "C" void bcd2ascii_m512i(void *src, char *dest);
# -----------------------------------------------------------------------------

.section .text
.globl bcd2ascii_avx512_m512i
.type bcd2ascii_avx512_m512i, @function
.align 64

bcd2ascii_avx512_m512i:
    # rdi = source BCD pointer, rsi = destination ASCII pointer

    # 1. Load 64 bytes of packed BCD digits
    vmovdqu8 (%rdi), %zmm0

    # 2. Dynamically Generate Nibble Mask (0x0F)
    # Using vpternlogd to create all 1s (0xFF), then shifting to get 0x0F
    vpternlogd $0xFF, %zmm1, %zmm1, %zmm1 # zmm1 = all 1s
    vpsrlw     $4, %zmm1, %zmm1           # zmm1 = 0x0F in every byte

    # 3. Extract LOW nibbles (Digits 0, 2, 4...)
    vpandq     %zmm1, %zmm0, %zmm2        # zmm2 = [0D, 0B, 09...]

    # 4. Extract HIGH nibbles (Digits 1, 3, 5...)
    # Shift words right by 4 bits to bring high nibbles into low position
    vpsrlw     $4, %zmm0, %zmm3           #
    vpandq     %zmm1, %zmm3, %zmm3        # zmm3 = [0C, 0A, 08...]

    # 5. Generate ASCII bias ('0' = 0x30)
    # 0x30 is binary 0011 0000. We can build this from our 0x0F.
    vpsllw     $2, %zmm1, %zmm4           # 0x0F << 2 = 0x3C
    vpandn     %zmm1, %zmm4, %zmm4        # (NOT 0x0F) AND 0x3C = 0x30
    # Alternatively: vpbroadcastb with 0x30 in EAX

    # 6. Convert Raw Digits to ASCII Characters
    # 'ASCII' = digit + 0x30
    vpaddb     %zmm4, %zmm2, %zmm2        # zmm2 now contains low ASCII characters
    vpaddb     %zmm4, %zmm3, %zmm3        # zmm3 now contains high ASCII characters

    # 7. Interleave HIGH and LOW Digits
    # Packed BCD [HL][HL] becomes ASCII [H][L][H][L]
    vpunpcklbw %zmm2, %zmm3, %zmm5        # Interleave lower 64 bytes
    vpunpckhbw %zmm2, %zmm3, %zmm6        # Interleave upper 64 bytes

    # 8. Store 128 bytes of ASCII result to memory
    vmovdqu8   %zmm5, (%rsi)              # Store first 64 bytes
    vmovdqu8   %zmm6, 64(%rsi)            # Store remaining 64 bytes

    vzeroupper
    ret
