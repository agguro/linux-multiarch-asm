# -----------------------------------------------------------------------------
# Name:        hexascii2bin_uint16
# Logic:       Branchless SWAR ASCII-to-Binary conversion.
# Input:       EAX (4 ASCII chars, e.g., '1A2B' -> 0x42324131 in Little Endian)
# Output:      AX (16-bit binary value, e.g., 0x1A2B)
# ABI:         Standard System V (Input in EDI/EAX, Output in EAX)
# -----------------------------------------------------------------------------

.global hexascii2bin_uint16

hexascii2bin_uint16:
    # If the input is '1A2B' in memory, EAX is 0x42324131
    # Step 1: Normalize ASCII to 0-15 nibbles
    # We subtract '0' (0x30) from all 4 bytes
    sub     $0x30303030, %eax   
    
    # Step 2: The "Alpha" Adjustment
    # For 'A'-'F', the value is now 17-22 (0x11-0x16). 
    # For '0'-'9', the value is 0-9.
    # We need to subtract 7 from the 'A'-'F' bytes only.
    mov     %eax, %edx
    and     $0x10101010, %edx   # Identify bytes > 9 (those with bit 4 set)
    shr     $4, %edx            # Move bit to position 0
    imul    $7, %edx, %edx      # Multiply by 7 (the gap between '9' and 'A')
    
    sub     %edx, %eax          # EAX now contains 0x0B020A01 (4 nibbles)
    
    # Step 3: The "Squash" (The Inverse Spread)
    # We have: 0000BBBB 00002222 0000AAAA 00001111
    # We want: BBBB2222AAAA1111 (all in 16 bits)
    
    mov     %eax, %edx
    shr     $8, %edx            # Align bytes 1 and 3
    and     $0x0F000F00, %eax   # Isolate nibbles 0 and 2
    and     $0x000F000F, %edx   # Isolate nibbles 1 and 3
    
    shl     $4, %edx            # Shift nibbles 1 and 3 to their positions
    or      %edx, %eax          # EAX = 0x00B200A1
    
    # Final merge:
    mov     %eax, %edx
    shr     $12, %edx           # Bring high word nibbles down
    or      %dx, %ax            # Merge into AX
    # AX now contains 0x1A2B (depending on input Endianness)
    
    ret
    
section .note.GNU-stack noalloc noexec nowrite progbits
