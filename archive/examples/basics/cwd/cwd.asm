; name        : cwd.asm
; description : Linux alternative for pwd.
; build       : release: nasm -f elf64  -I ../../../includes cwd.asm -o cwd.o
;                        ld -m elf_x86_64 -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o cwd cwd.o
;               debug  : nasm -f elf64 -I ../../../includes -g -Fdwarf -o cwd.debug.o cwd.asm
;                        ld -m elf_x86_64 -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o cwd.debug *.o

bits 64

[list -]
    %include "unistd.inc"
[list +]

section .data
    string:
    .noMemory:  db "Error: out of memory"
    .lf:        db 10
    .length:    equ $ - .noMemory
      
section .text
    global _start       
_start:
    ; --- Get current program break ---
    xor     rdi, rdi                    ; RDI = 0 returns current break
    syscall brk
    test    rax, rax
    js      error                       ; If RAX < 0, something is wrong
    
    mov     r8, rax                     ; R8 = start of our heap allocation
    mov     r9, rax                     ; R9 = current break tracking

repeat:
    ; Increment break by 16 bytes each time
    lea     rdi, [r9 + 16]
    syscall brk
    
    ; If the return value is the same as requested, allocation succeeded
    cmp     rax, rdi
    jne     error_cleanup               ; If they don't match, we hit a memory limit
    
    mov     r9, rax                     ; Update current break tracker

getcwd:
    mov     rsi, r9
    sub     rsi, r8                     ; RSI = size (Current Break - Start Break)
    mov     rdi, r8                     ; RDI = pointer to buffer (start of heap)
    syscall getcwd
    
    test    rax, rax
    jns     printit                     ; Success returns length in RAX
    
    ; If getcwd returns error, buffer was too small, grow heap and retry
    jmp     repeat

printit:        
    mov     rdx, rax                    ; RDX = length returned by getcwd
    syscall write, stdout, r8, rdx      ; R8 is our buffer address
    
    ; PIC: access linefeed relative to RIP
    lea     rsi, [rel string.lf]
    syscall write, stdout, rsi, 1
    jmp     exit    

error_cleanup:
    ; Free the memory already allocated by resetting break to original start
    mov     rdi, r8
    syscall brk

error:
    ; PIC: access error string relative to RIP
    lea     rsi, [rel string.noMemory]
    syscall write, stderr, rsi, string.length

exit:
    syscall exit, 0
