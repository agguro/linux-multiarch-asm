; name        : arguments.asm
; description : Read arguments.
; build       : release: nasm -f elf64 -I ../../../includes -o arguments.o arguments.asm
;                        ld -m elf_x86_64 -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o arguments *.o
;               debug  : nasm -f elf64 -I ../../../includes -g -Fdwarf -o arguments.debug.o arguments.asm
;                        ld -m elf_x86_64 -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o arguments.debug *.o

bits 64

[list -]
     %include "unistd.inc"
[list +]

%define LF 10

section .bss
    buffer:    resb 21

section .rodata
    msg:
    .argc:    db   "argc        : ",0
    .prog:    db   "Programname : ",0
    .argv:    db   "argv[]      : ",0

section .text
    global _start
_start:
    ; --- Handle argc ---
    pop     rax
    mov     rcx, rax
    dec     rcx

    ; PIC: Load address relative to RIP
    lea     rsi, [rel msg.argc]
    call    write.string

    mov     rax, rcx
    call    convert
    call    write.string
    mov     al, LF
    call    write.char

    ; --- Handle Program Name ---
    lea     rsi, [rel msg.prog]
    call    write.string

    pop     rsi
    call    write.string
    mov     al, LF
    call    write.char

    ; --- Handle Arguments ---
    lea     rsi, [rel msg.argv]
    call    write.string

    test    rcx, rcx
    jz      .end_of_args

.next_arg:
    push    rcx
    pop     rsi
    call    write.string

    pop     rcx
    cmp     rcx, 1
    je      .end_of_args

    mov     al, ' '
    call    write.char
    loop    .next_arg

.end_of_args:
    mov     al, LF
    call    write.char

    syscall exit, 0

; --- Utility Functions ---

write.string:
    push    rax
    push    rsi
    cld
.loop:
    lodsb
    test    al, al
    jz      .done
    call    write.char
    jmp     .loop
.done:
    pop     rsi
    pop     rax
    ret

write.char:
    push    rax
    push    rdi
    push    rsi
    push    rdx
    push    rcx
    push    r11

    ; PIC: access buffer relative to RIP
    lea     rsi, [rel buffer]
    mov     [rsi], al
    syscall write, stdout, rsi, 1

    pop     r11
    pop     rcx
    pop     rdx
    pop     rsi
    pop     rdi
    pop     rax
    ret

convert:
    ; PIC: Get end of buffer relative to RIP
    lea     rsi, [rel buffer + 20]
    mov     byte [rsi], 0
    mov     rbx, 10
.repeat:
    dec     rsi
    xor     rdx, rdx
    div     rbx
    add     dl, '0'
    mov     [rsi], dl
    test    rax, rax
    jnz     .repeat
    ret
