;name : aboutbox.asm
;
;build : nasm -felf64 -o aboutbox.o -l aboutbox.lst aboutbox.asm
;        ld -s -m elf_x86_64 aboutbox.o -o aboutbox --dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc `pkg-config --libs gtk+-3.0`
;
;description : an aboutbox example
;
;remark : be sure to have a Resources folder with the required images
;         click on the window to see the Aboutbox
;
;source : http://zetcode.com/gui/gtk2/gtkdialogs/
;         http://stackoverflow.com/questions/14121166/gdk-pixbuf-load-image-from-memory

bits 64

[list -]
    extern    exit
    extern    gtk_init
    extern    gtk_window_new
    extern    gtk_window_set_title
    extern    gtk_window_set_default_size
    extern    gtk_window_set_position
    extern    gtk_window_set_icon
    extern    gtk_widget_show_all
    extern    gtk_widget_add_events
    extern    gtk_main
    extern    gtk_main_quit
    extern    g_signal_connect_data
    extern    gdk_pixbuf_new_from_file
    extern    gdk_pixbuf_loader_new
    extern    gdk_pixbuf_loader_write
    extern    gdk_pixbuf_loader_get_pixbuf
    extern    gtk_image_new_from_pixbuf
    extern    gtk_container_add
    extern    gtk_container_set_border_width
    extern    gtk_about_dialog_new
    extern    gtk_about_dialog_set_comments
    extern    gtk_about_dialog_set_copyright
    extern    gtk_about_dialog_set_logo
    extern    gtk_about_dialog_set_program_name
    extern    gtk_about_dialog_set_version
    extern    gtk_about_dialog_set_website
    extern    gtk_dialog_run
    extern    gtk_widget_destroy
    extern    gtk_widget_hide
    extern    gtk_window_set_transient_for
[list +]

    %define   GTK_WINDOW_TOPLEVEL      0
    %define   GTK_WIN_POS_CENTER       1
    %define   GDK_BUTTON_PRESS_MASK    256

section .rodata
    logo:               incbin    "../Resources/agguro-bol-64-64.png"
    .size:              equ  $-logo
    picture:            incbin    "../Resources/agguro-logo-381-138.png"
    .size:              equ  $-picture

section .data
    window:
    .handle:            dq   0
    .title:             db   "click on the window",0
    signal:
    .destroy:           db   "destroy",0
    .buttonpressevent:  db   "button-press-event", 0

    dialog:
    .handle:            dq   0
    .title:             db   " this example", 0
    .version:           db   "1.0 - demo", 0
    .copyright:         db   "(c) Agguro - 2015", 0
    .comments:          db   "This is an example to create an about dialogbox", 0
    .website:           db   "https://github.com/agguro", 0

    loader:             dq   0
    pixbuffer:
    .icon:              dq   0
    .image:             dq   0
    
section .text
    global _start

_start:
    xor       rsi, rsi                  ; argv
    xor       rdi, rdi                  ; argc
    call      gtk_init

    mov       rdi,GTK_WINDOW_TOPLEVEL
    call      gtk_window_new
    mov       qword [window.handle], rax

    mov       rdi, qword [window.handle]
    mov       rsi, GTK_WIN_POS_CENTER
    call      gtk_window_set_position

    mov       rdi, qword [window.handle]
    mov       rsi, 220
    mov       rdx, 150
    call      gtk_window_set_default_size

    mov       rdi, qword [window.handle]
    mov       rsi, window.title
    call      gtk_window_set_title

    mov       rdi, qword[window.handle]
    mov       rsi, 15
    call      gtk_container_set_border_width

    mov       rdi, qword[window.handle]
    mov       rsi, GDK_BUTTON_PRESS_MASK
    call      gtk_widget_add_events

    call      gdk_pixbuf_loader_new
    mov       qword [loader], rax
    mov       rdi, qword[loader]
    mov       rsi, logo
    mov       edx, logo.size
    xor       rcx, rcx
    call      gdk_pixbuf_loader_write

    mov       rdi, qword[loader]
    call      gdk_pixbuf_loader_get_pixbuf
    mov       qword[pixbuffer.icon], rax

    mov       rdi, qword [window.handle]
    mov       rsi, qword [pixbuffer.icon]
    call      gtk_window_set_icon

    xor       r9d, r9d                              ; combination of GConnectFlags 
    xor       r8d, r8d                              ; a GClosureNotify for data
    mov       rcx, qword[window.handle]             ; pointer to the data to pass
    mov       rdx, show_about                       ; pointer to the handler
    mov       rsi, signal.buttonpressevent          ; pointer to the signal
    mov       rdi, qword[window.handle]             ; pointer to the widget instance
    call      g_signal_connect_data                 ; the value in RAX is the handler, but we don't store it now

    xor       r9d, r9d                              ; combination of GConnectFlags 
    xor       r8d, r8d                              ; a GClosureNotify for data
    mov       rcx, qword[window.handle]             ; pointer to the data to pass
    mov       rdx, gtk_main_quit                    ; pointer to the handler
    mov       rsi, signal.destroy                   ; pointer to the signal
    mov       rdi, qword[window.handle]             ; pointer to the widget instance
    call      g_signal_connect_data                 ; the value in RAX is the handler, but we don't store it now

    call      gtk_about_dialog_new
    mov       qword[dialog.handle], rax
    
    ; if we should leave next three lines we get:
    ; Gtk-Message: GtkDialog mapped without a transient parent. This is discouraged.
    mov       rdi, qword[dialog.handle]
    mov       rsi, qword[window.handle]
    call      gtk_window_set_transient_for
    
    mov       rdi, qword [window.handle]
    call      gtk_widget_show_all

    call      gtk_main
Exit:
    
    xor       rdi, rdi                ; we don't expect much errors now
    call      exit

show_about:     
    ; RDI has GtkWidget *widget
    ; RSI has gpointer data
    ; create stackframe to prevent segmentation faults
    push      rbp
    mov       rbp, rsp
    call      gdk_pixbuf_loader_new
    mov       qword [loader], rax
    mov       rdi, qword[loader]
    mov       rsi, picture
    mov       edx, picture.size
    xor       rcx, rcx
    call      gdk_pixbuf_loader_write

    mov       rdi, qword[loader]
    call      gdk_pixbuf_loader_get_pixbuf
    mov       qword[pixbuffer.image], rax

    mov       rdi, qword[dialog]
    mov       rsi, dialog.title
    call      gtk_about_dialog_set_program_name

    mov       rdi, qword[dialog]
    mov       rsi, dialog.version
    call      gtk_about_dialog_set_version

    mov       rdi, qword[dialog]
    mov       rsi, dialog.copyright
    call      gtk_about_dialog_set_copyright

    mov       rdi, qword[dialog]
    mov       rsi, dialog.comments
    call      gtk_about_dialog_set_comments

    mov       rdi, qword[dialog]
    mov       rsi, dialog.website
    call      gtk_about_dialog_set_website

    mov       rdi, qword[dialog]
    mov       rsi, qword[pixbuffer.image]
    call      gtk_about_dialog_set_logo

    mov       rdi, qword[dialog]
    mov       rsi, qword[pixbuffer.icon]
    call      gtk_window_set_icon

    mov       rdi, qword[dialog]
    call      gtk_dialog_run

    mov       rdi, qword[dialog]
    call      gtk_widget_hide

    leave
    ret
