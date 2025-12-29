;Name:         postrequest.asm
;Build:        nasm -felf64 -Fdwarf postrequest.asm -o postrequest.o
;               ld -g -melf_x86_64 postrequest.o -o postrequest
;Description:  Get the post parameters.

bits 64

[list -]
    %include "unistd.inc"
[list +]

section .bss

    oldbrkaddr:     resq  1
    contentlength:  resq  1
    buffer:         resb  1
    .length:        equ   $-buffer

section .rodata

    top:
        db 'Content-type: text/html', 0x0A, 0x0A
        db '<!DOCTYPE html><html><head><title>CGI : Get POST parameters</title></head>'
        db '<body><pre><h1>Get POST parameters</h1><br /><span>',10
    requiredVar:    
        db 'CONTENT_LENGTH'
    requiredVar.length: equ $-requiredVar    
        db ': <i><b>'
    top.length: equ $-top

    nrparams:
        db '</b></i> bytes.</span><br /><span>parameters stripped from HTTP header: <i><b>'
    nrparams.length: equ $-nrparams

    table:
        db '</b></i><br /><br />'
        db '<table align="left" width="25',0x25,'" border="0" cellpadding="0" cellspacing="0" class="params">'
        db '<tr><td><b><u>name</u></b></td><td><b><u>value</u></b></td></tr><tr><td class="name">'
    table.length: equ $-table

    newcolumn:
        db '</td><td class="value">'
    newcolumn.length: equ $-newcolumn

    middle:    
        db '</td></tr><tr><td class="name">'
    middle.length: equ $-middle

    bottom:
        db '</td></tr></table></pre></body></html>'
    bottom.length: equ $-bottom

    htmlbr:
        db '<br />'
    htmlbr.length: equ $-htmlbr    

section .text
     
global _start
_start:
    ; write the first part of the webpage
    syscall write, stdout, top, top.length
    ; adjust the stack to point to the web servers variables
    pop     rax
    pop     rax
    pop     rax
    cld
    ; let's loop through the webserver variables
.getvariable:
    pop     rsi
    or      rsi,rsi                ; done yet?
    jz      .done
    ; RDI contains a pointer to CONTENT_LENGTH the variable we are searching for
    ; look for the required variable name amongst them
    mov     rcx,requiredVar.length
    mov     rdi,requiredVar
    rep     cmpsb                   ; compare RCX bytes
    jne     .getvariable            ; no match get the next variable, if any
    ; we found the variable, parse the length of the post parameters
    ; RSI points to the = sign, increment RSI to point to the character after '='
    inc     rsi
    ; initialise rcx, rcx wil contain the hexadecimal value of CONTENT_LENGTH
    xor     rcx,rcx
.nextparamstringchar:
    xor     rax,rax
    lodsb                               ; get digit
    cmp     al,0                   ; if 0 then no digits
    je      .endofparamstring
    xor     rdx,rdx
    mov     rbx,10
    imul    rcx,rbx
    mov     byte[buffer],al
    and     al,0x0F
    add     rcx,rax                ; previous digit x 10 + current digit
    push    rsi
    push    rcx
    syscall write,stdout,buffer,buffer.length
    pop     rcx
    pop     rsi
    jmp     .nextparamstringchar
.endofparamstring:
    mov     qword[contentlength],rcx
    ; end the number of parameters in HTML
    syscall write,stdout,nrparams,nrparams.length
    ; RCX contains the content_length in hexadecimal
    ; reserve space on, the heap to store the parameters from STDIN
    syscall brk, 0
    mov     qword[oldbrkaddr],rax  ; save the address to de-allocate memory
    ; reserve memory for the parameters
    add     rax,qword[contentlength]     
    syscall brk,rax
    and     rax,rax
    jz      .done                   ; if RAX = 0 then no memory is available, now we exit
    ; read the params in our created buffer                                
    syscall read,stdin, qword[oldbrkaddr], qword[contentlength]
    ; print the entire parameterstring
    ; rsi and rdx already contains the string to print and the string length
    syscall write,stdout
    syscall write,stdout, table, table.length
    ; parse the parameter string
    mov     rsi,qword[oldbrkaddr]
.nextbyte:
    xor     rax,rax
    lodsb                               ; read byte
    push    rsi                     ; save pointer
    cmp     al,0
    je      .done                   ; if zero -> end of string
    cmp     al,'='
    je      .newcolumn              ; if '=' -> next byte is parametervalue
    cmp     al,'&'
    je      .newrow                 ; if '&' -> next byte is parametername
    mov     byte[buffer], al        ; otherwise print the byte
    ; write the character in the buffer
    mov     rsi,buffer
    mov     rdx,buffer.length
    jmp     .writechar
    ; end previous column and start new one
.newcolumn:
    mov     rsi,newcolumn
    mov     rdx,newcolumn.length
    jmp     .writechar
    ; end previous row and start new one
.newrow:
    mov     rsi,middle
    mov     rdx,middle.length
    ; write to STDOUT
.writechar:    
    syscall write,stdout
    pop     rsi
    jmp     .nextbyte
.done:
    ; free the allocated memory
    syscall brk,qword[oldbrkaddr]
    ; we are at the end of our search, print the rest of the HTML form
    syscall write,stdout, bottom, bottom.length    
    syscall exit,0
