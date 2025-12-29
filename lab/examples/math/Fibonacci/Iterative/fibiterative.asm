;name: fibiterative.asm
;
;build: nasm -felf64 fibiterative.asm -o fibiterative.o
;       ld -melf_x86_64 fibiterative.o -o fibiterative 
;
;description: calculation of Fibonacci numbers iterative,results up to 128 bits long

bits 64

%include "unistd.inc"
%include "sys/time.inc"

global _start

section .bss
    buffer:	resb    39
    .end:
    .length:    equ     $-buffer
    
section .rodata

    sTitle:     db      "Fibonacci numbers (iteration) - by Agguro - 2013",10
    .length:    equ     $-sTitle
    sSeparator: db      " : "
    .length:    equ     $-sSeparator
    sEOL:       db      10
    .length:    equ     $-sEOL
    sPeriod:    db      "."
    .length:    equ     $-sPeriod
    sSec:       db      "s",10
    .length:    equ     $-sSec
    sCount:     db      "Number of calculations: "
    .length:    equ     $-sCount
    sExecTime:  db      "Execution time : "
    .length:    equ     $-sExecTime

section .data

    TIMESPEC starttime
    TIMESPEC endtime
    
section .text

_start:
    mov     rsi,sTitle
    mov     rdx,sTitle.length
    call    Write
    
    ;initialize variables
    xor     r9,r9                  ;first number is 0
    xor     r8,r8

    ;get starttime
    call    GetTime
    mov     qword[starttime.tv_sec],rdx
    mov     qword[starttime.tv_nsec],rax
    
    xor     rdx,rdx
    xor     rax,rax
    call    WriteNumber
    call    WriteSeparator

    xor     rdx,rdx
    xor     rax,rax
    call    WriteNumber
    call    WriteEOL
    
    inc     rax                     ;second number is 1
    call    WriteNumber
    
    call    WriteSeparator
    call    WriteNumber
    call    WriteEOL
    
    mov     rcx,2		    ;set counter to 2
.repeat:
    xchg    rdx,r9                  ;swap value
    xchg    rax,r8
    add     rax,r8                  ;add value
    adc     rdx,r9
    jc      Exit
    push    rax                     ;write counter
    push    rdx
    xor     rdx,rdx
    mov     rax,rcx
    call    WriteNumber
    call    WriteSeparator
    pop     rdx
    pop     rax
    inc     rcx
    call    WriteNumber             ;show value
    call    WriteEOL
    jmp     .repeat
Exit:
    ;get endtime
    call    GetTime     
    mov     qword[endtime.tv_sec],rdx
    mov     qword[endtime.tv_nsec],rax
      
    mov     rsi,sCount
    mov     rdx,sCount.length
    call    Write
    mov     rax,rcx
    xor     rdx,rdx
    call    WriteNumber
    call    WriteEOL
    
    mov     rsi,sExecTime
    mov     rdx,sExecTime.length
    call    Write
    
    ;calculate the time difference
    ;if end nanoseconds are less than start nanoseconds we need to adjust
    mov     rax,qword[endtime.tv_nsec]
    sub     rax,qword[starttime.tv_nsec]
    cmp     rax,0
    jge     .calculate
    neg     rax
    sub     qword[endtime.tv_sec],1	    ;1 second less     
.calculate:
    push    rax                             ;store nanosec difference on stack
    mov     rax,qword[endtime.tv_sec]
    sub     rax,qword[starttime.tv_sec]
    xor     rdx,rdx
    call    Bits128ToDecimal                ;RSI has pointer to buffer,RDX length
    call    Write
    mov     rsi,sPeriod                     ;write decimal point
    mov     rdx,1
    call    Write
    pop     rax                             ;restore nanosec difference on stack
    xor     rdx,rdx
    call    Bits128ToDecimal
    cmp     rdx,9
    je      .noleadingzero
    mov     rcx,9
    sub     rcx,rdx
.leadingzero:      
    dec     rsi
    inc     rdx
    mov     byte[rsi],"0"
    loop    .leadingzero
.noleadingzero:
    call    Write     
    mov     rsi,sSec
    mov     rdx,sSec.length
    call    Write
    syscall exit,0  
    
;*********************************************************************************************** 
;WriteNumber
;-----------
;Convert and write a 128 bit number in RDX:RAX to STDOUT
;***********************************************************************************************
WriteNumber:
    push    rdx
    push    rax
    call    Bits128ToDecimal
    call    Write
    pop     rax
    pop     rdx
    ret
;*********************************************************************************************** 
;WriteEOL
;-----------
;Write an EOL char to STDOUT
;***********************************************************************************************
WriteEOL:
    push    rsi
    push    rdx
    mov     rsi,sEOL
    mov     rdx,sEOL.length
    call    Write
    pop     rdx
    pop     rsi
    ret
;*********************************************************************************************** 
;WriteSeparator
;--------------
;Write the separator between the counter and the fibonaccinumber
;***********************************************************************************************
WriteSeparator:
    push    rsi
    push    rdx
    mov     rsi,sSeparator
    mov     rdx,sSeparator.length
    call    Write
    pop     rdx
    pop     rsi
    ret    
;***********************************************************************************************
;Bits128ToDecimal
;----------------
;IN : RDX:RAX is number to convert
;OUT : RSI pointer to first digit in buffer
;      RDX length of decimal number
;***********************************************************************************************
Bits128ToDecimal:
    push    rax
    push    rbx
    push    rcx
    push    rdi
    push    r8
    push    rbp                             ;create stackframe
    mov     rbp,rsp
    sub     rsp,24                          ;four help variables to store four 32 bit registers
    ;prepare help registers
    mov     r8,rax
    shl     r8,32
    shr     r8,32
    mov     qword[rsp],r8                  ;32 lowest bits in [rsp]
    shr     rax,32
    mov     qword[rsp+8],rax               ;next 32 bits in [rsp+8]
    mov     r8,rdx
    shl     r8,32
    shr     r8,32
    mov     qword[rsp+16],r8               ;next 32 bits in [rsp+16]
    shr     rdx,32
    mov     qword[rsp+24],rdx              ;32 highest bits in [rsp+8]
    mov     rdi,buffer.end-1                ;point to last byte in buffer
    xor     rcx,rcx                         ;digit counter  
.repeat:
    mov     rbx,4
.checkNextDigit:
    dec     rbx                             ;point to 32 bits value on stack
    mov     rax,qword[rsp+rbx*8]           ;load 32 bits
    cmp     rax,0                           ;are 32 bits zero?
    jnz     .convert
    cmp     rbx,0
    jne     .checkNextDigit
    cmp     rcx,0                           ;already digits converted?
    jne     .adjustPointer                  ;yes,stop
    mov     byte[rdi],"0"
    mov     rcx,1
    jmp     .exit
.convert:
    ;convertion                             ;not zero,convert
    xor     rdx,rdx                         ;prepare for division
    push    rbx                             ;store 32 bits pointer
    mov     rbx,10                          ;base 10
    idiv    rbx                             ;RAX = quotient,RDX = remainder
    pop     rbx                             ;restore 32 bits pointer
    mov     qword[rsp+rbx*8],rax           ;store quotient back
    cmp     rbx,0                           ;last set of 32 bits?
    je      .isLastDigit                    ;yes
    shl     rdx,32                          ;no,adjust remainder
    add     qword[rsp+rbx*8-8],rdx         ;and add to next set
    jmp     .checkNextDigit                 ;and continue convertion
.isLastDigit:
    add     dl,"0"                          ;if last digit then make ASCII
    mov     byte[rdi],dl                   ;and store in buffer
    dec     rdi                             ;adjust buffer
    inc     rcx                             ;increment number of digits
    jmp     .repeat                         ;repeat
.adjustPointer:
    inc     rdi                             ;adjust buffer
.exit:
    mov     rsi,rdi                         ;RSI is pointer to buffer with decimal number
    mov     rdx,rcx                         ;RDX is number of digits in decimal number
    mov     rsp,rbp
    pop     rbp                             ;leave stackframe
    pop     r8                              ;restore registers
    pop     rdi
    pop     rcx
    pop     rbx
    pop     rax
    ret
;***********************************************************************************************
;Write
;-----
;Write a string pointed by RSI with length RDX to STDOUT
;***********************************************************************************************
Write:
    push    rcx
    push    rdi
    push    rax
    syscall write,stdout
    pop     rax
    pop     rdi
    pop     rcx
    ret
;***********************************************************************************************
;GetTime
;-------
;This subroutine returns the time in RDX:RAX
;IN  : none
;OUT : RDX = seconds
;      RAX = nanoseconds
;***********************************************************************************************
GetTime:
    push    rsi
    push    rdi
    push    rcx
    push    rbp
    mov     rbp,rsp
    sub     rsp,16				;reserve 2 QWORDS
    syscall clock_gettime,CLOCK_REALTIME,rsp
    mov     rdx,[rsp]                           ;seconds
    mov     rax,[rsp+8]                         ;nanoseconds
    mov     rsp,rbp
    pop     rbp    
    pop     rcx
    pop     rdi
    pop     rsi
    ret
;***********************************************************************************************
