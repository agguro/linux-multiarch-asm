; name        : cpuid.asm
; description : Checks for CPUID support and shows Vendor ID
; build       : release: nasm -f elf64  -I ../../../includes cpuid.asm -o cpuid.o
;                        ld -m elf_x86_64 -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o cpuid cpuid.o
;               debug  : nasm -f elf64 -I ../../../includes -g -Fdwarf -o cpuid.debug.o cpuid.asm
;                        ld -m elf_x86_64 -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o cpuid.debug *.o

bits 64

[list -]
    %include "unistd.inc"
[list +]

section .rodata
    msg_prefix: db  "The processor Vendor ID is '"
    .len:       equ $ - msg_prefix
    
    msg_suffix: db  "'", 10
    .len:       equ $ - msg_suffix

    msg_error:  db  "CPUID is not supported", 10
    .len:       equ $ - msg_error

section .bss
    ; Reserve 12 bytes for the Vendor ID string (3 regs * 4 bytes)
    vendor_id:  resb 12

section .text
    global _start
_start:
    ; --- Step 1: Check for CPUID Support ---
    pushfq
    pop     rax
    mov     rcx, rax
    xor     rax, 0x200000
    push    rax
    popfq
    pushfq
    pop     rax
    xor     rax, rcx
    test    rax, 0x200000
    jz      .no_support

    ; --- Step 2: Get CPUID Data ---
    xor     eax, eax
    cpuid

    ; PIC: Get the address of our BSS buffer
    lea     rdi, [rel vendor_id]
    
    ; Store the 12-byte Vendor ID
    mov     [rdi], ebx                  ; Bytes 0-3
    mov     [rdi + 4], edx              ; Bytes 4-7
    mov     [rdi + 8], ecx              ; Bytes 8-11

    ; --- Step 3: Print in Sequence ---
    
    ; 1. Prefix
    lea     rsi, [rel msg_prefix]
    syscall write, stdout, rsi, msg_prefix.len
    
    ; 2. The Vendor ID (from BSS)
    lea     rsi, [rel vendor_id]
    syscall write, stdout, rsi, 12
    
    ; 3. Suffix
    lea     rsi, [rel msg_suffix]
    syscall write, stdout, rsi, msg_suffix.len

    syscall exit, 0

.no_support:
    lea     rsi, [rel msg_error]
    syscall write, stdout, rsi, msg_error.len
    syscall exit, 1
