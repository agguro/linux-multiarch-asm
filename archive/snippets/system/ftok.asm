; name        : ftok.asm (Aligned, Thread-Safe, & PIE-Proof)
; logic       : key = ((st_ino & 0xffff) | ((st_dev & 0xff) << 16) | ((proj_id & 0xff) << 24))
; description : This is the assembler version of the c/c++ function ftok.
;               the type key_t is actually just a LONG, you can use any number you want.
;               the ftok() function which a key from two arguments:
;               key_t ftok(const char *path, int id);
; source      : http://beej.us/guide/bgipc/output/html/multipage/mq.html 
; build       : release: nasm -f elf64 -I ../../../includes -o ftok.o ftok.asm
;               debug  : nasm -f elf64 -I ../../../includes -g -Fdwarf -o ftok.debug.o ftok.asm




bits 64

[list -]
    %include "unistd.inc"
    %include "sys/stat.inc"
[list +]

global ftok

section .text

ftok:
    push    rbp
    mov     rbp, rsp
    push    rbx
    push    r8

    ; --- Calculate Aligned Stack Space ---
    ; Formula: (Size + 15) & ~15
    %assign ALIGNED_STAT (STAT_STRUC_size + 15) & ~15
    
    sub     rsp, ALIGNED_STAT           ; Allocate aligned space on stack
    mov     r8, rsi                     ; Save project ID
    mov     rsi, rsp                    ; RSI points to our aligned stack buffer

    ; 1. open(path, O_RDONLY)
    ; RDI is already path from caller
    mov     rax, 2                      ; syscall: open
    xor     rsi, rsi                    ; O_RDONLY = 0
    syscall
    and     rax, rax
    js      .error                      ; Handle error

    ; 2. fstat(fd, stat_buf)
    mov     rdi, rax                    ; RDI = file descriptor
    mov     rsi, rsp                    ; RSI = stack buffer
    mov     rax, 5                      ; syscall: fstat
    syscall
    
    ; Save fstat result and close file
    push    rax
    mov     rax, 3                      ; syscall: close
    syscall
    pop     rax

    and     rax, rax
    js      .error

    ; --- 3. Calculate Key from Aligned Stack Buffer ---
    ; key = ((st_ino & 0xffff) | ((st_dev & 0xff) << 16) | ((proj_id & 0xff) << 24))
    mov     rax, qword [rsp + STAT_STRUC.st_ino] ; Get inode
    and     rax, 0xFFFF                          ; Mask 16 bits
    
    mov     rbx, qword [rsp + STAT_STRUC.st_dev] ; Get device ID
    and     rbx, 0xFF                            ; Mask 8 bits
    shl     rbx, 16                              ; Shift to position
    or      rax, rbx                             ; Combine
    
    and     r8, 0xFF                             ; project id mask
    shl     r8, 24                               ; Shift to position
    or      rax, r8                              ; Final key
    jmp     .done

.error:
    ; RAX contains negative errno from syscall

.done:
    mov     rsp, rbp                    ; Balanced stack cleanup
    pop     rbp
    ret
    
section .note.GNU-stack noalloc noexec nowrite progbits
