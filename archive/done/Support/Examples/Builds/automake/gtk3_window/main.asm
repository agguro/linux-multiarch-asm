; Project     : window
; Name        : main.asm
;
; Build       : aclocal && autoconf && automake --add-missing --foreign
;               mkdir build
;               cd build
;               ../configure
;               make
;
; Description : Example window
; Source      : https://developer.gnome.org/gtk3/stable/gtk-getting-started.html#id-1.2.3.5

bits 64

global  _start

extern gtk_application_new
extern g_signal_connect_data
extern g_application_run
extern g_object_unref
extern exit
extern gtk_application_window_new
extern gtk_window_set_title
extern gtk_window_set_default_size
extern gtk_widget_show_all

extern mainWindow

%define G_APPLICATION_FLAGS_NONE 0

section .bss
    app:            resq    1       ;GtkApplication*
    status:         resq    1       ;int

section .rodata
    szIdentifier:   db      "org.agguro.gtk3examples",0
    szActivate:     db      "activate",0

_start:

    mov     rdi,szIdentifier    
    mov     rsi,G_APPLICATION_FLAGS_NONE
    call    gtk_application_new
    mov    qword[app],rax

    mov    r9d,0
    mov    r8d,0
    mov    ecx,0                    ;NULL
    lea    rdx,mainWindow           ;G_CALLBACK
    lea    rsi,szActivate           ;'activate'
    mov    rdi,qword[app]           ;app
    call   g_signal_connect_data

    mov     rdi,qword[app]
    xor     rsi,rsi                 ;argc
    xor     rdx,rdx                 ;argv
    call    g_application_run
    mov     qword[status],rax

    mov     rdi,qword[app]
    call    g_object_unref

    mov     rdi,qword[status]
    call    exit