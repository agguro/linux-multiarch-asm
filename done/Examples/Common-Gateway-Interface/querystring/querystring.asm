;Name:        querystring.asm
;
;Build:       nasm -felf64 -o querystring.o querystring.asm
;             ld -melf_x86_64 querystring.o -o querystring
;
;Description: Get the URL parameters and displays them in a HTML table.

bits 64

[list -]
    %include "unistd.inc"
[list +]

section .bss

    buffer:  resb    1
    .len: equ $-buffer

section .rodata

    top:         db 'Content-type: text/html',0x0A,0x0A
                 db '<!DOCTYPE html><html><head><title>CGI : Get URL parameters</title></head>'
                 db '<body><pre><h1>Get URL parameters</h1>'
    .len:     equ $-top
    tabletop:    db '<table align="left" width="25',0x25,'" border="0" cellpadding="0" cellspacing="0" class="params">'
                 db '<tr><td><b><u>name</u></b></td><td><b><u>value</u></b></td></tr><tr><td class="name">'
    .len:     equ $-tabletop
    newcolumn:   db '</td><td class="value">'
    .len:     equ $-newcolumn
    middle:      db '</td></tr><tr><td class="name">'
    .len:     equ $-middle
    noparams:    db '<b>no url parameters</b>'
    .len:     equ $-noparams
    tablebttm:   db '</td></tr></table>'
    .len:     equ $-tablebttm
    bottom:      db '</pre></body></html>'
    .len:     equ $-bottom
    htmlbr:      db '<br />'
    .len:     equ $-htmlbr    
    requiredVar: db 'QUERY_STRING'
    .len:     equ $-requiredVar

section .text

global _start       
_start:
    ; write the first part of the webpage
    mov     rsi,top
    mov     rdx,top.len
    call    .write
    ; adjust the stack to point to the web servers variables
    pop     rax
    pop     rax
    pop     rax
    cld
    ; let's loop through the webserver variables
.getvariable:
    pop     rsi
    or      rsi,rsi                             ;done yet?
    je      .done    
    ; RSI contains a pointer to a variable string
    ; look for the required variable name amongst them
    mov     rcx,requiredVar.len
    mov     rdi,requiredVar
    rep     cmpsb                               ;compare RCX bytes
    jne     .getvariable                        ;no match get the next variable,if any
    ; we found the variable   
    ; determine the len of the parameterstring,
    ; RSI points to the '=' character,therefore we adjust the counter RCX at the end
    xor     rcx,rcx
    mov     rbx,rsi
.nextparamstringchar:    
    lodsb
    cmp     al,0
    je      .endofparamstring
    inc     rcx
    jmp     .nextparamstringchar
.endofparamstring:
    ; we reached the end of the parameterstring,restore RSI. if len = 0 then there aren't
    ; parameters and we show that instead of the parameters.
    dec     rcx                                 ;len = rcx - 1 for '='
    cmp     rcx,0
    je      .noparameters        
    push    rcx
    push    rbx
    ; print top of table
    mov     rsi,tabletop
    mov     rdx,tabletop.len
    call    .write
    pop     rbx
    pop     rcx
    ; parse the parameterstring
    mov     rsi,rbx                             ;rsi points to the first '='
    inc     rsi
.getparamchar:    
    xor     rax,rax
    lodsb                                       ;read byte
    cmp     al,0                                ;if zero then string end
    je      .tablebottom
    push    rsi                                 ;save rsi
    cmp     al,'='                              ;start with value
    je      .newcolumn
    cmp     al,'&'                              ;new parameter
    je      .newrow      
    mov     byte[buffer],al
    mov     rsi,buffer
    mov     rdx,buffer.len
    jmp     .getnextparam
.newcolumn:
    mov     rsi,newcolumn
    mov     rdx,newcolumn.len
    jmp     .getnextparam
.newrow:
    mov     rsi,middle
    mov     rdx,middle.len
.getnextparam:        
    call    .write
    pop     rsi                                 ;restore rsi
    jmp     .getparamchar
.tablebottom:       
    mov     rsi,tablebttm
    mov     rdx,tablebttm.len
    call    .write
    jmp     .done   
.noparameters:
    mov     rsi,noparams
    mov     rdx,noparams.len
    call    .write
.done:    
    ; we are at the end of our search,print the rest of the HTML form
    ; write the second part of the webpage
    mov     rsi,bottom
    mov     rdx,bottom.len
    call    .write
    syscall exit,0
.write:
    syscall write,stdout
    ret
