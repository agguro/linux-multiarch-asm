;name: palindrome.asm
;
;description: The program checks if a given string is a palindrome. If no string is passed on
;             the commandline a brief message is displayed on how to use the program.
;             The string can be any charactersequence and is case sensitive thus Aa is a
;             palindrome of aA but not of aa.
;
;build: nasm -felf64 palindrome.asm -o palindrome.o
;       ld -melf_x86_64 palindrome.o -o palindrome 
;
;usage: ./palindrome string1 string2 .... stringn

bits 64

%include "unistd.inc"

global _start

section .bss

section .data
    usage:
    .start:     db  "Palindrome by Agguro.",10
                db  "usage: palindrome string1 string2 ...",10
    .length:    equ $-usage.start
    txt:
    .is:        db  " is "
    .islength:  equ $-txt.is
    .no:        db  "not "
    .nolength:  equ $-txt.no
    .yes:       db  "a palindrome.",10
    .yeslength: equ $-txt.yes
    
section .text

_start:
    pop	    rcx                    ;argc in RCX
    cmp     rcx,2                  ;is there an argument?
    jl      .noArguments
    pop     rax                    ;pointer to command      
    dec     rcx                    ;argc - 1 because of command
.repeat:
    pop     rsi                    ;get pointer to string
    call    String.length          ;get length of string
    mov     rdx,rax                ;lenght in rdx
    call    String.write
    
    push    rsi
    mov	    rsi,txt.is
    mov	    rdx,txt.islength
    call    String.write
    pop	    rsi
    
    call    Palindrome.check
    
    jnc     .isPalindrome
    mov	    rsi,txt.no
    mov	    rdx,txt.nolength
    call    String.write

.isPalindrome:
    mov     rsi,txt.yes
    mov     rdx,txt.yeslength
    call    String.write
.until:
    loop    .repeat
    jmp     Exit
.noArguments:    
    mov     rsi,usage
    mov     rdx,usage.length
    call    String.write
    jmp     Exit
Exit:
    syscall exit, 0

Palindrome:
.check:
    ;RSI has the pointer to a zero terminated string. If the string is a palindrome then the
    ;subroutine returns with the carryflag cleared, otherwise the carryflag is set.

    push    rsi
    push    rdi
    push    rax
    push    rcx  
    ;get length of stringz pointed by RSI
    call    String.length
    ;pointer to last character of string
    mov     rdi,rsi
    add     rdi,rax                 ;calculate pointer to last character in string
    dec     rdi
    ;calculate middle of string
    shr     rax,1                   ;divide rax by 2
    mov     rcx,rax                 ;integer part of division in rcx
.repeat:    
    mov     al,byte[rsi]            ;read byte RCX from begin of string
    mov     ah,byte[rdi]            ;read byte RCX from end of string
    cmp     al,ah      
    jne     .noPalindrome
    inc     rsi                     ;move pointer to next byte position
    dec     rdi                     ;move pointer to previous byte position
    dec     rcx                     ;adjust counter
    jnz     .repeat
    clc                             ;string is palindrome
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
    ; RSI has the pointer to a zero terminated string
    ; the length will be returned in RAX, all registers except RAX are restored
    push    rsi                     ;store used registers
    push    rcx     
    xor     rcx,rcx                 ;bytecounter
.repeat:    
    lodsb                           ;byte in AL
    cmp     al,0                    ;if 0 then end of string
    je      .done
    inc     rcx                     ;else increment byte counter
    jmp     .repeat
.done:    
    mov     rax,rcx                 ;string length in RAX
    pop     rcx                     ;restore used registers
    pop     rsi
    ret

.write:
    ; show a string pointed by RSI and length RDX on STDOUT
    ; all registers are restored, rcx will be destroyed after the syscall
    push    rcx
    syscall write, stdout
    pop     rcx
    ret
