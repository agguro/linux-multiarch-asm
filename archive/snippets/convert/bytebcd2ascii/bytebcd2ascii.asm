; name: bytebcd2ascii.asm
;
; version: 2.0 (Refined & Optimized)
; description: Converts packed BCD in RDI to ASCII in RAX.
; improvements:
;   - Fully ABI compliant (Input RDI, Output RAX).
;   - Uses clear masking for better maintainability.
;   - Clears upper RAX bits to prevent "garbage" data in the return value.
;
; build: release: nasm -felf64 bytebcd2ascii.asm -o bytebcd2ascii.o
;      : debug:   nasm -felf64 -g -F dwarf bytebcd2ascii.asm -o bytebcd2ascii.debug.o

bits 64

global bytebcd2ascii

section .text

bytebcd2ascii:
    ; Input:  DIL (e.g., 0x42)
    ; Output: RAX (AX = 0x3432, which is '4' and '2')

    movzx   eax, dil        ; Move input to EAX and zero-extend
    mov     edx, eax        ; Copy to EDX for the second nibble

    ; --- High Nibble ---
    shr     al, 4           ; Isolate high nibble (0x04)
    add     al, '0'         ; Convert to ASCII (0x34)
    shl     eax, 8          ; Move to AH position

    ; --- Low Nibble ---
    and     dl, 0x0F        ; Isolate low nibble (0x02)
    add     dl, '0'         ; Convert to ASCII (0x32)
    
    ; --- Combine ---
    or      al, dl          ; Combine AH and AL
    ; EAX now contains 0x3432
    ret
