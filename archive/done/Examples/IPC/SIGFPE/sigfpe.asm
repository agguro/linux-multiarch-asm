;name:        sigfpe.asm
;
;build:       nasm "-felf64" sigfpe.asm -l sigfpe.lst -o sigfpe.o
;             ld -s -melf_x86_64 -o sigfpe sigfpe.o 
;
;description:   Floating point exception signal handler demo
;               the program get into a loop controlled by RCX. The value of RCX
;               counts down from 10 to 0, passing its value to RAX which performs
;               an IDIV on itself (IDIV RAX)
;               The loop checks if RCX reach zero and quit execution. The instruction needed
;               for this is 'jg .repeat' which 'erroneously is 'jge .repeat'.


;               
;
;Reference:   Beejs guide to IPC - http://beej.us/guide/bgipc/output/html/multipage/signals.html#catchsig
;             http://syprog.blogspot.be/2011/10/iterfacing-linux-signals.html for the 64 bit structures
;             man 7 signal

bits 64
global  _start

[list -]
    %include "unistd.inc"
    %include "signals.inc"
[list +]

section .rodata

    ; the messages
    msgDivisionByZero:      db  "Division by zero error", 10
    .len:                   equ $-msgDivisionByZero
    ; error message
    msgSignalError:         db  "sigaction error, terminating program...", 10
    .len:                   equ $-msgSignalError
    ; terminate program normally
    terminatingNormally:    db  "terminate program normally", 10
    .len:                   equ $-terminatingNormally

section .data

    SIGACTION   sigaction

section .text

_start:

    ; 
    ; initialize SIGFPE handler
    mov     rax,sigFPEHandler                       ;set handler to pointer to procSigInt
    mov     qword[sigaction.sa_handler],rax         ;in sigaction structure
    mov     rax,SA_RESTORER | SA_SIGINFO            ;sa_flags
    mov     qword [sigaction.sa_flags],rax

    ; initialize the restore routine
    mov     rax,sigFPERestorer
    mov     qword[sigaction.sa_restorer],rax
    mov     r10,NSIG_WORDS                          ;size of mask in 64 bit words
    syscall rt_sigaction,SIGFPE,sigaction,0

    ; if rax < 0 , we got an error, rax should be zero
    and     rax,rax
    js      .error

    ;Here we will count down from 10 to 0 each time dividing the counter to itself.
    ;once zero is reached we should trigger the SIGFPE signal and execute the signal action
    ;defined in ProcSIGFPE indicating a division by zero occured.
    ;There we can dump register contents as an example.

    mov     rcx,10

.repeat:
    mov     rax,rcx
.oper:  
    idiv    rax                                     ;rax=rax/rax

    ;If no exception occured continue
    dec     rcx

    ;Here we check that rcx equals zero and we must exit the loop, however we will not exit and
    ;demonstrate a wrong compare with zero.

    and     rcx,rcx
    jge     .repeat            ;must be jg instead of jge

.done:    
    jmp     .exit

    ; in case we have an error
.error:
    syscall write, stdout, msgSignalError, msgSignalError.len
    syscall exit, 0

.exit:
    syscall write, stdout,terminatingNormally,terminatingNormally.len
    ; exit the program
    syscall exit, 0

    ;SIGFPE Floating point exception handler

sigFPEHandler:

    ;rdi=signum, rsi=siginfo_t pointer, rdx=sigcontext*
    ;get the IP address where the error has occured
    mov     rax,[rdx+UCONTEXT_STRUC.uc_mcontext+SIGCONTEXT_STRUC.rip]       ;get rip where error occured
    push    rax                                                             ;save rip
    syscall write,stderr,msgDivisionByZero,msgDivisionByZero.len
    pop     rdi                                                             ;restore rip
    ret

sigFPERestorer:
    ;rdi contains the rip where the error occured
    ;save it on the stack to jump to after the excecution of this piece of code.
    push    rdi

    ; print restore action, for demo purposes
    syscall write,stderr,msgSignalError,msgSignalError.len
    xor     rcx,rcx                                         ;rcx = 0 (has changed since last syscall)
    xor     rdx,rdx                                         ;rdx = 0 for idiv rax instruction
    mov     rax,1                                           ;rax = 1 for idiv rax instruction
    ret
