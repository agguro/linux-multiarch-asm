org 0
BITS 16

     jmp       start
shellloading:  db   'shell loading, please wait....', 10, 13, 0
videomode:   dw   0

start:
%define FIRSTBANK  0
%define STARTBANK 0
%define LASTBANK  79
%define ENDBANK   LASTBANK
%define LINES_PER_BANK 13
%define PIXELS_PER_LINE 1280
%define SCAN_LINES 1240
%define DISPLACEMENT 256
; 1280 * 1024 = 1310720 pixels / screen
; 13 * 1280 = 16640 pixels per bank
; 1310720 / 16640 = 78,7 banks per screen (79)

mov ax, 0xA000
mov es,ax
mov ds,ax

mov cx, STARTBANK                                              ; banknumber
nextbank:
; switch bank
 mov ax, 0x4F05
 mov bx, 0
 mov dx, cx                                            ; switch to banknumber in cx
 int 0x10
 ; draw again
 mov ax, DISPLACEMENT                                            ; banknr * displacement 256
 mov bx, cx
 mul bx
 mov di, ax
 mov dl, 00000100b                                       
 push cx                                                 ; save banknumber
 mov cx, PIXELS_PER_LINE*LINES_PER_BANK
 push cx
 repeat:
 pop  cx
 lodsb
 or al, dl
 stosb
 dec cx
 and cx, cx
 push cx
 jnz repeat
 pop cx
 pop cx                                                ; restore banknumber
 inc cx
 cmp cx, ENDBANK
 jne nextbank
 
mov ax, 0x4F05
 mov bx, 0
 mov dx, FIRSTBANK                                            ; switch to banknumber in cx
 int 0x10

 ;%define BANK 10
 ;string:
 ;mov  ax, 0x4f05
 ;mov  bx, 0
 ;mov  dx, BANK
 ;int  0x10
 
 ;mov ax, 0xA000
 ;mov es, ax
 ;mov di, BANK*256
 ;mov al, 255
 ;mov cx, 1280*13
 ;rep movsb
 
 
 ;mov  ax, 0x4f05
 ;mov  bx, 0
 ;mov  dx, 0
 ;int  0x10
     mov       ax, cs
     mov       es, ax
     mov       ds, ax
     mov       si, shellloading
     ; test if stack behaves
     push      si
     xor       si, si
     pop       si
     call      Print
     retf

Print:
    pusha
    mov     si, shellloading
    mov     bl, 0x04        ; red
    call    WriteStringWithAttributeMode19
    popa
    ret

     
;0 = black               8 = dark grey
;1 = dark blue           9 = bright blue
;2 = dark green          a = bright green
;3 = dark cyan           b = bright cyan
;4 = dark red            c = bright red
;5 = dark purple         d = bright purple
;6 = brown               e = yellow
;7 = light grey          f = white

WriteStringWithAttributeMode19:
      pusha
      mov     bh, 0           ; Display page 0
      mov     bp, bx
      jmp    .d
.a:   cmp     al, 9
      je      .Tab
      cmp     al, 13
      ja      .b
      mov     cx, 1101101001111111b
      bt      cx, ax
      jnc     .c              ; 7,8,10,13 don't need the color

.b:   mov     bx, bp
      mov     dl, bl
      shr     dl, 4           ; Get background color (high nibble)
      and     bl, 15          ; Get foreground color (low nibble)
      xor     bl, dl
      mov     ah, 0Eh
      int     10h             ; BIOS.Teletype
      mov     ah, 03h
      int     10h             ; BIOS.GetCursor -> CX DX
      dec     dl              ; Column is [0,39]
      jns     .1
      mov     dl, 39
      dec     dh
.1:   movzx   cx, dl          ; Column -> X
      shl     cx, 3
      movzx   dx, dh          ; Row -> Y
      shl     dx, 3

      mov     bx, bp
      shr     bl, 4           ; Get background color (high nibble)
.2:   mov     ah, 0Dh         ; BIOS.ReadPixel
      int     10h             ; -> AL
      xor     al, bl
      mov     ah, 0Ch         ; BIOS.WritePixel
      int     10h
      inc     cx              ; X++
      test    cx, 7
      jnz     .2
      sub     cx, 8
      inc     dx              ; Y++
      test    dx, 7
      jnz     .2
      jmp     .d

.c:   mov     ah, 0Eh
      int     10h             ; BIOS.Teletype
.d:   lodsb
      test    al, al
      jnz     .a
      popa
      ret
.Tab: mov     cx, 1           ; Start displaying colored space(s)
      mov     bx, bp
      shr     bl, 4           ; Get background color
      mov     ax, 0EDBh       ; ASCII DBh is full block character
      int     10h             ; BIOS.Teletype
      mov     ah, 03h
      int     10h             ; BIOS.GetCursor -> CX DX
      test    dl, 7
      jnz     .Tab            ; Column not yet multiple of 8
      jmp    .d
