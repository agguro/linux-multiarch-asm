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
    
    endless_loop:       db  "No endless loop here!", 10
    .len:               equ $-endless_loop

    mprotecterror:      db  "syscall mprotect error", 10
    .len:               equ $-mprotecterror
    
    function_pointer:   dd    write_hex

section .text
_start:

smc_start:

    ;calculate the address in section .bss, it must lie on a page
    ;boundary (x86: 4KB = 0x1000)
    ;NOTE: In this example obsolete because each segment is page
    ;      aligned and we use it only once, so we know that it is
    ;      aligned to a page boundary, but if you have more than
    ;      one section .bss in your code (or link several objects
    ;      together) you can't be sure about that

    mov    dword ebp, (modified_code + 0x1000)
    and    dword ebp, 0xFFFFF000

    ;change flags of this page to read + write + executable,
    ;NOTE: On x86 Architecture this call is obsolete, because for
    ;      section .bss PROT_READ and PROT_WRITE are already set.
    ;      PROT_EXEC is on x86 also set if PROT_READ is set, this
    ;      results in rwx for this segment, but this behavior may
    ;      change with appearance of the NX-flag in modern processors

    syscall mprotect,ebp,0x1000,PROT_READ | PROT_WRITE | PROT_EXEC

    test    dword eax, eax
    js      near  smc_error

    ;execute unmodified code first
    ;copy second example

    mov     dword ecx, code2.len
    mov     dword esi, code2.start
    mov     dword edi, ebp
    rep     movsb

    ;do something real nasty: edi points right after the 'rep stosb'
    ;instruction, so this will really modify itself

    mov     dword edi, ebp
    add     dword edi, (code2.mark - code2.start)
    call    dword ebp

    ;modify code in section .text itself

endless:
    ;allow us to write to section .text

    mov     dword ebx, smc_start
    and     dword ebx, 0xfffff000
    syscall mprotect,ebx,0x2000,PROT_READ | PROT_WRITE | PROT_EXEC
    test    dword eax, eax
    js      near smc_error

    ;write message to screen

    syscall write, stdout, endless_loop, endless_loop.len

    ;here comes the magic, which prevents endless execution

    mov    dword ecx, smc_end.len
    mov    dword esi, smc_end
    mov    dword edi, endless
    rep    movsb                       ;do it again

    jmp    short endless

    ;here some real selfmodifying code, if copied
    ;to .bss and edi correctly loaded ebx should contain 0x4 instead
    ;of 0x8

code2:
    .start:
        mov     byte  al, [no_operation]
        xor     dword ebx, ebx
        mov     dword ecx, 0x04
        rep     stosb
    .mark:
        inc     dword ebx                           ;will be modified by NOP
        inc     dword ebx                           ;will be modified by NOP
        inc     dword ebx                           ;will be modified by NOP
        inc     dword ebx                           ;will be modified by NOP
        inc     dword ebx
        inc     dword ebx
        inc     dword ebx
        inc     dword ebx
        call    dword [function_pointer]
        ret
.len:   equ     $-code2.start

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
