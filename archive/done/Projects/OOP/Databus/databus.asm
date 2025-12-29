;name:  oop.asm
;
;build: nasm -f elf64 -o databus.o databus.asm -l databus.list
;       ld -s databus.o  -o databus
;
;description: An other example on OOP, however not with inheritance.
;             The example creates two objects, one of the BIT class
;             another of the databus class which includes 8 bits. 
;
;TODO: inheritance

BITS 64

[list -]
    %include "unistd.inc"
    %include "sys/termios.inc"
    %include "asm-generic/errno.inc"
    %include "bit.class"
    %include "databus.class"
[list +]

section .bss
    
section .data

    BIT a
    
    DATABUS databus
    
    bitchanged:     db  "bit has changed",10
    .length:        equ $-bitchanged
    databuschanged: db  "databus has changed",10
    .length:        equ $-databuschanged

section .text
    global _start
_start:

	mov rdx,OnBitChanged
	a.OnChanged
; as an example the methods for OnBitSet and OnBitReset aren't defined.
; this results in a NULL pointer in the object on which we check and don't
; execute the event.

    a.Set
    a.Reset
    a.Invert
    a.Get
    mov dl, 1
    a.Load
    
	mov rdx,OnDatabusChanged
    databus.0.OnChanged
    
    databus.0.Set
    databus.0.Reset
    databus.0.Invert
    databus.0.Get

    databus.1.Set
    databus.1.Reset
    databus.1.Invert
    databus.1.Get

    databus.2.Set
    databus.2.Reset
    databus.2.Invert
    databus.2.Get

    databus.3.Set
    databus.3.Reset
    databus.3.Invert
    databus.3.Get

    databus.4.Set
    databus.4.Reset
    databus.4.Invert
    databus.4.Get

    databus.5.Set
    databus.5.Reset
    databus.5.Invert
    databus.5.Get

    databus.6.Set
    databus.6.Reset
    databus.6.Invert
    databus.6.Get

    databus.7.Set
    databus.7.Reset
    databus.7.Invert
    databus.7.Get
    
    syscall exit, 0

OnBitChanged:
    syscall write, stdout, bitchanged, bitchanged.length
    ret
    
OnDatabusChanged:
    syscall write, stdout, databuschanged, databuschanged.length
    ret

