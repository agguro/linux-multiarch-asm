; name: bytebin2hexascii.asm
; version: 2.0 (Refined & Optimized)
; description: Further improved branch-free conversion of a byte in RDI to ASCII in RAX.
; algorithm: Branchless Mapping
; improvements:
;   - Fully System V ABI compliant (uses RDI for input, RAX for output).
;   - Removed redundant PUSH/POP operations for better performance.
;   - Replaced multi-step arithmetic with SETge/LEA for cleaner branch-less logic.
;   - Optimized for modern x86-64 pipelines by reducing instruction dependencies.
;
; build: release: nasm -felf64 bytebcd2ascii.asm -o bytebcd2ascii.o
;      : debug:   nasm -felf64 -g -F dwarf bytebcd2ascii.asm -o bytebcd2ascii.debug.o

bits 64

global bytebin2hexascii

bytebin2hexascii:
    ; Input:  DIL (1st argument per ABI)
    ; Output: RAX (AH = high nibble char, AL = low nibble char)

    movzx   edx, dil        ; Copy input byte to EDX
    mov     eax, edx        
    
    shr     al, 4           ; Isolate high nibble in AL
    and     dl, 0x0F        ; Isolate low nibble in DL

    ; --- Process High Nibble ---
    cmp     al, 10          ; Check if nibble is 0-9 or A-F
    lea     ecx, [rax + 0x30] ; Base: nibble + '0'
    setge   al              ; AL = 1 if nibble >= 10, else 0
    movzx   eax, al
    lea     eax, [ecx + eax*7] ; If A-F, add 7 to jump from 0x39 to 0x41
    shl     eax, 8          ; Position high nibble character in AH

    ; --- Process Low Nibble ---
    cmp     dl, 10          ; Check if nibble is 0-9 or A-F
    lea     esi, [edx + 0x30] ; Base: nibble + '0'
    setge   dl              ; DL = 1 if nibble >= 10
    movzx   edx, dl
    lea     edx, [esi + edx*7] ; If A-F, add 7

    ; --- Result ---
    or      al, dl          ; Combine results into EAX
    ret
