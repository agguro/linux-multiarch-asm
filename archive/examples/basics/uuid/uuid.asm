; name        : uuid.asm
; description : Generates a UUID using a contiguous pre-formatted buffer (PIC)
; build       : release: nasm -f elf64 -I ../../../includes -o uuid.o uuid.asm
;                        ld -m elf_x86_64 -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o uuid uuid.o
;               debug  : nasm -f elf64 -I ../../../includes -g -Fdwarf -o uuid.debug.o uuid.asm
;                        ld -m elf_x86_64 -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o uuid.debug uuid.debug.o

bits 64

[list -]
    %include "unistd.inc"
[list +]

section .data
    ; The most economic way: the hyphens are "baked" into the binary image
    uuid_str:
    .g1:      times 8 db 0
              db '-'
    .g2:      times 4 db 0
              db '-'
    .g3:      times 4 db 0
              db '-'
    .g4:      times 4 db 0
              db '-'
    .g5:      times 12 db 0
    .eol:     db 10        ; Newline (LF)
    .len:     equ $ - uuid_str

section .text
    global _start

_start:
    ; Fill Group 1 (8 chars)
    lea     rdi, [rel uuid_str.g1]
    mov     rcx, 8
    call    fill_group

    ; Fill Group 2 (4 chars)
    lea     rdi, [rel uuid_str.g2]
    mov     rcx, 4
    call    fill_group

    ; Fill Group 3 (4 chars)
    lea     rdi, [rel uuid_str.g3]
    mov     rcx, 4
    call    fill_group

    ; Fill Group 4 (4 chars)
    lea     rdi, [rel uuid_str.g4]
    mov     rcx, 4
    call    fill_group

    ; Fill Group 5 (12 chars)
    lea     rdi, [rel uuid_str.g5]
    mov     rcx, 12
    call    fill_group

    ; Single system call to print the entire formatted result
    lea     rsi, [rel uuid_str]
    mov     rdx, uuid_str.len
    syscall write, stdout, rsi, rdx
    
    syscall exit, 0

; --- Subroutines ---

fill_group:
    ; In: RDI = pointer to group, RCX = number of nibbles to fill
.loop:
    call    GenerateRandomNibble   ; returns ASCII hex in AL
    stosb                          ; store AL at RDI and inc RDI
    loop    .loop
    ret

GenerateRandomNibble:
    rdtsc                          ; read timestamp counter (EDX:EAX)
    shl     rdx, 32
    or      rax, rdx               ; create 64-bit seed
    call    XorShift               ; scramble the bits
    and     rax, 0x0F              ; mask to get 0-15
    
    ; Convert to ASCII Hex
    add     al, '0'
    cmp     al, '9'
    jbe     .done
    add     al, 39                 ; Jump to 'a' range (39 + 1 + '9' = 'a')
.done:
    ret

XorShift:
    ; Fast 64-bit pseudo-random number generator
    mov     rdx, rax
    shl     rax, 13
    xor     rax, rdx
    mov     rdx, rax
    shr     rax, 17
    xor     rax, rdx
    mov     rdx, rax
    shl     rax, 5
    xor     rax, rdx
    ret
