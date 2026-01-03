# -----------------------------------------------------------------------------
# Name:        bin2hexascii_uint4
# Logic:       The "Magic 0x69" Subtract-with-Borrow trick.
# Description: Pure branchless conversion of 4-bits to 1-byte ASCII.
# Input:       DIL (low 4 bits used)
# Output:      AL  (ASCII character '0'-'F')
# -----------------------------------------------------------------------------

.global bin2hexascii_uint4

bin2hexascii_uint4:
    mov     %dil, %al
    and     $0x0F, %al      # Isolate nibble (0-15)

    # --- The Hacker's Delight Pearl ---
    cmp     $10, %al        # Sets Carry Flag (CF=1) if AL < 10
    sbb     $0x69, %al      # AL = AL - 0x69 - CF
    and     $0x1F, %al      # Magic mask
    add     $0x20, %al      # Final offset
    # ----------------------------------

    ret
