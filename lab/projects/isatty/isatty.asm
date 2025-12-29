;name: isatty.asm
;
;description: check if a user session is started in X-server, console on X-server or
;             a "real" (what's real?) terminal.
;
;build: nasm -felf64 -o isatty.o isatty.asm
;       ld -o isatty -m elf_x86_64 -lc --dynamic-linker /lib64/ld-linux-x86-64.so.2 isatty.o `pkg-config --libs gtk+-3.0`
;
;agguro (c), 17 april 2021

bits 64

[list -]
    %include "unistd.inc"
    %include "sys/termios.inc"
    %define    GTK_WINDOW_TOPLEVEL   0
    %define    GTK_WIN_POS_CENTER    1
    %define    FALSE                 0
    %define    TRUE                  1
    extern     gtk_init
    extern     gtk_main
    extern     gtk_main_quit
    extern     gtk_widget_show
    extern     gtk_window_new
    extern     gtk_window_set_title
    extern     g_signal_connect_data
    extern     exit
[list +]

global _start

section .bss
;uninitialized read-write data
    envplist:   resq    0
    window:     resq    0

section .data
    TERMIOS	termios                         ;termios structure
    
section .rodata
    szTitle:        db  "isatty from GUI",0
    szDestroy:      db  "destroy",0
    szXtermSess:    db  "isatty from a terminal session on X-server", 10
    .len:           equ $-szXtermSess
    szRealterm:     db  "isatty from a 'real' terminal", 10
    .len:           equ $-szRealterm

section .text

_start:
    ;get the enviroment parameterlist pointer
    mov     rax,rsp                         ;address of argc
    mov     rdx,[rsp]                       ;argc
    inc     rdx                             ;for programname
    inc     rdx                             ;null pointer
    shl     rdx,3                           ;argc*8,stackdisplacement for arguments and ending NULL pointer
    add     rax,rdx                         ;envplist
    mov     qword [envplist],rax            ;save start of environment parameter list
    ;check if the application is ran from a terminal session
    syscall ioctl,stdin,TCGETS,termios
    ;if the result in rax is a negative value then we aren't running from a terminal
    test    rax,rax
    js      .gui
    ;if rax returns zero the program is running from a terminal
    ;we have to figure out if the terminal is started from a desktop (GUI) or not
    ;this can be done by looking for the environment parameter TERM=linux.
    mov     rax,qword [envplist]            ;read start of environment parameter list
.repeat:
    mov     r15,qword [rax]                 ;read address of environment parameter
    test    r15,r15                         ;check if at end of list
    jz      .endoflist
    mov     edx,dword [r15]                 ;read first dword
    cmp     edx,"TERM"
    je      .foundkeyword
    jmp     .next
.foundkeyword:
    mov     dl,byte [r15+4]
    cmp     dl,"="
    jne     .next
    mov     rdx,qword [r15+5]
    shl     rdx,24
    shr     rdx,24
    mov     rcx,"linux"
    xor     rdx,rcx
    test    rdx,rdx
    jz      .realterminal
.next:
    add     rax,8                           ;next environment parameter
    jmp     .repeat

.endoflist:
    ;if we arrive here we are in a GUI terminal
    syscall write,stdout,szXtermSess,szXtermSess.len
    jmp     .done

.realterminal:
    ;if we are here we are in a real terminal, just to make the difference we show
    ;another message (but it can be the same or just the application that starts)
    syscall write,stdout,szRealterm,szRealterm.len

.done:
    ;that's it, end program
    syscall exit,0

.gui:
    xor     rdi,rdi                 
    xor     rsi,rsi
    call    gtk_init
    ;if initialization doesn't succeed then the application
    ;terminates.  If that is unwanted behaviour then we need
    ;to use gtk_init_check instead.
    ;https://developer.gnome.org/gtk2/stable/gtk2-General.html#gtk-init
    ;create a new window
    mov     rdi,GTK_WINDOW_TOPLEVEL
    call    gtk_window_new
    mov     r15,rax                     ;save gtkwindow pointer
    ;set the title
    mov     rdi,rax
    mov     rsi,szTitle
    call    gtk_window_set_title
    ;connect the destroy signal to gtk_main_quit event handler
    xor     r9d,r9d                    ;combination of GConnectFlags 
    xor     r8d,r8d                    ;a GClosureNotify for data
    xor     rcx,rcx                    ;pointer to the data to pass
    mov     rdx,gtk_main_quit          ;pointer to the handler
    mov     rsi,szDestroy              ;pointer to the signal
    mov     rdi,r15                    ;pointer to the widget instance
    ;C programs uses g_signal_connect, this is not a library
    ;function.
    call    g_signal_connect_data
    ;show the window
    mov     rdi,r15
    call    gtk_widget_show
    ;go into applications main loop
    call    gtk_main
.exit:    
    ;exit program
    xor     rdi,rdi
    call    exit
