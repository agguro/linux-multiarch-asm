; name: bytebcd2bin.asm
;
; version: 2.0 (Refined & Optimized)
; description: Highly efficient packed BCD to Binary conversion.
; improvements:
;   - Branch-free and Loop-free (much faster).
;   - Follows System V ABI (Input RDI, Output RAX).
;   - Uses the (Tens * 10 + Units) method which is standard for performance.
;
; build: release: nasm -felf64 bytebcd2bin.asm -o bytebcd2bin.o
;      : debug:   nasm -felf64 -g -F dwarf bytebcd2bin.asm -o bytebcd2bin.debug.o

bits 64

global bytebcd2bin

section .text

bytebcd2bin:
    ; Input:  DIL (e.g., 0x25)
    ; Output: RAX (e.g., 0x19 which is 25 decimal)

    movzx   eax, dil        ; Move input to EAX, clear upper bits
    mov     edx, eax        ; Copy to EDX
    
    ; 1. Isolate the "Units" (low nibble)
    and     eax, 0x0F       ; EAX = 0x05
    
    ; 2. Isolate the "Tens" (high nibble)
    shr     edx, 4          ; EDX = 0x02
    
    ; 3. Binary = (Tens * 10) + Units
    ; Using LEA and SHL is faster than the MUL instruction
    lea     edx, [rdx + rdx*4] ; EDX = Tens * 5
    shl     edx, 1             ; EDX = Tens * 10
    
    add     eax, edx        ; EAX = (Tens * 10) + Units
    
    ; Result is now in RAX (specifically AL)
    ret
