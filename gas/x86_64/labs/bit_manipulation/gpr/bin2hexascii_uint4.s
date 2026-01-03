# -----------------------------------------------------------------------------
# Name:        hexascii2bin_uint4
# Logic:       Branchless ASCII-to-Binary (The "Magic 0x07" adjustment)
# Description: Converts one ASCII hex char ('0'-'9', 'A'-'F') to 4-bit binary.
# Input:       DIL (ASCII character)
# Output:      AL  (Binary value 0-15)
# -----------------------------------------------------------------------------

.global hexascii2bin_uint4

hexascii2bin_uint4:
    mov     %dil, %al
    
    # 1. Strip the ASCII "High bits" 
    # '0' (0x30) becomes 0, 'A' (0x41) becomes 1, 'a' (0x61) becomes 1
    sub     $0x30, %al      
    
    # 2. The "Surprise" Adjustment
    # If the result is > 9, it means it was a letter.
    # We need to subtract 7 more to bridge the gap between '9' (0x39) and 'A' (0x41).
    cmp     $10, %al        # Set carry if AL < 10
    sbb     $0xFF, %ah      # This is a "Dummy" to set up the mask
    
    # --- The True Hacker's Way (No branches) ---
    mov     %al, %dl
    sub     $10, %dl        # If AL was 0-9, DL becomes negative (High bit set)
    sar     $7, %dl         # DL becomes 0xFF if AL was 0-9, 0x00 if AL was 10+
    not     %dl             # DL becomes 0x00 if AL was 0-9, 0xFF if AL was 10+
    and     $7, %dl         # DL is 7 only if it was a letter
    sub     %dl, %al        # Final result 0-15
    
    and     $0x0F, %al      # Clean the nibble
    ret
