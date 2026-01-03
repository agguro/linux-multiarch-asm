# -----------------------------------------------------------------------------
# Name:        hexascii2bin_uint8
# Logic:       Branchless SWAR ASCII-to-Binary (The "Magic 7" Inverse)
# Input:       AX (2 ASCII chars, e.g., '4F' -> AH='4', AL='F')
# Output:      AL (1-byte binary value, e.g., 0x4F)
# -----------------------------------------------------------------------------

.global hexascii2bin_uint8

hexascii2bin_uint8:
    # Example: AX = 0x3446 (AH='4', AL='F')
    
    # Step 1: Normalize ASCII to 0-15 nibbles
    # Subtract '0' (0x30) from both bytes in AX simultaneously
    sub     $0x3030, %ax        # AX = 0x0416 (Note: 'F' was 0x46, now 0x16)

    # Step 2: The Parallel Alpha Adjustment
    # For digits '0'-'9', the value is 0-9.
    # For letters 'A'-'F', the value is 17-22 (0x11-0x16). 
    # We must subtract 7 from the bytes that are > 9.
    mov     %eax, %edx
    and     $0x1010, %edx       # Identify bytes with bit 4 set (the letters)
    shr     $4, %edx            # Move bit 4 to bit 0
    
    # Multiply mask by 7 (gap between '9' and 'A')
    lea     (%rdx, %rdx, 2), %ecx 
    lea     (%rdx, %rcx, 2), %edx # EDX = mask * 7
    
    sub     %edx, %eax          # EAX = 0x040F (The nibbles are now correct!)

    # Step 3: The "Squash"
    # We have 0x04 in AH and 0x0F in AL.
    # We need to move the High Nibble (AH) left by 4 and OR it with AL.
    shl     $4, %ah             # AH = 0x40
    or      %ah, %al            # AL = 0x4F
    
    # Result is in AL
    ret
