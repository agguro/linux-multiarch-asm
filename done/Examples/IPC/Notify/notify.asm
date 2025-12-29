;name:        notify.asm
;
;build:       nasm -felf64 -Fdwarf -o notify.o notify.asm
;             ld -melf_x86_64 -g --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o notify notify.o -lc -lnotify
;
;description: This example comes from stackoverflow (https://stackoverflow.com/questions/20317417/nasm-notify-send/64191219#64191219).  Because the original code couldn't be build with the use of gcc, it's slightly modified to build
;             it the what  I call hardcore assemble and link.  You  must install libnotify-dev to have this one build.
;             The program sends from a terminal a notification message to linux desktop (GUI) wich pops up at the upper right corner in my case.
;	      you must install libnotify-dev (sudo apt install libnotify-dev)

bits 64
 
extern notify_init, notify_notification_new, notify_notification_show, notify_uninit
extern exit

section .data
name            db  "Sample Notification", 0
title           db  "Just a test", 0

global _start
section .text
_start:
    mov     rdi, name
    call    notify_init 

    mov     rdx, 0
    mov     rsi, title
    mov     rdi, name
    call    notify_notification_new

    mov     rsi, 0
    mov     rdi, rax
    call    notify_notification_show

    call    notify_uninit

    call    exit
