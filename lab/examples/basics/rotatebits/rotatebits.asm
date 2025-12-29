; name        : rotatebits.asm
; description : rotate significant bits left (3 methods compared)
; build       : release: nasm -f elf64 -I ../../../includes -o rotatebits.o rotatebits.asm
;                        ld -m elf_x86_64 -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o rotatebits rotatebits.o
;               debug  : nasm -f elf64 -I ../../../includes -g -Fdwarf -o rotatebits.debug.o rotatebits.asm
;                        ld -m elf_x86_64 -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o rotatebits.debug rotatebits.debug.o

bits 64

[list -]
    %include "unistd.inc"
[list +]

; --- Manifest Constants ---
%define TEST_NUMBER  -10525    ; Change this once to update the whole demo

section .bss
    reg64:      resb    64

section .rodata
    msg:        db      0x0A
    header1:    db      "1. Manual (Hacker's Delight): ", 10
    header1.l:  equ     $ - header1
    header2:    db      "2. BSR (Architectural):       ", 10
    header2.l:  equ     $ - header2
    header3:    db      "3. LZCNT (Modern):           ", 10
    header3.l:  equ     $ - header3
    orig_msg:   db      "Original Value:               ", 10
    orig_msg.l: equ     $ - orig_msg
     
section .text
    global _start
_start:
    mov      rdi, TEST_NUMBER                ; The test value

    ; --- 0. Show Original Baseline ---
    lea      rsi, [rel orig_msg]
    mov      rdx, orig_msg.l
    call     Write
    mov      rdi, TEST_NUMBER
    call     bin2ascii
    call     PrintBuffer
    
    ; --- 1. Original Manual Method ---
    lea      rsi, [rel header1]
    mov      rdx, header1.l
    call     Write
    mov      rdi, TEST_NUMBER
    call     Rotatenbitsleft_Manual
    mov      rdi, rax
    call     bin2ascii
    call     PrintBuffer
    
    ; --- 2. BSR Method ---
    lea      rsi, [rel header2]
    mov      rdx, header2.l
    call     Write
    mov      rdi, TEST_NUMBER
    call     Rotatenbitsleft_BSR
    mov      rdi, rax
    call     bin2ascii
    call     PrintBuffer

    ; --- 3. LZCNT Method ---
    lea      rsi, [rel header3]
    mov      rdx, header3.l
    call     Write
    mov      rdi, TEST_NUMBER
    call     Rotatenbitsleft_LZCNT
    mov      rdi, rax
    call     bin2ascii
    call     PrintBuffer
    
    syscall exit, 0

; LOGIC EXPLANATION: "The Significant Window"
; 1. Identify the Most Significant Bit (MSB) that is set to 1.
; 2. Treat the bits from that 1 down to bit 0 as the "Active Window".
; 3. Perform a circular shift within that window:
;    Example (8-bit): 000[1100] (12) 
;    Rotate Window:   000[1001] (9)

Rotatenbitsleft_Manual:
    push     rdi
    call     NLZ_Manual                 ; Get leading zeros (the "padding")
    mov      rcx, rax                   ; Count of zeros to skip
    pop      rdi
    mov      rax, rdi
    
    ; The Magic 3-Step Rotation:
    rol      rax, cl                    ; Step A: Slide the padding out, MSB is now at bit 63
    rol      rax, 1                     ; Step B: Wrap bit 63 around to bit 0
    ror      rax, cl                    ; Step C: Slide the padding back to the front
    ret

NLZ_Manual:
    test      rdi, rdi
    jnz       .start
    mov       rax, 64
    ret
.start: 
    push      rbx
    push      rcx
    push      rdx
    mov       rax, rdi
    xor       rbx, rbx
    mov       rcx, 32
    mov       rdx, 0xFFFFFFFF00000000
.repeat:      
    test      rax, rdx
    jnz       .nozeros
    add       rbx, rcx
    shl       rax, cl
.nozeros:
    shr       rcx, 1
    shl       rdx, cl
    test      rcx, rcx
    jnz       .repeat
    mov       rax, rbx
    pop       rdx
    pop       rcx
    pop       rbx
    ret

Rotatenbitsleft_BSR:
    test     rdi, rdi
    jz       .zero
    bsr      rax, rdi
    mov      rcx, 63
    sub      rcx, rax
    mov      rax, rdi
    rol      rax, cl
    rol      rax, 1
    ror      rax, cl
    ret
.zero:
    xor      rax, rax
    ret

Rotatenbitsleft_LZCNT:
    lzcnt    rcx, rdi
    test     rcx, 64
    jnz      .zero
    mov      rax, rdi
    rol      rax, cl
    rol      rax, 1
    ror      rax, cl
    ret
.zero:
    xor      rax, rax
    ret

; UTILITIES (PIC)

bin2ascii:
    push     rax
    push     rcx
    push     rdi
    push     rdx
    mov      rax, rdi
    lea      rdi, [rel reg64]
    mov      rcx, 64
.loop:
    xor      dl, dl
    shl      rax, 1
    adc      dl, '0'
    mov      [rdi], dl
    inc      rdi
    loop     .loop
    pop      rdx
    pop      rdi
    pop      rcx
    pop      rax
    ret

PrintBuffer:
    lea      rsi, [rel reg64]
    mov      rdx, 64
    call     Write
    lea      rsi, [rel msg]
    mov      rdx, 1
    call     Write
    ret

Write:
    push    rcx
    push    r11
    syscall write, stdout, rsi, rdx
    pop     r11
    pop     rcx
    ret
