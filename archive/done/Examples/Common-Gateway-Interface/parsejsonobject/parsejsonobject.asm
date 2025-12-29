;Name:        parsejsonobject.asm
;
;Build:       nasm -felf64 parsejsonobject.asm -o parsejsonobject.o
;             ld -s -melf_x86_64 -o parsejsonobject parsejsonobject.o
;
;Description: reply data in the form of a JSON object.  After building this application,you need
;             to upload this to your webservers cgi root folder.
;
 
bits 64

[list -]
     %include "unistd.inc"
[list +]

section .bss

    oldbrkaddr:     resq 1
    charbuffer:     resb 1
    content:        resq 1   ; memory to store content len in
    
section .rodata

    requestmethod:  db   "REQUEST_METHOD=POST"
    .len:           equ  $-requestmethod
    contentlength:  db   "CONTENT_LENGTH="
    .len:           equ  $-contentlength
    top:            db   'Content-type: text/html',0x0A,0x0A,'{"'
    .len:           equ  $-top
    middle:         db   '":"'
    .len:           equ  $-middle    
    separator:      db   '","'
    .len:           equ  $-separator
    bottom:         db   '"}'
    .len:           equ  $-bottom

section .text

global _start
_start:
    ;first check if the form was posted
    ;adjust stack to environment parameters
    pop	    rax
    pop     rax
    pop     rax
    mov     rbp,rsp			;save begin of list in rbp
    ;let's loop through the webserver variables,searching for REQUEST_METHOD=POST
    cld
.getrequestmethod:
    pop     rsi
    or      rsi,rsi			;done yet?
    jz      .exit			;we didn't find the REQUEST_METHOD=POST string   
    ;RDI contains a pointer to CONTENT_LENGTH=POST the variable we are searching for
    ;look for the required variable name amongst them
    mov     rcx,requestmethod.len
    mov     rdi,requestmethod
    rep     cmpsb			;compare RCX bytes
    jne     .getrequestmethod		;no match get the next variable,if any
    ;we got a match,now read the CONTENT_LENGTH
    ;restore top of (list-1)
    mov     rsp,rbp
    cld					;just in case
.getcontentlength:
    pop     rsi
    or      rsi,rsi			;done yet
    jz      .exit			;this shouldn't occur
    ;RDI contains a pointer to CONTENT_LENGTH= the variable we are searching for
    mov     rcx,contentlength.len
    mov     rdi,contentlength
    rep     cmpsb			;compare RCX bytes
    jne     .getcontentlength		;no match get the next variable,if any
    ;we got the CONTENT_LENGTH=,RSI points to the first character of the ASCII digit of the length
    ;initialise rcx
    xor     rcx,rcx
.nextparamstringchar:
    xor     rax,rax
    lodsb				;get digit
    and     al,al			;if 0 then no digits
    je      .endofparamstring
    xor     rdx,rdx
    mov     rbx,10
    imul    rcx,rbx
    and     al,0x0F
    add     rcx,rax			;previous digit x 10 + current digit    
    jmp     .nextparamstringchar
.endofparamstring:   
    ;RCX contains the content_length in hexadecimal
    ;reserve space on,the heap to store the parameters from STDIN
    mov     qword[content],rcx
    syscall brk,0
    mov     qword[oldbrkaddr],rax	;save the address to de-allocate memory
    ;reserve memory for the parameters
    add     rax,qword[content]          ;add contentlength to the program break
    syscall brk,rax
    cmp     rax,0
    je      .exit			;if RAX = 0 then no memory is available,now we exit
    ;read the params in our created buffer
    syscall read,stdin,qword[oldbrkaddr],qword[content]
    ;start the output of the data as a JSON object
    syscall write,stdout,top,top.len
    ;parse the data to a JSON object
    ;loop through the data until '='
    mov     rsi,qword[oldbrkaddr]
    cld
.repeat:    
    lodsb
    and     al,al
    jz      .endloop
    cmp     al,"="
    je      .printmiddle
    cmp     al,"&"
    je      .printseparator
    cmp     al,"+"
    jne     .printchar
    ;+ will be replaced by space
    mov     al," "
.printchar:    
    push    rsi			;rsi on stack    
    ;print the character
    mov     byte[charbuffer],al
    syscall   write,stdout,charbuffer,1
    pop     rsi
    jmp     .repeat
.printmiddle:
    push    rsi
    syscall write,stdout,middle,middle.len
    pop     rsi
    jmp     .repeat
.printseparator:
    push    rsi
    syscall write,stdout,separator,separator.len
    pop     rsi
    jmp     .repeat
.endloop:     
    syscall write,stdout,bottom,bottom.len
    ;release the reserved memory
    ;free the allocated memory
    syscall brk,qword[oldbrkaddr]
    ;and exit the program
.exit:
    syscall exit,0
