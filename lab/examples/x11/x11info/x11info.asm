;name: x11info.asm
;
;build: nasm -felf64 x11info.asm -o x11info.o
;       ld -melf_x86_64 -o x11info x11info.o -lc --dynamic-linker /lib64/ld-linux-x86-64.so.2 -lX11
;
;description: This is a first attempt to get X11 and nasm to work.
;             This program is taken from a c source file from Brian Hammond 2/9/96.
;             connect.c and rebuild to nasm, just because I like it.

bits 64

[list -]
    %include "unistd.inc"
[list +]

; external functions from X11 library
    extern XOpenDisplay
    extern XDisplayName
    extern XCloseDisplay
; external functions from stdio library
    extern printf
    extern exit
    extern puts

section .data

    display_name: dq     0
    screen:       dd     0
    depth:        dd     0
    connection:   dd     0
    width:        dd     0
    height:       dd     0
    string1:      db "The display is %s",10, 0
    string2:      db "Width : %d",10, 0
    string6:      db "Height : %d", 10, 0
    string3:      db "Connection number is %d", 10, 0
    string4:      db "You live in prehistoric times",10, 0
    string5:      db "You have got a coloured monitor with depth of %d",10, 0

section .text

global _start
_start:

    xor     edi,edi
    call    XOpenDisplay
    mov     qword[display_name],rax
    ; display_name structure
    ; screen = DefaultScreen(display_name);
    mov     rax,qword[display_name]
    mov     eax,dword[rax+0xe0]
    mov     dword[screen],eax
    ; depth = DefaultDepth(display_name,screen);
    mov     rax,qword[display_name]
    mov     rax,qword[rax+0xe8]
    mov     edx,dword[screen]
    movsxd  rdx,edx
    shl     rdx,0x7
    add     rax,rdx
    mov     eax,dword[rax+0x38]
    mov     dword[depth],eax
    ;connection = ConnectionNumber(display_name);
    mov     rax,qword[display_name]
    mov     eax,dword[rax+0x10]
    mov     dword[connection],eax                     ; rbp-0xc
    ;printf("The display is::%s\n",XDisplayName((char*)display_name));
    mov     rax,qword[display_name]
    mov     rdi,rax
    call    XDisplayName
    mov     rsi,rax
    mov     edi,string1
    xor     eax,eax
    call    printf
    mov     rax,qword[display_name]
    mov     rax,qword[rax+0xe8]
    mov     edx,dword[screen]
    movsxd  rdx,edx
    shl     rdx,0x7
    add     rax,rdx
    mov     eax,dword[rax+0x18]
    mov     dword[width],eax
    mov     esi,eax
    mov     edi,string2
    xor     eax,eax
    call    printf
    mov     rax,qword[display_name]
    mov     rax,qword[rax+0xe8]
    mov     edx,dword[screen]
    movsxd  rdx,edx
    shl     rdx,0x7
    add     rax,rdx
    mov     eax,dword[rax+0x1c]
    mov     dword[height],eax
    mov     esi,eax
    mov     edi,string6
    xor     eax,eax
    call    printf
    mov     eax,dword[connection]
    mov     esi,eax
    mov     edi,string3
    xor     eax,eax
    call    printf
    ; if(depth == 1)
    cmp     dword[depth],0x1
    jne     showDepth
    ; printf("You live in prehistoric times\n");
    mov     edi,string4
    call    puts
    jmp     closeDisplay
    ;else printf("You've got a coloured monitor with depth of %d\n",
showDepth:
    mov     eax,dword[depth]
    mov     esi,eax
    mov     edi,string5
    xor     eax,eax
    call    printf
closeDisplay:
    mov     rax,qword[display_name]
    mov     rdi,rax
    call    XCloseDisplay
    call    exit
