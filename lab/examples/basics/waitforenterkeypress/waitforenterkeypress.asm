; name       : waitforenterkeypress.asm
; description: Displays a message, in this case "press ENTER to exit..." and wait until the user hits
;              the return key. With a buffer, large enough and wich you erases entirely after hitting a key
;              or key sequence (like ALT-[somekey], the remains of a hotkey aren't displayed neither.
;              The program works on most keys however CTRL, SUPER or ALT doesn't give the desired effect.
;              For a solution on that we must use the scancode of a key.
;              A better message should be, press any key except CTRL, SUPER or ALT
; build      : release: nasm -f elf64 -I ../../../includes waitforenterkeypress.asm -o waitforenterkeypress.o
;                       ld -m elf_x86_64 -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o waitforenterkeypress waitforenterkeypress.o
;               debug : nasm -f elf64 -I ../../../includes -g -Fdwarf -o waitforenterkeypress.debug.o waitforenterkeypress.asm
;                       ld -m elf_x86_64 -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o waitforenterkeypress.debug *.o

bits 64

[list -]
    %include "unistd.inc"
    %include "sys/termios.inc"
[list +]

section .bss
    ; Using resb with the structure size constant avoids the "non-constant" error
    termios:    resb  TERMIOS_STRUC_size
    
    buffer:     resb    5               ; Buffer to catch escape/hotkey sequences
    .length:    equ     $ - buffer

section .rodata
    message:    db    "Press ENTER to exit...", 10
    .length:    equ   $ - message

section .text
    global _start

_start:
    ; 1. Write prompt to STDOUT
    lea     rsi, [rel message]
    mov     rdx, message.length
    syscall write, stdout, rsi, rdx

    ; 2. Configure Terminal (Turn off Canonical and Echo)
    call    TermIOS.Canonical.OFF
    call    TermIOS.Echo.OFF

    ; 3. Wait for the specific key (0x0A = LF/ENTER)
.repeat:    
    lea     rsi, [rel buffer]
    mov     rdx, buffer.length
    syscall read, stdin, rsi, rdx
    
    ; Check first byte of read for 0x0A
    lea     r8, [rel buffer]
    mov     al, byte [r8]
    cmp     al, 0x0A
    jne     .repeat

    ; 4. Cleanup: Print a newline and restore terminal settings
    lea     r8, [rel buffer]
    mov     byte [r8], 10
    syscall write, stdout, r8, 1

    call    TermIOS.Canonical.ON
    call    TermIOS.Echo.ON

    syscall exit, 0

; **********************************************************************************************
; TERMIOS functions (PIC-Compliant)
; **********************************************************************************************

TermIOS.Canonical:
.ON:
    mov     eax, ICANON
    jmp     TermIOS.LocalModeFlag.SET
.OFF:
    mov     eax, ICANON
    jmp     TermIOS.LocalModeFlag.CLEAR

TermIOS.Echo:
.ON:
    mov     eax, ECHO
    jmp     TermIOS.LocalModeFlag.SET
.OFF:
    mov     eax, ECHO
    jmp     TermIOS.LocalModeFlag.CLEAR

TermIOS.LocalModeFlag:
.SET:
    push    rbx                    ; Preserve RBX for stack alignment
    mov     ebx, eax               ; Save flag (ICANON or ECHO)
    call    TermIOS.STDIN.READ
    lea     rdi, [rel termios]     ; PIC: RIP-relative address
    or      dword [rdi + TERMIOS_STRUC.c_lflag], ebx
    call    TermIOS.STDIN.WRITE
    pop     rbx
    ret

.CLEAR:
    push    rbx
    mov     ebx, eax
    not     ebx                    ; Flip bits for the mask
    call    TermIOS.STDIN.READ
    lea     rdi, [rel termios]     ; PIC: RIP-relative address
    and     dword [rdi + TERMIOS_STRUC.c_lflag], ebx
    call    TermIOS.STDIN.WRITE
    pop     rbx
    ret

TermIOS.STDIN:
.READ:
    mov     rsi, TCGETS
    jmp     TermIOS.IOCTL
.WRITE:
    mov     rsi, TCSETS

TermIOS.IOCTL:
    push    rax
    push    rcx                    ; Preserve RCX (clobbered by syscall)
    push    r11                    ; Preserve R11 (clobbered by syscall)
    lea     rdx, [rel termios]
    syscall ioctl, stdin, rsi, rdx
    pop     r11
    pop     rcx
    pop     rax
    ret
