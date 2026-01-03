# -----------------------------------------------------------------------------
# Name:        hacker_nibble2hexascii
# Author:      Hacker's Delight Style (Henry S. Warren Jr. inspiration)
# Description: Converts a 64-bit GPR to 16 Hex-ASCII characters.
# Logic:       Branchless SBB trick (no lookup table, no memory access).
# C Prototype: extern "C" void hacker_nibble2hex(uint64_t val, char* buf);
# -----------------------------------------------------------------------------

.section .text
.global hacker_nibble2hexascii

hacker_nibble2hexascii:
    # RDI = input value (64-bit)
    # RSI = destination buffer (must be at least 16 bytes)
    
    mov     $16, %rcx           # Counter: 16 nibbles in a 64-bit GPR

.loop:
    rol     $4, %rdi            # Rotate left by 4 bits (brings top nibble to bottom)
    mov     %dil, %al           # Copy the lower byte (containing our nibble) to AL
    and     $0x0F, %al          # Mask: AL now contains only the 4-bit nibble (0-15)

    # --- The Hacker's Delight Branchless "Magic" ---
    cmp     $10, %al            # If AL < 10, Carry Flag (CF) = 1
    sbb     $0x69, %al          # AL = AL - 0x69 - CF
    and     $0x1F, %al          # AL = AL & 0x1F
    add     $0x20, %al          # AL = ASCII character ('0'-'9' or 'A'-'F')
    # -----------------------------------------------

    mov     %al, (%rsi)         # Store the ASCII byte into the buffer
    inc     %rsi                # Increment buffer pointer
    loop    .loop               # Repeat until RCX is 0

    ret
