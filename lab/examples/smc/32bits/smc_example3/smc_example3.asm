;name: smc_example2.asm - second example
;
;build: /usr/bin/nasm -felf32 -o smc_example2.o smc_example2.asm
;       ld -melf_i386 -o smc_example2 smc_example2.o
;
;source: https://asm.sourceforge.net/articles/smc.html
;        Using self modifying code under Linux
;        written by Karsten Scheibler, 2004-AUG-09


bits 32                         ;don't forget or the assembler uses 64 bits syscalls
                                ;this is not by default however, it's because of the
                                ;include file unistd.inc
global _start


[list -]
    %include "unistd.inc"               ;for syscall write and stdout
    %include "asm-generic/mman.inc"     ;for PROT_READ,PROT_WRITE and PROT_EXEC  
[list +]

section .bss
align 4

    modified_code:  resb    0x2000

section .data
align 4    

    hex:
    .text:              db  "ebx: "
    .number:            db  "00h", 10
    .len:               equ $-hex
    
    mprotecterror:      db  "syscall mprotect error", 10
    .len:               equ $-mprotecterror
    
    function_pointer:   dd    write_hex
    next:               dd   smc_start.cont
    
section .text
_start:

smc_start:

    ;execute unmodified code first
    mov     ebx, 5
    inc     dword ebx
    inc     dword ebx
    inc     dword ebx
    inc     dword ebx
    inc     dword ebx
    inc     dword ebx
    inc     dword ebx
    inc     dword ebx
    call    dword [function_pointer]
.next:    
    jmp     dword [next]
    
    ;allow us to write to section .text
.cont:
    mov     dword ebx, smc_start
    and     dword ebx, 0xfffff000
    syscall mprotect,ebx,0x2000,PROT_READ | PROT_WRITE | PROT_EXEC
    test    dword eax, eax
    js      near smc_error

    ;mofify the original code
    mov     dword edi, smc_start
    mov     byte  al, [no_operation]
    mov     dword ecx, 0x0A
    rep     stosb
    ;modify the 'next' routine
    mov     dword [next],smc_end
    
    jmp     smc_start

write_hex:
    mov     byte bh, bl
    shr     byte bl, 4
    add     byte bl, 0x30
    cmp     byte bl, 0x3a
    jb      short .number_1
    add     byte bl, 0x07
.number_1:
    mov     byte [hex.number], bl
    and     byte bh, 0x0f
    add     byte bh, 0x30
    cmp     byte bh, 0x3a
    jb      short .number_2
    add     byte bh, 0x07
.number_2:
    mov     byte [hex.number + 1], bh

    syscall write, stdout, hex.text,hex.len
    ret

smc_error:
    ;added to source
    syscall write,stdout,mprotecterror,mprotecterror.len
    syscall exit,1

smc_end:
    
    syscall exit,0
    
.len:   equ   $-smc_end

no_operation:
    nop

;*********************************************** linuxassembly@unusedino.de *
