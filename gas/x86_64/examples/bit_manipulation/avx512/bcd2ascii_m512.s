# name        : bcd2ascii_m512i.s
# description : Convert 64 bytes packed BCD -> 128 bytes ASCII
# C calling   : extern "C" void bcd2ascii_m512i(void *src, char *dest);
# Requires    : AVX-512F and AVX-512BW

.section .text
.globl bcd2ascii_m512i
.type bcd2ascii_m512i, @function
.align 64

bcd2ascii_m512i:
    # rdi = source BCD (64 bytes), rsi = dest ASCII (128 bytes)

    # 1. Load 64 bytes of packed BCD
    vmovdqu8 (%rdi), %zmm0

    # 2. Create nibble mask (0x0F)
    vpcmpeqb %zmm1, %zmm1, %zmm1    # zmm1 = 0xFF
    vpsrlw   $4, %zmm1, %zmm1       # zmm1 = 0x0F in every byte

    # 3. Extract LOW nibbles
    vpandd   %zmm1, %zmm0, %zmm2    # zmm2 = Low nibbles

    # 4. Extract HIGH nibbles
    vpsrlw   $4, %zmm0, %zmm3       # Shift right 4 bits
    vpandd   %zmm1, %zmm3, %zmm3    # zmm3 = High nibbles

    # 5. Create ASCII bias ('0' = 0x30)
    movl     $0x30, %eax
    vpbroadcastb %eax, %zmm4        # Spread 0x30 across all 64 bytes

    # 6. Convert digits -> ASCII
    vpaddb   %zmm4, %zmm2, %zmm2
    vpaddb   %zmm4, %zmm3, %zmm3

    # 7. Interleave HIGH / LOW digits
    # vpunpcklbw/hbw work within 128-bit lanes in AVX2, 
    # but in AVX-512 they process the full register width.
    vpunpcklbw %zmm2, %zmm3, %zmm5  # Interleave low-order bytes
    vpunpckhbw %zmm2, %zmm3, %zmm6  # Interleave high-order bytes

    # 8. Store 128 bytes of results
    vmovdqu8 %zmm5, (%rsi)          # Bytes 0-63
    vmovdqu8 %zmm6, 64(%rsi)        # Bytes 64-127

    vzeroupper
    ret

section .note.GNU-stack noalloc noexec nowrite progbits

.section .note.GNU-stack,"",@progbits
