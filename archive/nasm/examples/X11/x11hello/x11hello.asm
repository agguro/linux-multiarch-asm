;name: x11hello

;description: a x11 windows with some text.

;build: nasm -felf64 -o x11hello.o x11hello.asm
;       ld -g -melf_x86_64 x11hello.o -o x11hello -lc --dynamic-linker /lib64/ld-linux-x86-64.so.2 -lX11

;the XDisplay structure is derived from Xlib.h
struc XDISPLAY
    .unknown1:              resq    1   ;  0 XExtData* hook for extension to hang data
    .private1:              resq    1   ;  8 struct _XPrivate*
    .fd:                    resd    1   ; 10 int Network socket
    .private2:              resd    1   ; 14 int
    .proto_major_version:   resd    1   ; 18 int - major version of server's X protocol
    .proto_minor_version:   resd    1   ; 1C int - minor version of servers X protocol
    .vendor:                resq    1   ; 20 char* - vendor of the server hardware
    .private3:              resq    1   ; 28 XID
    .private4:              resq    1   ; 30 XID
    .private5:              resq    1   ; 38 XID
    .private6:              resd    1   ; 40 int
    .resource_alloc:        resq    1   ; 44 XID - allocator function struct _XDisplay*
    .byte_order:            resd    1   ; 4C int - screen byte order, LSBFirst, MSBFirst 
    .bitmap_unit:           resd    1   ; 50 int - padding and data requirements
    .bitmap_pad:            resd    1   ; 54 int - padding requirements on bitmaps
    .bitmap_bit_order:      resd    1   ; 58 int - LeastSignificant or MostSignificant
    .nformats:              resd    1   ; 5C int - number of pixmap formats in list
    .pixmap_format:         resq    1   ; 60 ScreenFormat* - pixmap format list
    .private8:              resd    1   ; 68 int
    .release:               resd    1   ; 6C int release of the server
    .private9:              resq    1   ; 70 struct _XPrivate*
    .private10:             resq    1   ; 78 struct _XPrivate*
    .qlen:                  resd    1   ; 80 Length of input event queue
    .last_request_read:     resq    1   ; 84 seq number of last event read
    .request:               resq    1   ; 8C sequence number of last request
    .private11:             resq    1   ; 94 XPointer
    .private12:             resq    1   ; 9C XPointer
    .private13:             resq    1   ; A4 XPointer
    .private14:             resq    1   ; AC XPointer
    .max_request_size:      resd    1   ; B4 maximum number 32 bit words in request
    .db:                    resq    1   ; B8 struct _XrmHashBucketRec*
    .private15:             resq    1   ; C0 int* - struct _XDisplay*
    .display_name:          resq    1   ; C8 char* - "host:display" string used on this connect
    .default_screen:        resd    1   ; D0 int - default screen for operations
    .nscreens:              resd    1   ; D4 int - number of screens on this server
    .screens:               resq    1   ; D8 Screen* - pointer to list of screens
    .motion_buffer:         resq    1   ; E0 size of motion buffer
    .private16:             resq    1   ; E8
    .min_keycode:           resd    1   ; F0 minimum defined keycode
    .max_keycode:           resd    1   ; F4 maximum defined keycode
    .private17:             resq    1   ; F8 XPointer
    .private18:             resq    1   ; 100 XPointer
    .private19:             resd    1   ; 108 int
    .xdefaults:             resq    1   ; 10C char* - contents of defaults from server
    ;there is more to this structure, but it is private to Xlib
endstruc

struc SCREEN
    .ext_data:          resq    1   ;XExtData* - hook for extension to hang data
    .display:           resq    1   ;struct _XDisplay* - back pointer to display structure
    .root:              resq    1   ;Window - Root window id.
    .width:             resd    1   ;int - width of screen
    .height:            resd    1   ;int - height of screen
    .mwidth:            resd    1   ;int width of  in millimeters
    .mheight:           resd    1   ;int height of  in millimeters
    .ndepths:           resd    1   ;int - number of depths possible
    .depths:            resq    1   ;Depth* - list of allowable depths on the screen
    .root_depth:        resd    1   ;int - bits per pixel
    .root_visual:       resq    1   ;Visual* - root visual
    .default_gc:        resq    1   ;GC - GC for the root root visual
    .cmap:              resq    1   ;Colormap - default color map
    .white_pixel:       resq    1   ;unsigned long - White pixel values
    .black_pixel:       resq    1   ;unsigned long - Black pixel values
    .max_maps:          resd    1   ;int - max color maps
    .min_maps:          resd    1   ;int - min color maps
    .backing_store:     resd    1   ;int - Never, WhenMapped, Always
    .save_unders:       resd    1   ;Bool
    .root_input_mask:   resd    1   ;long - initial root input mask
endstruc

%include "unistd.inc"

extern XOpenDisplay
extern XCreateSimpleWindow
extern XSelectInput
extern XMapWindow
extern XNextEvent
extern XFillRectangle
extern XDrawString
extern XCloseDisplay

%define ExposureMask 1 << 15
%define KeyPressMask 1 << 0
%define Expose  12
%define KeyPress 2

section .bss

d:              resq    1       ;structure _XDisplay
w:              resq    1       ;
e:              resb    192     ;XEvent structure counts 192 bytes
gc:             resq    1
rootwindow:     resq    1
blackpixel:     resq    1
whitepixel:     resq    1

section .rodata

    msg:    db  "Hello, World!"
    .len:   equ $-msg

section .data

s istruc SCREEN
    at    SCREEN.ext_data,          dq    0   ;XExtData* - hook for extension to hang data
    at    SCREEN.display,           dq    0   ;struct _XDisplay* - back pointer to display structure
    at    SCREEN.root,              dq    0   ;Window - Root window id
    at    SCREEN.width,             dd    0   ;int - width of screen
    at    SCREEN.height,            dd    0   ;int - height of screen
    at    SCREEN.mwidth,            dd    0   ;int width of  in millimeters
    at    SCREEN.mheight,           dd    0   ;int height of  in millimeters
    at    SCREEN.ndepths,           dd    0   ;int - number of depths possible
    at    SCREEN.depths,            dq    0   ;Depth* - list of allowable depths on the screen
    at    SCREEN.root_depth,        dd    0   ;int - bits per pixel
    at    SCREEN.root_visual,       dq    0   ;Visual* - root visual
    at    SCREEN.default_gc,        dq    0   ;GC - GC for the root root visual
    at    SCREEN.cmap,              dq    0   ;Colormap - default color map
    at    SCREEN.white_pixel,       dq    0   ;unsigned long - White pixel values 
    at    SCREEN.black_pixel,       dq    0   ;unsigned long - Black pixel values
    at    SCREEN.max_maps,          dd    0   ;int - max color maps
    at    SCREEN.min_maps,          dd    0   ;int - min color maps
    at    SCREEN.backing_store,     dd    0   ;int - Never, WhenMapped, Always
    at    SCREEN.save_unders,       dd    0   ;Bool
    at    SCREEN.root_input_mask,   dd    0   ;long - initial root input mask
iend

section .text

; d = XOpenDisplay(NULL) - if NULL the we can't open a display

global _start
_start:
push    rbp
mov     rbp,rsp

sub     rsp,8
xor     rdi,rdi
call    XOpenDisplay
add     rsp,8

mov     qword[d],rax
and     rax,rax
jz      errordisplay                ;cannot open display

mov     [d],rax
;default screen, blackpixel, whitepixel and rootwindow are parts of the display structure

; s = DefaultScreen(d);
mov    rax,qword [d]
mov    eax,dword [rax+0xe0]
mov    rax,d
mov    rax,[rax]
add    rax,XDISPLAY.default_screen-XDISPLAY
mov    eax,[rax]
mov    dword [s],eax

;unsigned int r = RootWindow(d, s);
mov    rax,qword  [d]
mov    rax,qword  [rax+0xe8]
mov    edx,dword  [s]
shl    rdx,0x7
add    rax,rdx
mov    rax,qword  [rax+0x10]
mov    qword  [rootwindow],rax

;unsigned int bp = BlackPixel(d,s);
mov    rax,qword  [d]
mov    rax,qword  [rax+0xe8]
mov    edx,dword  [s]
shl    rdx,0x7
add    rax,rdx
mov    rax,qword  [rax+0x60]
mov    qword  [blackpixel],rax

;unsigned int wp = WhitePixel(d,s);
mov    rax,qword  [d]
mov    rax,qword  [rax+0xe8]
mov    edx,dword  [s]
shl    rdx,0x7
add    rax,rdx
mov    rax,qword  [rax+0x58]
mov    qword  [whitepixel],rax

;GC gc = DefaultGC(d,s);
mov    rax,qword  [d]
mov    rax,qword  [rax+0xe8]
mov    edx,dword  [s]
shl    rdx,0x7
add    rax,rdx
mov    rax,qword  [rax+0x48]
mov    qword  [gc],rax

; w = XCreateSimpleWindow(d, RootWindow(d, s), 10, 10, 100, 100, 1, BlackPixel(d, s), WhitePixel(d, s));

push    qword[whitepixel]
push    qword[blackpixel]
push    qword 1
mov     r9,100
mov     r8,100
mov     rcx,10
mov     rdx,10
mov     rsi,qword[rootwindow]
mov     rdi,qword[d]
call    XCreateSimpleWindow
mov     qword[w],rax
add     rsp,0x18

;XSelectInput(d, w, ExposureMask | KeyPressMask);

mov     rdx,ExposureMask|KeyPressMask
mov     rsi,qword[w]
mov     rdi,qword[d]
call    XSelectInput

;XMapWindow(d, w);
mov     rsi,qword[w]
mov     rdi,qword[d]
call    XMapWindow
;
; while (1) {
.repeat:
;    XNextEvent(d, &e);
sub     rsp,8
mov     rsi,e
mov     rdi,qword[d]
call    XNextEvent
add     rsp,8

;    if (e.type == Expose) {
mov     eax,[e]                         ;e.type
cmp     eax,Expose
jnz     .nexttype

;XFillRectangle(d, w, DefaultGC(d, s), 20, 20, 10, 10);
sub     rsp,8
push    10
mov     r9d,10
mov     r8d,20
mov     ecx,20
mov     rdx,[gc]
mov     rsi,[w]
mov     rdi,[d]
call    XFillRectangle
add     rsp,16

;        XDrawString(d, w, DefaultGC(d, s), 10, 50, msg, strlen(msg));
sub     rsp,8
push    qword msg.len
mov     r9,msg
mov     r8,50
mov     rcx,10
mov     rdx,[gc]
mov     rsi,qword[w]
mov     rdi,[d]
call    XDrawString
add     rsp,16
jmp     .repeat

;    if (e.type == KeyPress)
.nexttype:
    cmp     eax,KeyPress
    je      .break
    jmp     .repeat

.break:
    
mov     rdi,qword[d]
call    XCloseDisplay

errordisplay:

xor     rdi,rdi
syscall exit,0
