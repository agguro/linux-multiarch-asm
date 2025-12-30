# ------------------------------------------------------------------------------
# File: bin2hexascii_sse_m128i.s
# Description: 128-bit Binary -> 32-byte Hex-ASCII
# Strategy: Arithmetic Branchless (SSE / No Memory Loads / PIE)
# ------------------------------------------------------------------------------

.section .text
.globl bin2hex_xmm_128
.type bin2hex_xmm_128, @function
.align 16

bin2hex_xmm_128:
    # Input:  RDI = Source (128-bit binary / 16 bytes)
    # Output: RSI = Destination (32 bytes Hex-ASCII)

    # --- 1. Load Data ---
    movdqu (%rdi), %xmm0             # Load 128 bits

    # --- 2. Generate Constants in Registers (No .rodata) ---
    # Generate 0x0F Mask
    pcmpeqd %xmm9, %xmm9             # All 1s
    psrlw   $4, %xmm9                # Now 0x0FFF in words
    # To get 0x0F in bytes, we need to mask it
    movq    $0x0F0F0F0F0F0F0F0F, %rax
    movq    %rax, %xmm8
    punpcklqdq %xmm8, %xmm8          # xmm8 = 0x0F in every byte

    # Threshold 9
    movq    $0x0909090909090909, %rax
    movq    %rax, %xmm7
    punpcklqdq %xmm7, %xmm7          # xmm7 = 9 in every byte

    # ASCII '0' (0x30)
    movq    $0x3030303030303030, %rax
    movq    %rax, %xmm6
    punpcklqdq %xmm6, %xmm6          # xmm6 = 0x30 in every byte

    # Adjustment 7
    movq    $0x0707070707070707, %rax
    movq    %rax, %xmm5
    punpcklqdq %xmm5, %xmm5          # xmm5 = 7 in every byte

    # --- 3. Isolate Nibbles ---
    movdqa  %xmm0, %xmm1
    psrlw   $4, %xmm1                # Shift for High Nibbles
    pand    %xmm8, %xmm0             # xmm0 = Low Nibbles
    pand    %xmm8, %xmm1             # xmm1 = High Nibbles

    # --- 4. Branchless Hex Logic ---
    movdqa  %xmm0, %xmm2
    movdqa  %xmm1, %xmm3
    
    pcmpgtb %xmm7, %xmm2             # xmm2 = 0xFF where LowNibble > 9
    pcmpgtb %xmm7, %xmm3             # xmm3 = 0xFF where HighNibble > 9

    paddb   %xmm6, %xmm0             # Add '0' (0x30)
    paddb   %xmm6, %xmm1

    pand    %xmm5, %xmm2             # Filter adjustment: 7 or 0
    pand    %xmm5, %xmm3
    
    paddb   %xmm2, %xmm0             # Final Add
    paddb   %xmm3, %xmm1

    # --- 5. Interleave High/Low Nibbles ---
    movdqa  %xmm1, %xmm4
    punpcklbw %xmm0, %xmm4           # First 16 characters
    movdqa  %xmm1, %xmm5
    punpckhbw %xmm0, %xmm5           # Next 16 characters

    # --- 6. Store ---
    movdqu  %xmm4, (%rsi)
    movdqu  %xmm5, 16(%rsi)

    ret

.section .note.GNU-stack,"",@progbits
