;name:         forkdemo.asm
;
;build:        nasm "-felf64" forkdemo.asm -l forkdemo.lst -o forkdemo.o
;              ld -s -melf_x86_64 -o forkdemo forkdemo.o
;
;description:  This is my first attempt to play around with the fork syscall.
;              When the program starts the parent process executes, create a child process which
;              in turn fork a second child process.  Each process either parent, child1 and child2 acts like
;              a binary counter each with their own time interval and number of iterations.  Each process has
;              its own process id (what else is new) a pidok flag which indicates that the pid is already
;              converted into decimal (speed it up) and an address in memory where the routine for each process
;              respectively starts.  All this together is put in a datastructure PROCESS_STRUC.
;
;remark:       This example was made on Ubuntu 14.  The escape codes works in my terminal. If you should encounter a bad
;              layout on screen, try changing the escape codes.
;              see man 4 console_codes for the codes.

bits 64

[list -]
    %include "unistd.inc"
    %include "sys/time.inc"

    STRUC PROCESS_STRUC
        .address:     resq    1
        .PID:         resq    1
        .pidok:       resb    1
        .timer:       resq    1
        .iterations:  resq    1
    ENDSTRUC

    %macro PROCESS 5
        %define %1.address       %1+PROCESS_STRUC.address
        %define %1.PID           %1+PROCESS_STRUC.PID
        %define %1.pidok         %1+PROCESS_STRUC.pidok
        %define %1.timer         %1+PROCESS_STRUC.timer
        %define %1.iterations    %1+PROCESS_STRUC.iterations
        
        TIMESPEC timer%1,%4,%5
        
        %1: ISTRUC PROCESS_STRUC
        at    PROCESS_STRUC.address,    dq %2
        at    PROCESS_STRUC.PID,        dq 0
        at    PROCESS_STRUC.pidok,      db 0
        at    PROCESS_STRUC.timer,      dq timer%1
        at    PROCESS_STRUC.iterations, dq %3
        IEND 
    %endmacro
[list +]

section .bss

section .rodata:
    ; clear screen and hide cursor
    sClearScreen:   db  0x1B,"[H",0x1B,"[2J",0x1B,"[?25l"
        .len:       equ $-sClearScreen
    sParentWaiting: db  0x1B,"[H",0x1B,"[30C(waiting for childs to finish)",0x1B,"[H"
        .len:       equ $-sParentWaiting

    sAllChildsDone: db  0x1B,"[H",0x1B,"[30CAll childs are done, program terminated.",0x1B,"[H",0x1B,"[3B",0x1B,"[?25h"
        .len:       equ $-sAllChildsDone
    ; this error should be more in detail
    sError:         db  "An error occured",10
        .len:       equ $-sError

section .data

    sParent:        db  0x1B,"[HParent: [PID: "
        .pID:       times 20 db 0                         ; space for decimal PID
                    db  "] "
    .buffer:        db  "0"                                ; don't replace with db 0
                    db  0,0,0                              ; extra bytes for "done" "d" goes in offset .buffer
                    db  0x1B,"[H"
        .len:       equ $-sParent

    sChild1:        db  0x1B,"[H",0x1B,"[1BChild1: [PID: "
        .pID:       times 20 db 0                         ; space for decimal PID
                    db  "] "
    .buffer:        db  "0"                               ; don't replace with db 0
                    db 0,0,0                              ; extra bytes for "done" "d" goes in offset .buffer
                    db 0x1B,"[H"
        .len:       equ $-sChild1

    sChild2:        db  0x1B,"[H",0x1B,"[2BChild2: [PID: "
        .pID:       times 20 db 0                         ; space for decimal PID
                    db  "] "
    .buffer:        db  "0"                               ; don't replace with db 0
                    db  0,0,0                             ; extra bytes for "done" "d" goes in offset .buffer
                    db  0x1B,"[H"
        .len:       equ $-sChild2

; define process by name, pointer to routine, iterations, seconds, nanoseconds

    PROCESS Parent,parentProcess,15,1,0
    PROCESS Child1,child1Process,21,0,500000000
    PROCESS Child2,child2Process,15,2,0

section .text

global _start
_start:
    mov     rsi, sClearScreen
    mov     rdx, sClearScreen.len
    call    write
    syscall fork                                ; fork first child
    push    rax
    cmp     rax, 0                              ; if pid < 0 then we have an error
    jl      .error
    jnz     .forkChild2                         ; run child1 routine
    jmp     qword[Child1.address]
.forkChild2:
    syscall fork                                ; fork the second child
    cmp     rax,0                               ; if pid < 0 then we have an error         
    jl      .error
    jnz     .runParent
    jmp     qword[Child2.address]
.runParent:
    jmp     qword[Parent.address]               ; run parent routine
.error:    
    mov     rsi, sError
    mov     rdx, sError.len
    call    write
    jmp     exit

; ParentProcess
; This is just example code, the same as for the other two childs.
; If you should change the name of this routine, then change it in the structure too!

parentProcess:
    cmp     byte[Parent.pidok], 1               ; if this value is 1
    je      .start                              ; then the PID is already calculated
    syscall getpid
    mov     qword[Parent.PID], rax              ; store PID
    mov     rdi,sParent.pID                     ; buffer to store decimal PID
    call    convertToDecimal                    ; convert RAX to decimal
    mov     byte[Parent.pidok], 1               ; set flag
.start:    
    mov     rcx, qword[Parent.iterations]
.repeat:
    mov     rsi,sParent
    mov     rdx,sParent.len
    call    write
    mov     rdi,qword[Parent.timer]
    call    sleep                               ; sleep 
    xor     byte[sParent.buffer], 1
    loop    .repeat
    mov     dword[sParent.buffer],"done"
    mov     rsi,sParent
    mov     rdx,sParent.len
    call    write       
    mov     rsi,sParentWaiting
    mov     rdx,sParentWaiting.len
    call    write
    mov     rcx,2
.waitForChilds:
    call    waitForChild                        ; when one has finished wait for the next
    loop    .waitForChilds                       
    mov     rsi, sAllChildsDone                 ; until all childs are done
    mov     rdx, sAllChildsDone.len
    call    write
    jmp     exit

; Child1Process
; This is just example code, the same as for the other child and the parent process.
; If you should change the name of this routine, then change it in the structure too!

child1Process:
    cmp     byte[Child1.pidok],1               ; same as for parent
    je      .start
    syscall getpid
    mov     qword[Child1.PID],rax
    mov     rdi, sChild1.pID
    call    convertToDecimal
    mov     byte[Child1.pidok],1
.start:    
    mov     rcx, qword[Child1.iterations]
.repeat:
    mov     rsi, sChild1
    mov     rdx, sChild1.len
    call    write
    mov     rdi, qword[Child1.timer]
    call    sleep
    xor     byte[sChild1.buffer],1             ; toggle value in buffer
    loop    .repeat
    mov     dword[sChild1.buffer],"done"
    mov     rsi, sChild1
    mov     rdx, sChild1.len
    call    write
    jmp     exit

; Child2Process
; This is just example code, the same as for the other child and the parent process.
; If you should change the name of this routine, then change it in the structure too!

child2Process:
    cmp     byte[Child2.pidok],1               ; same as for parent
    je      .start
    syscall getpid
    mov     qword[Child2.PID],rax
    mov     rdi, sChild2.pID
    call    convertToDecimal
    mov     byte[Child2.pidok],1
.start:    
    mov     rcx, qword[Child2.iterations]
.repeat:
    mov     rsi, sChild2
    mov     rdx, sChild2.len
    call    write
    mov     rdi, qword[Child2.timer]
    call    sleep
    xor     byte[sChild2.buffer],1             ; toggle value
    loop    .repeat
    mov     dword[sChild2.buffer],"done"
    mov     rsi, sChild2
    mov     rdx, sChild2.len
    call    write
    jmp     exit    

; WaitForChild
; Wait for any child that is still running, if any.
waitForChild:
    push    rax
    push    rcx
    push    rdx
    push    rsi
    push    rdi
    xor     rcx, rcx
    syscall wait4,0,0,0                ; wait for child to terminate
    pop     rdi
    pop     rsi
    pop     rdx
    pop     rcx
    pop     rax
    ret

;write
;Writes a string in rsi with length rdx to stdout.
;All registers are restored.
write:
    push    rax
    push    rcx
    push    rdi
    syscall write,stdout
    pop     rdi
    pop     rcx
    pop     rax
    ret

;sleep:
;rdi contains a pointer to the TIMESPEC structure. Here we don't use the *rem timespec
;structure to store the remaining time. (in rsi).
;All registers are restored.

sleep:
    push    rax
    push    rcx
    push    rsi
    xor     rsi, rsi
    syscall nanosleep
    pop     rsi
    pop     rcx
    pop     rax
    ret

;convertToDecimal
;Converts a hexadecimal value in rax and stores it in the buffer pointed by rdi.
;All registers return unchanged except rax.

convertToDecimal:
    pushfq
    push    rdi
    push    rax
    push    rbx
    push    rdx
    add     rdi,19                 ; point to end of buffer
    mov     rbx,10                 ; base 10
    std
.repeat:    
    xor     rdx,rdx
    idiv    rbx                    ; rax = quotient, rdx = remainder
    xchg    rax,rdx                ; change quotient and remainder
    or      al,0x30                ; make ASCII
    stosb
    xchg    rax,rdx                ; restore quotient
    cmp     rax,0                  ; calculations left?
    jne     .repeat
    pop     rdx
    pop     rbx
    pop     rax
    pop     rdi
    popfq
    ret

exit:
    syscall exit, 0
