;name: smc_example1.asm - first example
;
;build: /usr/bin/nasm -felf64 -o smc_example1.o smc_example1.asm
;       ld -melf_x86_64 -o smc_example1 smc_example1.o
;
;source: https://asm.sourceforge.net/articles/smc.html
;        Using self modifying code under Linux
;        written by Karsten Scheibler, 2004-AUG-09
;        rewritten by agguro for 64 bits, 2023-OCT-21


bits 64                         ;don't forget or the assembler uses 64 bits syscalls
                                ;this is not by default however, it's because of the
                                ;include file unistd.inc
global _start


[list -]
    %include "unistd.inc"               ;for syscall write and stdout
    %include "asm-generic/mman.inc"     ;for PROT_READ,PROT_WRITE and PROT_EXEC  
[list +]

section .bss
align 4

    modified_code:      resb    0x2000

section .data
align 4    

    hex:
    .text:              db  "ebx: "
    .number:            db  "00h", 10
    .len:               equ $-hex
    
    endless_loop:       db  "No endless loop here!", 10
    .len:               equ $-endless_loop
    hello_world_1:      db  "Hello World!", 10
    .len:               equ $-hello_world_1
    hello_world_2:      db  "This code was modified!", 10
    .len:               equ $-hello_world_2

    mprotecterror:      db  "syscall mprotect error", 10
    .len:               equ $-mprotecterror
    
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

	mov     rbp, (modified_code + 0x1000)
	and     rbp, 0xFFFFFFFFFFFFF000

	;change flags of this page to read + write + executable,
	;NOTE: On x86 Architecture this call is obsolete, because for
	;      section .bss PROT_READ and PROT_WRITE are already set.
	;      PROT_EXEC is on x86 also set if PROT_READ is set, this
	;      results in rwx for this segment, but this behavior may
	;      change with appearance of the NX-flag in modern processors

	syscall mprotect,rbp,0x1000,PROT_READ | PROT_WRITE | PROT_EXEC

	test	rax, rax
	js  	smc_error

	;execute unmodified code first
	
code1:
    .start:
        mov 	rsi, hello_world_1
    .mark_1:
        mov 	rdx, hello_world_1.len
    .mark_2:
        syscall write, stdout
    .len:   equ $-code1
    
	;copy code snippet from above to our page (address is still in ebp)

	mov     rcx, code1.len
	mov 	rsi, code1.start
	mov     rdi, rbp
	cld
	rep     movsb

	;append 'ret' opcode to it, so that we can do a call to it

	mov 	al, byte[return]
	stosb

	;change start address and length of the text in the copied code

	mov	    rax, hello_world_2
	mov     rbx, (code1.mark_1 - code1.start)
	mov     [rbx + rbp - 8], rax
	mov     rax, hello_world_2.len
	mov     rbx, (code1.mark_2 - code1.start)
	mov     dword [rbx + rbp - 4], eax

	;finally call it

	call	rbp
	syscall exit,0

smc_error:
    ;added to source
    syscall write,stdout,mprotecterror,mprotecterror.len
    syscall exit,1
        
return:
	ret

;*********************************************** linuxassembly@unusedino.de *
    
