; name: bytebin2bcd.asm
; algorithm: Double Dabble (Shift-and-Add-3)

; description: Binary byte to BCD (Packed and Unpacked).;
;
; improvements:
;   - Fully ABI compliant (Input RDI, Output RAX).
;   - Uses clear masking for better maintainability.
;   - Clears upper RAX bits to prevent "garbage" data in the return value.
;
; build: release: nasm -felf64 bytebin2bcd.asm -o bytebin2bcd.o
;      : debug:   nasm -felf64 -g -F dwarf bytebin2bcd.asm -o bytebin2bcd.debug.o

bits 64
global bytebin2bcd_packed
global bytebin2bcd_unpacked

bytebin2bcd_unpacked:
    call    bytebin2bcd_packed
    shl     rax, 8              ; Prepare for unpacking
    ror     ax, 4
    ror     al, 4               ; RAX now holds unpacked bytes
    ret

bytebin2bcd_packed:
    push    rcx
    push    rdx
    mov     rax, rdi
    and     rax, 0xFF
    mov     cl, 5               ; Initialization for 8-bit conversion
    ror     rax, cl
.repeat:
    push    rcx
    mov     rdx, rax
    add     rdx, 0x33           ; Check if nibble needs adjustment
    and     rdx, 0x88
    shr     rdx, 3
    add     rax, rdx            ; Add 1
    shl     rdx, 1
    add     rax, rdx            ; Add 2 (Total 3 if >= 5)
    pop     rcx
    rol     rax, 1              ; Shift bit into BCD register
    loop    .repeat
    pop     rdx
    pop     rcx
    ret
