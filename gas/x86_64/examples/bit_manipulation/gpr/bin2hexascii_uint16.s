; --- 16-bit Word to Hex-ASCII (Hacker's Delight SWAR Style) ---
; C Prototype: extern "C" uint32_t bin2hexascii_uint16(uint16_t val);
; Input:  DI  (16-bit word)
; Output: EAX (4 ASCII bytes in Big-Endian order)

global bin2hexascii_uint16
bin2hexascii_uint16:
rol     $8, %di             # Swap bytes: 0x1234 -> 0x3412
    movzx   %di, %eax           # EAX = 0x00003412
    
    # --- Spread Logic (Optimized for Order) ---
    # Goal: EAX = 0x01020304
    mov     %eax, %edx
    shl     $4, %eax            # EAX = 0x00034120
    and     $0x0F000F00, %eax   # Isolate nibbles in bytes 1 and 3
    
    and     $0x000F000F, %edx   # Isolate nibbles in bytes 0 and 2
    shl     $12, %edx           # Shift them into bytes 1 and 3 positions
    
    or      %edx, %eax          # EAX now contains the 4 nibbles spaced out
    # Note: Depending on your specific spread, the order is now 
    # ready for the "Surprise" math without a final BSWAP.

    # --- Your "Surprise" Math ---
    mov     %eax, %edx
    add     $0x06060606, %edx
    and     $0x10101010, %edx
    shr     $4, %edx
    imul    $7, %edx, %edx
    
    add     $0x30303030, %eax
    add     %edx, %eax          # Result is in EAX
    ret
    
section .note.GNU-stack noalloc noexec nowrite progbits
