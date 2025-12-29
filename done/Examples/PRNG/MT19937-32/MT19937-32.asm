;name: MT19937-32.asm
;
;description: Mersenne twister algorithm to generate 32 bits unsigned integers.
;
;build: nasm -felf64 MT19937-32.asm -o MT19937-32.o
;       ld -melf_x86_64 -o MT19937-32 MT19937-32.o
;
;remarks: The routine GenerateNumbers can be called ,the Initialize subroutine does this
;         before returning to the caller,in case the user forgets it.
;
;source: http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/emt.html
;        http://en.wikipedia.org/wiki/Mersenne_twister

bits 64

[list -]
    %include "unistd.inc"
    %include "sys/time.inc"
[list +]

;number of numbers to generate
%define NUMBER   1000000

;macro to generate buffers in several parts in the code
;use with: BUFFER name,type,number
%macro BUFFER 3
  %1:
    %if %2=="BYTE"
        %assign n 1
    %elif %2=="WORD"
        %assign n 2
    %elif %2=="DWORD"
        %assign n 4
    %elif %2=="QWORD"
        %assign n 8
    %endif
    .start:  resb %3*n
    .end:
    .len: equ %1.end-%1.start
%endmacro

;macro to build strings
%macro STRING 2
  %1:
    .start:  db %2
    .end:
    .len: equ %1.end-%1.start
%endmacro

section .bss

    BUFFER index,"WORD",1
    BUFFER MT,"DWORD",624
    BUFFER decimalbuffer,"BYTE",20
    BUFFER testdata,"DWORD",NUMBER

section .rodata

    STRING sTitle,{"Implementation of the 32 bits Mersenne Twister.",10,"by Agguro - 2013",10}
    STRING sEOL,{10}
    STRING sSeparator,","
    STRING sSpace," "
    STRING sPeriod,"."
    STRING sSec,"s"
    STRING sExecTime,"Execution time to generate and store 1000000 integers: "

section .data

    ;time structures to calculate (more or less) the time needed to generate the list of pseudorandom numbers
    TIMESPEC   starttime
    TIMESPEC   endtime
 
section .text

global _start
_start:
    mov       rsi,sTitle
    mov       rdx,sTitle.len
    call      Write
    ;initialize the Mersenne Twister
    xor       rdi,rdi                       ;autogenerate seed for us
    call      Initialize
    ;NUMBER of random 32 bit words will be generated to measure the time needed
    mov       rcx,NUMBER
    mov       rdi,testdata
    ;get starttime
    call      GetTime
    mov       qword[starttime.tv_sec],rdx
    mov       qword[starttime.tv_nsec],rax
.next:
    push      rdi
    call      ExtractNumber
    pop       rdi
    stosd
    loop      .next
    ;get endtime
    call      GetTime
    mov       qword[endtime.tv_sec],rdx
    mov       qword[endtime.tv_nsec],rax
    ;send all integers to STDOUT
    mov       rsi,testdata
    mov       rcx,NUMBER
.nextNumber:
    xor       rax,rax                       ;clear upper 32 bits
    lodsd                                   ;load integer in EAX
    push      rsi
    call      ConvertToDecimal
    push      rcx
    push      rsi
    push      rdx
    ;right align integers with alignment length 12 bytes
    mov       rcx,rdx
    sub       rcx,12
    jz        .noalignment                  ;if no difference in length no alignment
    neg       rcx
.space:
    mov       rsi,sSpace                    ;write space to align
    call      WriteChar
    loop      .space
.noalignment:
    pop       rdx                           ;restore pointer to integer and length
    pop       rsi
    pop       rcx                           ;restore loopcounter
    call      Write
    mov       rax,rcx
    dec       rax
    mov       rbx,10
    xor       rdx,rdx
    idiv      rbx
    cmp       rdx,0                         ;if loopcounter mod 10 = 0 then tenth column
    jne       .sameline                     ;stay on same line
    mov       rsi,sEOL                      ;go to next line
    jmp       .printchar
.sameline:
    mov       rsi,sSeparator
.printchar:
    call      WriteChar
    pop       rsi
    loop      .nextNumber                   ;repeat for all numbers
    mov       rsi,sEOL                      ;end of table
    mov       rdx,1
    call      Write
    mov       rsi,sExecTime
    mov       rdx,sExecTime.len
    call      Write
    ;calculate the time difference
    ;if end nanoseconds are less than start nanoseconds we need to adjust
    mov       rax,qword[endtime.tv_nsec]
    sub       rax,qword[starttime.tv_nsec]
    cmp       rax,0
    jge       .calculate
    neg       rax
    sub       qword[endtime.tv_sec],1       ;1 second less
.calculate:
    push      rax                           ;store nanosec difference on stack
    mov       rax,qword[endtime.tv_sec]
    sub       rax,qword[starttime.tv_sec]
    call      ConvertToDecimal              ;RSI has pointer to buffer,RDX length
    call      Write
    mov       rsi,sPeriod                   ;write decimal point
    mov       rdx,1
    call      Write
    pop       rax                           ;restore nanosec difference on stack
    call      ConvertToDecimal
    cmp       rdx,9
    je        .noleadingzero
    mov       rcx,9
    sub       rcx,rdx
.leadingzero:
    dec       rsi
    inc       rdx
    mov       byte[rsi],"0"
    loop      .leadingzero
.noleadingzero:
    call      Write
    mov       rsi,sSec
    mov       rdx,1
    call      Write
.done:
    mov       rsi,sEOL
    mov       rdx,1
    call      Write
    syscall   exit,0

;Write
;Write a string pointed by RSI with length RDX to STDOUT
;All used registers are restored.
Write:
    push      rax
    push      rcx
    push      rdi
    syscall   write,stdout
    pop       rdi
    pop       rcx
    pop       rax
    ret

;WriteChar
;Write a character pointed by RSI to STDOUT
;all used registers are restored.
WriteChar:
    push      rdx
    mov       rdx,1
    call      Write
    pop       rdx
    ret

;Start of MT19937 subroutines
;Initialize
;The routine accepts a seed in RDI,if this value is zero then a seed will be generated by the
;program.
;use:      mov     rdi,[seed or 0]
;          call    Initialize
;return:   none.

Initialize:
    push    rax
    push    rbx
    push    rcx
    push    rdx
    push    rdi
    push    rsi
    mov     word[index],0                   ;initialize the index with 0
    cmp     rdi,0
    jne     .start
    call    GenerateSeed                    ;seed in RAX
    .start:
    mov     rdi,MT                          ;store pointer to MT in RDI
    mov     ecx,1                           ;start with MT[1],RCX is i
    stosd                                   ;save seed in MT[0]
    mov     rsi,rdi                         ;RDI points to MT[i]
    sub     rsi,4                           ;RSI points to MT[i-1]
    .nexti:
    push    rax                             ;MT[i-1] on stack
    ;** right shift by 30 bits(MT[i-1])
    shr     eax,30
    mov     ebx,eax
    pop     rax                             ;get M[i-1] back
    ;**  MT[i-1] xor (right shift by 30 bits(MT[i-1])
    xor     eax,ebx
    mov     ebx,0x6c078965                  ;1812433253
    xor     rdx,rdx                         ;prepare multiplication
    ;**  1812433253 * (MT[i-1] xor (right shift by 30 bits(MT[i-1]))
    imul    ebx
    ;**  1812433253 * (MT[i-1] xor (right shift by 30 bits(MT[i-1]))) + i
    add     eax,ecx
    ;**  last 32 bits of(1812433253 * (MT[i-1] xor (right shift by 30 bits(MT[i-1]))) + i)
    stosd                                   ;save M[n]  RDI
    inc     ecx                             ;i++
    cmp     ecx,623                         ;repeat until i > 623
    jle     .nexti
    call    GenerateNumbers
    pop    rsi
    pop    rdi
    pop    rdx
    pop    rcx
    pop    rbx
    pop    rax
    ret

;Generate
;The routine generates the random numbers. The Initialize subroutine calls this subroutine
;after the buffer is initialized with numbers based on the seed.

GenerateNumbers:
    push    rax
    push    rbx
    push    rcx
    push    rdx
    push    rsi
    xor     rcx,rcx
  .repeat:
    mov     rsi,MT
    mov     ebx,ecx
    shl     ebx,2                           ;offset in MT array
    ;** y = (MT[i] and 0x80000000) + (MT[(i+1) mod 624] and 0x7FFFFFFF)
    ;**** calculate MT[i] and 0x80000000
    mov     eax,dword[rsi+rbx]
    and     eax,0x80000000
    push    rax                             ;MT[i] and 0x80000000
    ;calculate MT[(i+1) mod 624] and 0x7FFFFFFF
    mov     eax,ecx                            ;
    inc     eax                             ;i+1
    mov     ebx,624
    xor     edx,edx
    idiv    ebx
    mov     ebx,edx                         ;(i+1) mod 624
    shl     ebx,2
    mov     eax,dword[rsi+rbx]
    and     eax,0x7FFFFFFF                  ;MT[(i+1) mod 624] and 0x7FFFFFFF
    pop     rbx                             ;MT[i] and 0x80000000
    add     eax,ebx                         ;y
    push    rax                             ;y on stack
    ;**** calculate MT[i] = MT[(i+397) mod 624] xor (right shift y by 1)
    shr     eax,1                           ;y SHR 1
    push    rax                             ;y SHR 1 on stack
    mov     eax,ecx                         ;i
    mov     ebx,397
    add     eax,ebx                         ;i+397
    mov     ebx,624
    xor     rdx,rdx
    idiv    ebx                             ;(i+397) mod 624
    mov     ebx,edx                         ;in RBX
    shl     ebx,2
    mov     eax,dword[rsi+rbx]              ;MT[(i+397) mod 624]
    pop     rbx                             ;y SHR 1 of stack
    xor     eax,ebx                         ;MT[(i+397) mod 624] xor (y SHR 1)
    mov     ebx,ecx
    shl     ebx,2
    and     eax,0x7FFFFFFF                  ;remove highest 33 bits
    mov     DWORD[rsi+rbx],eax              ;save MT[i]
    pop     rax                             ;y
    rcr     eax,1                           ;CF = y mod 2
    jnc     .done
    mov     eax,dword[rsi+rbx]              ;MT[i]
    xor     eax,2567483615                  ;MT[i] xor 2567483615
    and     eax,0x7FFFFFFF                  ;remove highest 33 bits
    mov     DWORD[rsi+rbx],eax
  .done:
    inc     rcx
    cmp     ecx,624
    jne     .repeat
    pop     rsi
    pop     rdx
    pop     rcx
    pop     rbx
    pop     rax
    ret

;ExtractNumber
;The routine extracts a number of the list and returns this in RAX,each 624 times it calls
;GenerateNumbers to create a new list of pseudo-random numbers.

ExtractNumber:
    push    rbx
    push    rcx
    push    rdx
    push    rsi
    xor     rax,rax
    mov     ax,word[index]
    push    rax                             ;index on stack
    inc     eax                             ;increment index
    mov     ebx,624
    xor     rdx,rdx
    idiv    ebx
    mov     word[index],dx
    pop     rbx
    cmp     ebx,0
    jne     .getnumber
    push    rbx                             ;save i
    call    GenerateNumbers
    pop     rbx                             ;restore i
.getnumber:
    mov     rsi,MT
    shl     rbx,2
    ;** int y := MT[index]
    mov     dword eax,[rsi+rbx]
    ;** y := y xor (right shift by 11 bits(y))
    mov     edx,eax
    shr     edx,11
    xor     eax,edx
    mov     edx,eax
    ;** y := y xor (left shift by 7 bits(y) and (2636928640))
    shl     edx,7
    and     edx,2636928640
    xor     eax,edx
    mov     edx,eax
    ;** y := y xor (left shift by 15 bits(y) and (4022730752))
    shl     edx,15
    and     edx,4022730752
    xor     eax,edx
    mov     edx,eax
    shr     edx,18
    ;** y := y xor (right shift by 18 bits(y))
    xor     eax,edx
    and     eax,0x7FFFFFFF                  ;extracted number
    pop     rsi
    pop     rdx
    pop     rcx
    pop     rbx
    ret

;GenerateSeed
;This is just a helper subroutine,in case you don't want to provide seeds by your own.
;The routine creates a 32 bits unsigned integer based on ClockGetTime.
;Also remember,even if RCX isn't used it is changed by the syscalls.  The stackpointer will
;be used as pointer to the TIMESPEC.
;CALLING : call CreateSeed
;IN      : none
;OUT     : seed in RAX
;Stack layout after initializing stackframe:
;RSP +  0      value of seconds
;RSP +  8      value of nanoseconds

GenerateSeed:
    push    rbp
    mov     rbp,rsp
    sub     rsp,2*8                         ;reserve 2 QWORDS
    mov     rax,SYS_CLOCK_GETTIME
    syscall clock_gettime,CLOCK_REALTIME,rsp
    mov     rax,[rsp]                       ;get seconds
    mov     rbx,[rsp+8]                     ;get nanosecs
    imul    rbx
    shl     rax,32
    shr     rax,32
    mov     rsp,rbp
    pop     rbp
    ret

;COMMON SUBROUTINES

;ConvertTodecimal
;Convert the register value in RAX to decimal ASCII and stores it in a buffer.  A pointer to
;the start of the decimal in the buffer is returned in RSI,the length in RDX.
;The purpose is to use this subroutine before writing the contents of RAX in decimal on STDOUT.
;A buffer "decimalbuffer" must be defined in the .bss or the .data section with a length
;suitable to store a decimal ASCII number in.

ConvertToDecimal:
    pushfq
    mov     rdi,decimalbuffer               ;point to decimal buffer,decimal will be there
    add     rdi,19                          ;point to end of buffer
    mov     rbx,10                          ;base 10
    std
.repeat:
    xor     rdx,rdx
    idiv    rbx                             ;RAX = quotient,RDX = remainder
    xchg    rax,rdx                         ;change quotient and remainder
    or      al,0x30                         ;make ASCII
    stosb
    xchg    rax,rdx                         ;restore quotient
    cmp     rax,0                           ;calculations left?
    jne     .repeat
    inc     rdi                             ;adjust pointer
    mov     rsi,rdi
    mov     rdx,decimalbuffer.end
    sub     rdx,rdi                         ;length of the decimal
    popfq
    ret

;GetTime
;This subroutine returns the time in RDX:RAX
;IN  : none
;OUT : RDX = seconds
;      RAX = nanoseconds

GetTime:
    push    rsi
    push    rdi
    push    rcx
    push    rbp
    mov     rbp,rsp
    sub     rsp,16                          ;reserve 2 QWORDS
    syscall clock_gettime,CLOCK_REALTIME,rsp
    mov     rdx,[rsp]                       ;seconds
    mov     rax,[rsp+8]                     ;nanoseconds
    mov     rsp,rbp
    pop     rbp
    pop     rcx
    pop     rdi
    pop     rsi
    ret
