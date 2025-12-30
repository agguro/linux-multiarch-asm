# -----------------------------------------------------------------------------
# Name:        bin2hexascii_uint8
# Logic:       Hacker's Parallel GPR Math (Zero branches, Zero IMUL)
# Input:       DIL (8-bit value, e.g., 0x4F)
# Output:      AX  (2 ASCII chars, e.g., '4' in AH, 'F' in AL -> 0x3446)
# -----------------------------------------------------------------------------

.global bin2hexascii_uint8

bin2hexascii_uint8:
    movzx   %dil, %eax          # EAX = 0x0000004F
    
    # --- The Spread ---
    mov     %eax, %edx
    shl     $4, %eax            # EAX = 0x000004F0
    and     $0x0F00, %eax       # EAX = 0x00000400 (High nibble in AH)
    and     $0x000F, %edx       # EDX = 0x0000000F (Low nibble in AL)
    or      %edx, %eax          # EAX = 0x0000040F (Ready for parallel math)

    # --- Parallel "Surprise" Math (Processes both nibbles at once) ---
    mov     %eax, %edx
    add     $0x0606, %edx       # Add 6 to each byte to check for A-F
    and     $0x1010, %edx       # Identify bytes > 9
    shr     $4, %edx            # Shift mask to bit 0 of each byte
    lea     (%rdx, %rdx, 2), %ecx # ECX = mask * 3
    lea     (%rdx, %rcx, 2), %edx # EDX = mask * 7 (Fastest way to multiply by 7)
    
    add     $0x3030, %eax       # Convert both to '0's
    add     %edx, %eax          # Final ASCII adjustment
    
    # EAX now has the characters in AH and AL.
    # Note: If you want '4' in AL and 'F' in AH, add: xchg %al, %ah
    ret
