; Name:         hexdump.asm
; Build:        see makefile
; Description:  Get the posted data and display it in characters and hexadecimal values.
;               This program has advantage over getpostparams that all the posted data is shown
;               with (I hope) any CONTENT-TYPE.  I use this as a tool to see if data from a website
;               or from cgi is actually arrived, if not an error occured.
;               It is also a tool to exploit the header for file uploads. (but that's another example)
; Use:          This program allow us to see the posted data from any (???) website.

BITS 64

%define MAX_FILESIZE    1024*1024*1024  ; max is 1 Mbytes, enough for the demo
%define COLUMNS         32              ; 32 bytes in a row

[list -]
     %include "unistd.inc"
[list +]

section .bss

oldbrkaddr:    resq    1
contentsize:   resq    1

section .data

requestmethod:
               db      'REQUEST_METHOD=POST'
.length:       equ     $-requestmethod
contentlength:
               db      'CONTENT_LENGTH='
.length:       equ     $-contentlength

top:           db      'Content-type: text/html', 0x0A, 0x0A
               db      '<!DOCTYPE html><html><head>'
               db      '<title>Show RAW POST DATA</title>'
               db      '</head><body>'
               db      '<pre><div id="chars" style="float:left;margin-right:100px;">'
.length:       equ     $-top

middle:        db      '</div><div id="hex" style="float:left; border-left: 1px solid #ccc;padding-left: 10px;">'
.length:       equ     $-middle

bottom:        db      '</div></pre></body>'
               db      '</html>'
.length:       equ     $-bottom

charbuffer:    db      '&#x'
.value:        dw      0
.length:       equ     $-charbuffer

hexbuffer:     db      ' '
.value:        dw      0
.length:       equ     $-hexbuffer

break:         db      '<br />'
.length:       equ     $-break

sizelimited:   db      'Content-type: text/html', 0x0A, 0x0A
               db      'This file is to long, sorry'
.length:       equ     $-sizelimited

section .text
     global _start

_start:

; check if the application is accessed through POST, if not just exit, no warning
     ; adjust the stack to point to the web server variables
     pop       rax
     pop       rax
     pop       rax
     push      rsp                             ; save stackpointer on stack
     pop       r9                              ; and put in R9
     cld
     ; loop through the webserver variables searching for REQUEST_METHOD=POST
     mov       rdi, requestmethod
     mov       rcx, requestmethod.length
searchpostvar:
     pop       rsi
     or        rsi, rsi                        ; done yet?
     jz        Exit                            ; yes, the data was not posted     
     mov       rdi, requestmethod
     mov       rcx, requestmethod.length
     rep       cmpsb
     jne       searchpostvar                   ; still not found

; page was posted, now search for the content length
     ; adjust stack to point again to the web server variables
     mov       rsp, r9                         ; set rsp to begin of webvariables
@2:
     pop       rsi
     or        rsi, rsi                        ; done yet?
     jz        Exit                            ; normally there is a contentlength variable, exit just in case there isn't
     mov       rdi, contentlength
     mov       rcx, contentlength.length
     rep       cmpsb
     jne       @2

; the contentlength variable is found, rsi points to the first digit
; convert the ASCII length to hexadecimal
    ; get the value of content_length
     xor       rcx, rcx
     xor       rax, rax
readdigit:
     lodsb
     and       al, al
     jz        endofdigits
     and       al , 0x0F
     xor       rdx, rdx
     mov       rbx, 10
     imul      rcx, rbx
     add       rcx, rax                        ; previous digit x 10 + current digit   
     jmp       readdigit
endofdigits:
     ; check if the file isn't too large
     cmp       rcx, MAX_FILESIZE               ; limit the application to process files < 4096 bytes
                                                  ; this could be put in a config file later
     jg        SizeLimited
     ; store the hexadecimal content size
     mov       qword[contentsize], rcx 

; Reserve space in memory and read the posted content in memory on the heap
     ; reserve space on, the heap
     syscall   brk, 0
     mov       qword[oldbrkaddr], rax  ; save the address to de-allocate memory
     ; reserve memory for the posted content
     add       rax, qword[contentsize]         ; add RCX bytes to the program break          
     mov       rdi, rax
     syscall   brk
     cmp       rax, rdi
     jne       Exit                   ; if RAX = 0 then no memory is available, we exit
     ; read the params in our created buffer                                
     syscall   read, stdin, qword[oldbrkaddr], qword[contentsize]
     ; write the first part of the webform to STDOUT
     syscall   write, stdout, top, top.length
          
     ; convert all bytes in the buffer to chars
     mov       r10, 0                          ; 0 = to char, 1 = to hex
     call      ConvertBuffer
     
     ; all bytes are processed to characters, close the div and open new one
     syscall   write, stdout, middle, middle.length
     
     ;convert now convert all bytes to hexadecimal
     mov       r10, 1
     call      ConvertBuffer
     
     ; print the rest of the page to STDOUT
     mov       rdi, STDOUT
     mov       rsi, bottom
     mov       rdx, bottom.length
     mov       rax, SYS_WRITE
     syscall
     
     ; free the allocated memory
     syscall   brk, qword[oldbrkaddr]
     jmp       Exit
    
SizeLimited:
     syscall   write, stdout, sizelimited, sizelimited.length

Exit:    
     syscall   exit, 0
     
ConvertBuffer:
     mov       rsi, qword[oldbrkaddr]
     mov       rcx, qword[contentsize]
     xor       r8, r8                          ; chars in one line
.repeat:    
     xor       rax, rax
     lodsb                                     ; byte in AL
     inc       r8
     cmp       r10, 1
     je        .convert                        ; skip unprintable char replacement
     cmp       al, 0x20
     jb        .changetodot
     cmp       al, 0x7E
     jbe       .convert
.changetodot:
     mov       al, '.'
.convert:    
     push      rcx                             ; save loop counter
     push      rsi                             ; save buffer pointer
     shl       ax, 4
     shr       al, 4
     or        ax, 0x3030
     cmp       al, "9"
     jle       .phigh
     add       al, 7
.phigh:            
     cmp       ah, "9"
     jle       .pbyte
     add       ah, 7
.pbyte:
     rol       ax, 8
     cmp       r10, 1
     je        .toHex
     mov       word[charbuffer.value], ax
     mov       rsi, charbuffer
     mov       rdx, charbuffer.length
     jmp       .write
.toHex:
     mov       word[hexbuffer.value], ax
     mov       rsi, hexbuffer
     mov       rdx, hexbuffer.length
.write:
     syscall   write, stdout
     pop       rsi
     pop       rcx
     cmp       r8, COLUMNS                      ; max chars in one line
     jl        .continue
     ; print end of line
     xor       r8, r8
     push      rsi
     push      rcx
     syscall    write, stdout, break, break.length
     pop       rcx
     pop       rsi
.continue:
     dec       rcx
     cmp       rcx, 0
     jne       .repeat
     ret
