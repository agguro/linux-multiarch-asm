; name        : palindrome.asm
; description : Checks if a given string is a palindrome
; build       : release: nasm -f elf64  -I ../../../includes palindrome.asm -o palindrome.o
;                        ld -m elf_x86_64 -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o palindrome palindrome.o
;               debug  : nasm -f elf64 -I ../../../includes -g -Fdwarf -o palindrome.debug.o palindrome.asm
;                        ld -m elf_x86_64 -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o palindrome.debug *.o
; usage       : ./palindrome string1 string2 .... stringn

bits 64

[List -]
    %include "unistd.inc"
[list +]

section .bss

section .rodata
    usage:
    .start:     db  "Palindrome by agguro.",10
                db  "usage: palindrome string1 string2 ...",10
    .length:    equ $ - usage.start
    
    txt:
    .is:        db  " is "
    .islength:  equ $ - txt.is
    .no:        db  "not "
    .nolength:  equ $ - txt.no
    .yes:       db  "a palindrome.",10
    .yeslength: equ $ - txt.yes
    
section .text
    global _start
_start:
    pop     rcx                    ; argc in RCX
    cmp     rcx, 2                 ; is there an argument?
    jl      .noArguments
    pop     rax                    ; pointer to command      
    dec     rcx                    ; argc - 1 because of command
.repeat:
    pop     rsi                    ; get pointer to string (from stack, already absolute)
    call    String.length          ; get length of string
    mov     rdx, rax               ; length in rdx
    call    String.write
    
    push    rsi
    lea     rsi, [rel txt.is]      ; PIC: RIP-relative addressing
    mov     rdx, txt.islength
    call    String.write
    pop     rsi
    
    call    Palindrome.check
    
    jnc     .isPalindrome
    lea     rsi, [rel txt.no]      ; PIC: RIP-relative addressing
    mov     rdx, txt.nolength
    call    String.write

.isPalindrome:
    lea     rsi, [rel txt.yes]     ; PIC: RIP-relative addressing
    mov     rdx, txt.yeslength
    call    String.write
.until:
    loop    .repeat
    jmp     Exit
.noArguments:    
    lea     rsi, [rel usage]       ; PIC: RIP-relative addressing
    mov     rdx, usage.length
    call    String.write
Exit:
    syscall exit, 0

Palindrome:
.check:
    ; RSI has the pointer to a zero terminated string.
    push    rsi
    push    rdi
    push    rax
    push    rcx  
    
    call    String.length
    
    ; pointer to last character of string
    mov     rdi, rsi
    add     rdi, rax               ; calculate pointer to last character in string
    dec     rdi
    
    ; calculate middle of string
    shr     rax, 1                 ; divide rax by 2
    mov     rcx, rax               ; integer part of division in rcx
    test    rcx, rcx               ; handle single-char strings
    jz      .isPalindrome_check

.repeat_check:    
    mov     al, byte [rsi]         ; read from start
    mov     ah, byte [rdi]         ; read from end
    cmp     al, ah      
    jne     .noPalindrome
    inc     rsi
    dec     rdi
    dec     rcx
    jnz     .repeat_check

.isPalindrome_check:
    clc                            ; string is palindrome
    jmp     .done
.noPalindrome:
    stc
.done:
    pop     rcx
    pop     rax
    pop     rdi
    pop     rsi
    ret

String:
.length:
    push    rsi
    push    rcx     
    xor     rcx, rcx
.repeat_len:    
    lodsb
    test    al, al
    je      .done_len
    inc     rcx
    jmp     .repeat_len
.done_len:    
    mov     rax, rcx
    pop     rcx
    pop     rsi
    ret

.write:
    push    rcx
    push    r11                    ; Good habit for PIC syscalls
    syscall write, stdout, rsi, rdx
    pop     r11
    pop     rcx
    ret
