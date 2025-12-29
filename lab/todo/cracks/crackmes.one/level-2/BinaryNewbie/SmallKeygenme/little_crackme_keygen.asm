;name: little_cracke_keygen.asm
;buil: nasm -felf64 little_cracke_keygen.asm -o little_cracke_keygen.o
;      ld -melf_x86_64 -o little_cracke_keygen little_cracke_keygen.o
;
;description: keygenerator for little_cracke challenge

bits 64

%include "unistd.inc"

section .rodata
    digits: db  '2','5','7','d','D','f','F'
    eol:    db  0xA

section .text

global _start
_start:
    mov     rcx,16                  ;key length
.repeat:    
    rdtsc                           ;read timestamp counter
    rol     rax,7
    xor     rdx,rdx                 ;must be zero or division error
    mov     rbx,7                   ;divide by 7
    div     rbx
    mov     rsi,digits              
    add     rsi,rdx
    push    rcx
    syscall write,stdout,rsi,1
    pop     rcx
    test    rcx,rcx
    loopnz  .repeat
    syscall write,stdout,eol,1
    syscall exit

    ;count = 0
    ;do
    ;call system time
    ;get millisecs
    ;get seconds
    ;get minutes
    ;add all together
    ;divide by 7
    ;remainder is less than 7
    ;read digits[remainder]
    ;output digit
    ;while count < 15

