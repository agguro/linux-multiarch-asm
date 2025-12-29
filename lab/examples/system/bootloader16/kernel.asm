;name:           kernel.asm
;
;description:    This is the "kernel" file which will be loaded by the bootloader.
;                For the sake of simplicity it just displays a message on the screen.
;                This "kernel" can on the other hand start memory management routines, loads
;                a command prompt like DOS does or switch to protected mode or long mode for
;                64 bit operations.  To make a long story short: here the main work starts.
;
;build:          nasm -fbin kernel.asm -o kernel.bin

    bits 16

kernel:
    cli                            ;disable interrupts
    xor        ax,ax
    mov        ss,ax               ;set stack segment and pointer
    mov        sp,0xFFFF
    sti                            ;enable interrupts
    cld
    mov        ax,0x2000           ;set all segments to match where kernel is loaded
    mov        ds,ax               ;after this, we don't need to bother with
    mov        es,ax               ;segments ever again,as its programs
    mov        fs,ax               ;live entirely in 64K
    mov        gs,ax
    mov        si,welcome
    pusha

    mov        ah,0x0E             ;int 10h teletype function
.repeat:
    lodsb                          ;get char from string
    and        al,al
    jz        .done                ;if char is zero, end of string
    int        0x10                ;otherwise, print it
    jmp        .repeat             ;and move on to next char
.done:
    popa               
.loop:        
    hlt
    jmp        .loop
    
welcome:  db   'Kernel example by Agguro - Version 1.0.0.0', 10, 13, 0
