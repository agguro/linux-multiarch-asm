;name: rotatebits.asm
;
;description: rotate the most significant bit in the least significant position 
;
;build: nasm -felf64 rotatebits.asm -o rotatebits.o
;       ld -melf_x86_64 -o rotatebits rotatebits.o 
;
;reference: number of leading zeros: Hacker's Delight

bits 64
align 16

[list -]
     %include "unistd.inc"
[list +]

section .bss

    reg64:      resb    64                      ;64 bits in a register

section .rodata
    
    msg:       db      0x0A
    .length:   equ     $-msg
     
section .text

global _start
_start:

    mov     rdi,10856
    push    rdi
    call    bin2ascii
    syscall write,stdout,reg64,64
    syscall write,stdout,msg,msg.length
    pop     rdi
    call    Rotatenbitsleft
    mov     rdi,rax
    call    bin2ascii
    syscall write,stdout,reg64,64
    syscall write, stdout, msg, msg.length
    syscall exit, 0

;bin2ascii : convert a binary value into an ascii string
;in : rdi is value
;out : ---
bin2ascii:
    push    rdi
    push    rcx
    mov     rax,rdi
    mov     rdi,reg64
    mov     rcx,64                              ;times to rotate
.repeat:
    xor     dl,dl
    rcl     rax,1
    adc     dl,0x30
    mov     byte[rdi],dl
    inc     rdi
    loop    .repeat
    pop     rcx
    pop     rdi
    ret
    
;RotateNbits: rotate msbit in a bitword to the least significant position ignoring leading zeros
;in : decimal number in RDI
;out : most significant bit of value in RDI becomes least significant bit.
;      result in RAX
;Used registers must be saved by caller

Rotatenbitsleft:   
    call      NLZ                           ;get the number of leading zeros, these must be skipped
    mov       rcx, rax                      ;value of leading zero bits in RCX for rotation count
    mov       rax, rdi                      ;value in rax
    rol       rax, cl                       ;move all bits until most significant bit is in position 63 in RAX
    rcl       rax, 1                        ;move most signifant bit in carry flag
    inc       rcx                           ;add one to shift count (one bit is moved into carry)
    pushfq                                  ;store flags (especially carry flag)
    ror       rax, cl                       ;shift all bits back in place
    popfq                                   ;restore flags
    rcl       rax, 1                        ;move carry flag into position 0 of rax    
    ret

; count number of leading zero's
; source: Hackers Delight
; in : RDI : number to check
; out : RAX : number of leading zeros

NLZ:
    and       rdi, rdi
    jnz       .start
    mov       rax, 64
    ret
.start: 
    mov       rax, rdi
    xor       rbx, rbx                        ;storage for number of zero bits
    mov       rcx, 32
    mov       rdx, 0xFFFFFFFF00000000
.repeat:      
    test      rax, rdx
    jnz       .nozeros
    add       rbx, rcx
    shl       rax, cl
.nozeros:
    shr       rcx, 1
    shl       rdx, cl
    and       rcx, rcx
    jnz       .repeat
    mov       rax, rbx                        ;result in rax
    ret
