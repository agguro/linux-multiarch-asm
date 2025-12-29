;Name:        pipedemo6.asm
;
;Build:       nasm -felf64 pipedemo6.asm -l pipedemo6.lst -o pipedemo6.o
;             ld -s -melf_x86_64 -o pipedemo6 pipedemo6.o 
; 
;Description: Most examples about pipes with fork are about how a parent reads from a child
;             process and put the result on screen.  All these examples requires a buffer of
;             fixed size.  This time we send the data one byte at once through the pipe.
;             As extra in this demonstration we let the parent inform the client that his work is done
;             and that the client can terminate too.  When child terminates his job, the parent terminates
;             too and the demo ends.  It's a technique I found on stackoverflow to avoid the child to end
;             his job before the parent has ended his.
;             Don't be confused however, the example works without the extra pipe.
;
;Source:      http://stackoverflow.com/questions/12649170/c-pipe-parent-to-read-from-child-before-child-ends

bits 64

[list -]
    %include "unistd.inc"
[list +]

section .bss
    
    ; first pipe for child-parent communication
    p0:
    .read:      resd    1                     ; read end
    .write:     resd    1                     ; write end
    
    ; second pipe for parent-child communication, this one informs our child to
    ; stop execution and exit.
    p1:
    .read:      resd    1                     ; read end
    .write:     resd    1                     ; write end
     
    ; at least one byte for our buffer is needed to read byte by byte from child process
    buffer:     resb    1
        
section .data
        
    message:       db      10, "One of the fundamental features that makes Linux and other Unices useful is the 'pipe'.", 10
                   db      "Pipes allow separate processes to communicate without having been designed explicitly to work together.", 10
                   db      "This allows tools quite narrow in their function to be combined in complex ways.", 10
                   db      "In this example the child process reads this message and writes it into the write end of the first pipe, one by one.", 10
                   db      "The parent process will read the bytes from the read end of the first pipe and writes it to STDOUT, one by one.", 10
                   db      "When all bytes are read the parent informs the child that it can terminate by writing into the second pipe.", 10, 0
     
    datareceived:  db      10, "--- end of data ---", 10
    .length:       equ     $-datareceived
    pipeerror:     db         "pipe call error"
    .length:       equ     $-pipeerror
    forkerror:     db      "fork error"
    .length:       equ     $-forkerror
        
section .text
    
global _start
_start:

    ; create pipe for child-parent communication
    syscall pipe, p0
    js      errorpipe       ; on error inform user and exit program
    ; create pipe for parent-child communication
    syscall pipe, p1
    js      errorpipe       ; on error inform user and exit program
    
    ; so far, so good now clone our program with fork
    syscall fork
    and     rax, rax
    js      errorfork       ; if rax < 0 then inform user of error and exit
    jnz     parent
    
; here the child process starts
child:
    ; close read end of p0 (child to parent
    mov     edi, dword[p0.read]
    syscall close, rdi
    ; close write end of 2nd pipe
    mov     edi, dword[p1.write]
    syscall close, rdi

; we are going to put the bytes one at the time in the write end of p0

    ; read start address of message
    mov     rsi, message            ; leave this before the start of the loop
.repeat:
    lodsb                           ; read byte in al
    and     al, al                  ; when al is zero then we've reached end of message
    jz      .done
    mov     byte[buffer], al
    ;inc     rsi                    ; next byte in message
    push    rsi
    ; write byte into p0
    mov     edi, dword[p0.write]
    syscall write, rdi, buffer, 1
    pop     rsi                     ; restore byte offset
    jmp     .repeat
.done:

    ; close write end of p0
    mov     edi, dword[p0.write]
    syscall close, rdi
    
    ; Let the child wait until it can read a byte from the second pipe. As long as
    ; there is nothing in the pipe, the syscall read seems to hang.  When the parent
    ; writes a byte in it, the child process continues and exits.  From then the parent
    ; is informed and terminates too.
    mov     edi, dword[p1.read]
    syscall read, rdi, buffer, 1
    
    ; here we have received something from the parent, so we know that the parent
    ; is done with his job, so the cild can terminate too. Once the child exits his
    ; process, the wait syscall in the parents process will be triggered and the parent
    ; knows that the child is done too.  The parent process can be terminated too.
    syscall exit, 0
    
; here the parent process starts    
parent:
    ; close write end of first pipe p0
    mov     edi, dword[p0.write]
    syscall close, rdi
    ; close the read end of second pipe
    mov     edi, dword[p1.read]
    syscall close, rdi
    
; here we are going to repeat reading data from p0 one byte at the time and writing it to stdout
; when the result, of the read syscall in rax, is zero, we can terminate the loop and inform the
; child that he can terminate.
.repeat:
    ; read message from first pipe
    mov     edi, dword[p0.read]
    syscall read, rdi, buffer, 1
    ; if nbytesReceived in rax is zero then we terminate this loop
    and     rax, rax
    jz      allReceived
    ; write to stdout
    syscall write, stdout, buffer, 1
    jmp     .repeat
    ; rax is zero, all bytes are received.
allReceived:
    ; write the received data on screen
    syscall write, stdout, datareceived, datareceived.length

    ; close read end of first pipe
    mov     edi, dword[p0.read]
    syscall close, rdi

    ; write into second pipe to inform child that it can terminate
    ; don't forget this or your program waits into enternity
    mov     edi, dword[p1.write]
    syscall write, rdi, buffer, 1

    ; wait for child to exit
    syscall wait4, 0, 0, 0
    ; exit
    syscall exit, 0

errorpipe:
    syscall write, stdout, pipeerror, pipeerror.length
    syscall exit, 0
errorfork:
    syscall write, stdout, forkerror, forkerror.length
    syscall exit, 0
