; name        : keyfilter.asm
; description : The program displays the ASCII code in hexadecimal of the pressed key.
; build       : release: nasm -f elf64  -I ../../../includes keyfilter.asm -o keyfilter.o
;                        ld -m elf_x86_64 -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o keyfilter keyfilter.o
;               debug  : nasm -f elf64 -I ../../../includes -g -Fdwarf -o keyfilter.debug.o keyfilter.asm
;                        ld -m elf_x86_64 -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o keyfilter.debug *.o

bits 64

[list -]
    %include "unistd.inc"
    %include "sys/termios.inc"
[list +]

section .bss
    buffer:     resq    8
    .length:    equ     $ - buffer
    termios:    resb    TERMIOS_STRUC_size

section .rodata
    intro:      db      "filter - by Agguro 2011 modernized for 2025", 10
                db      "ESC terminates, CTRL-C without.", 10
                db      "start typing >> ", 0
    .length:    equ     $ - intro      
    EOL_str:    db      "1B", 10
    .len:       equ     $ - EOL_str

section .data
    output:     db      0, 0, " "      ; Hex digits + space
    .length:    equ     $ - output

section .text
    global _start

_start:
    lea      rsi, [rel intro]
    mov      rdx, intro.length
    call     Write
    
    call     termios_canonical_mode_off
    call     termios_echo_mode_off

getKeyStroke:
    lea      rsi, [rel buffer]
    mov      rdx, buffer.length
    syscall  read, stdin, rsi, rdx 
    
    ; Check for ESC (0x1B)
    lea      rax, [rel buffer]
    cmp      byte [rax], 0x1B
    je       Exit
    
    movzx    rax, byte [rax]

toASCII:
    ; Convert byte to hex
    mov      ah, al
    and      al, 0x0F                 ; low nibble
    shr      ah, 4                    ; high nibble
    
    or       ax, 3030h                ; Convert to '0'-'9' range
    
    cmp      al, '9'
    jbe      .checkHigh
    add      al, 7                    ; Adjust for 'A'-'F'
.checkHigh:
    cmp      ah, '9'
    jbe      .done
    add      ah, 7
.done:
    lea      rdi, [rel output]
    mov      [rdi], ah
    mov      [rdi+1], al
    
    mov      rsi, rdi
    mov      rdx, output.length
    call     Write
    jmp      getKeyStroke
  
Exit:
    lea      rsi, [rel EOL_str]
    mov      rdx, EOL_str.len
    call     Write     
    
    call     termios_canonical_mode_on
    call     termios_echo_mode_on
    syscall  exit, 0

; --- Utility Functions ---

Write:
    push     rcx
    push     r11
    syscall  write, stdout, rsi, rdx
    pop      r11
    pop      rcx
    ret

; --- Termios Management (PICified & Fixed) ---

termios_canonical_mode_on:
    mov      eax, ICANON
    call     termios_set_localmode_flag
    ret

termios_echo_mode_on:
    mov      eax, ECHO
    call     termios_set_localmode_flag
    ret

termios_set_localmode_flag:
    push     rax
    call     termios_stdin_read
    pop      rax
    lea      rdx, [rel termios]
    or       dword [rdx + TERMIOS_STRUC.c_lflag], eax
    call     termios_stdin_write
    ret

termios_canonical_mode_off:
    mov      eax, ICANON
    call     termios_clear_localmode_flag
    ret

termios_echo_mode_off:
    mov      eax, ECHO
    call     termios_clear_localmode_flag
    ret

termios_clear_localmode_flag:
    push     rax
    call     termios_stdin_read
    pop      rax
    not      eax
    lea      rdx, [rel termios]
    and      dword [rdx + TERMIOS_STRUC.c_lflag], eax
    call     termios_stdin_write
    ret
    
termios_stdin_write:
    mov      rsi, TCSETS
    jmp      termios_stdin_syscall

termios_stdin_read:
    mov      rsi, TCGETS

termios_stdin_syscall:
    push     rax                      ; Protect RAX from syscall clobber
    lea      rdx, [rel termios]
    syscall  ioctl, stdin, rsi, rdx
    pop      rax
    ret
