;name: arguments.asm
;
;description: Read the number of arguments and if any write it to stdout.
;
;build: nasm -felf64 arguments.asm -o arguments.o
;   ld -melf_x86_64 arguments.o -o arguments  

bits 64

    %include "unistd.inc"

global _start
    crlf:      equ  10

section .bss
    buffer:    resb 20                  ;reserve 20 bytes as a buffer
        
section .rodata

    msgArgc:   db   "argc        : ",0
    msgProg:   db   "Programname : ",0
    msgArgv:   db   "argv[]      : ",0
        
section .text

_start:
    ;write message and argc as unsigned integer to STDOUT
    mov     rsi, msgArgc                ;write first line
    call    Write.string
    
    ;convert the value of argc in unsigned integer ASCII
    pop     rax                         ;get argc of stack
    dec	    rax                         ;number of arguments is rax minus one
    mov     rcx, rax                    ;initialize RCX as counter (argc)
    call    Convert                     ;convert RAX into unsigned integer ASCII
    call    Write.string                ;write the unsigned integer
    mov     al,crlf                     ;end of line
    call    Write.char
    
    ;write message and the programname to STDOUT
    mov     rsi, msgProg                ;write second line
    call    Write.string       
    pop     rsi                         ;get programname from stack
    call    Write.string                ;write the programname
    mov     al,crlf                     ;end of line
    call    Write.char
    ;write message and all arguments to STDOUT
    mov     rsi, msgArgv
    call    Write.string
    cmp     rcx, 0                      ;are there arguments?
    je      .endOfArgs                  ;no arguments, nothing to show
.nextArg:
    pop     rsi
    call    Write.string
    cmp     rcx,1
    je      .endOfArgs
    mov     al,' '
    call    Write.char
.noSpace:       
    loop    .nextArg

.endOfArgs:     
    mov     al,crlf
    call    Write.char
Exit:
    syscall exit, 0

Write:
.string:
    cld                                 ;make sure we count upwards in memory
    lodsb                               ;load byte from RSI:RAX in AL
    and     al,al                       ;if zero then end of ASCIIZ string
    je      .done
    call    Write.char
    jmp     .string
.char:
    push    rsi
    push    rcx
    mov     rsi,buffer
    mov     byte [buffer],al
    syscall write,stdout,buffer,1       
    xor     rdx, 1
    jnz     .done
    mov     byte[rsi],0
    pop     rcx
    pop     rsi                         ;restore used registers
.done:
    ret

Convert:
    mov     rsi,buffer+19
    mov     rbx,10
.repeat:
    xor     rdx,rdx                     ;the remainder
    div     rbx                         ;divide RAX by 10, remainder in RDX
    or      dl,0x30                     ;convert to ASCII
    mov     byte[rsi],dl                ;remainder in byte pointed to by RSI
    and     rax, rax                    ;quotient = 0? 
    je      .done                       ;yes, stop converting
    dec     rsi
    jmp	    .repeat
.done:
    ret
