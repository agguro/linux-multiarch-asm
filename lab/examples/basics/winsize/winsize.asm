; name        : winsize.asm
; description : Shows terminal dimensions
; build       : release: nasm -f elf64  -I ../../../includes winsize.asm -o winsize.o
;                        ld -m elf_x86_64 -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o winsize winsize.o
;               debug  : nasm -f elf64 -I ../../../includes -g -Fdwarf -o winsize.debug.o winsize.asm
;                        ld -m elf_x86_64 -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o winsize.debug winsize.debug.o

bits 64

%include "unistd.inc"
%include "sys/termios.inc"

section .bss
    buffer:    resb 16              ; Space for digits
    .end:
    lf:        resb 1
    winsize:   resb WINSIZE_STRUC_size
    
section .data
    array:      db  "rows    : "
                db  "columns : "
                db  "xpixels : "
                db  "ypixels : "
    .length:    equ $ - array
    .items:     equ 4
    .itemsize:  equ array.length / array.items
    
section .text
    global _start
_start:
    ; Initialize line feed
    lea     rax, [rel lf]
    mov     byte [rax], 10
    
    ; 1. Get terminal size
    lea     rdx, [rel winsize]
    syscall ioctl, stdout, TIOCGWINSZ, rdx

    ; 2. Initialize Pointers
    lea     r13, [rel array]            ; r13 = Label pointer (Callee-saved)
    lea     r14, [rel winsize]          ; r14 = Struct pointer (Callee-saved)
    mov     r15, array.items            ; r15 = Loop counter (Callee-saved)
    
.nextVariable:    
    ; --- Print the Label ---
    mov     rsi, r13
    mov     rdx, array.itemsize
    syscall write, stdout, rsi, rdx

    ; --- Convert 16-bit Word to Decimal ---
    movzx   rax, word [r14]             ; Load current dimension
    lea     rdi, [rel buffer.end]       ; Point to end of buffer
    dec     rdi
    mov     ebx, 10                     ; Divisor (32-bit is safer)
    
.repeat:    
    xor     edx, edx                    ; Zero EDX before every DIV
    div     ebx                         ; EAX / 10 -> EAX (quot), EDX (rem)
    add     dl, "0"                     ; Convert remainder to ASCII
    mov     [rdi], dl
    dec     rdi
    test    eax, eax
    jnz     .repeat
    
    ; --- Print the Digits ---
    inc     rdi                         ; Adjust pointer to first digit
    mov     rsi, rdi                    ; RSI = start of string
    lea     rax, [rel buffer.end]       ; RAX = end of string
    mov     rdx, rax
    sub     rdx, rsi                    ; RDX = length (end - start)
    syscall write, stdout, rsi, rdx
    
    ; --- Print Line Feed ---
    lea     rsi, [rel lf]
    syscall write, stdout, rsi, 1
    
    ; --- Increment and Loop ---
    add     r14, 2                      ; Move to next word in struct
    add     r13, array.itemsize         ; Move to next label string
    dec     r15
    jnz     .nextVariable

    syscall exit, 0
