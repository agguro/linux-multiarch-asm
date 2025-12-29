; Project     : window
; Name        : mainwindow.asm
;
; Build       : aclocal && autoconf && automake --add-missing --foreign
;               mkdir build
;               cd build
;               ../configure
;               make
;
; Description : Creates and shows the mainwindow
; Source      : https://developer.gnome.org/gtk3/stable/gtk-getting-started.html#id-1.2.3.5

global mainWindow

extern gtk_application_window_new
extern gtk_window_set_title
extern gtk_window_set_default_size
extern gtk_widget_show_all

section .bss

section .rodata
    szTitle:        db      "Window",0

section .text

;activate signal handler
;receives rdi=*app, rsi=argc,rdx=**argv
mainWindow:
    push    rbp
    mov     rbp,rsp
    sub     rsp,16                          ;for window and stack alignment
    call    gtk_application_window_new
    mov     qword[rbp-8],rax                ;save pointer to window
    mov     rsi,szTitle
    mov     rdi,rax
    call    gtk_window_set_title
    mov     rdi,qword[rbp-8]
    mov     rsi,200
    mov     rdx,200
    call    gtk_window_set_default_size
    mov     rdi,qword[rbp-8]
    call    gtk_widget_show_all
    mov     rsp,rbp
    pop     rbp
    ret