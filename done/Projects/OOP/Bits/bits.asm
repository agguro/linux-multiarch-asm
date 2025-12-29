;name:  bits.asm
; 
;build: nasm -f elf64 -o bits.o bits.asm -l bits.list
;        ld -s bits.o  -o bits
;
;description: this is my first attempt to program in OOP style. Most if not all of the
;             code is included in the bit.class file.

BITS 64
[list -]
    %include "unistd.inc"
    %include "./bit.class"
[list +]

section .bss
    
section .data

    BIT a
    BIT b
    
    changed:    db  "has changed - "
    .length:    equ $-changed
    set:        db  "is set",10
    .length:    equ $-set
    reset:      db  "is reset",10
    .length:    equ $-reset

    bita:       db  "bit a "
    .length:    equ $-bita
    
    bitb:       db  "bit b "
    .length:    equ $-bitb
       
    section .text
    global _start
    
_start:

    mov rdx,OnAChanged
    a.OnChanged
    mov rdx,OnASet
    a.OnSet
    mov rdx,OnAReset
    a.OnReset

    mov rdx,OnBChanged
    b.OnChanged
    mov rdx,OnBSet
    b.OnSet
    mov rdx,OnBReset
    b.OnReset

    a.Set
    a.Invert
    a.Reset
    a.Invert
    a.Get
    mov dl, 1
    a.Load
    
    b.Set
    b.Reset
    b.Invert
    b.Invert
    b.Get
    mov dl, 0
    b.Load
    
    syscall exit, 0

;TODO:
; this list of separate procedures for each bit can be shortened when
; we add a name property in the BIT class.

OnAChanged:
    syscall write, stdout, bita, bita.length
    jmp     OnBitChanged

OnASet:
    syscall write, stdout, bita, bita.length
    jmp     OnBitSet

OnAReset:
    syscall write, stdout, bita, bita.length
    jmp     OnBitReset

OnBChanged:
    syscall write, stdout, bitb, bitb.length
    jmp     OnBitChanged

OnBSet:
    syscall write, stdout, bitb, bitb.length
    jmp     OnBitSet

OnBReset:
    syscall write, stdout, bitb, bitb.length
    jmp     OnBitReset

OnBitChanged:
    syscall write, stdout, changed, changed.length
    ret
    
OnBitSet:
    syscall write, stdout, set, set.length
    ret
    
OnBitReset:
    syscall write, stdout, reset, reset.length
    ret
