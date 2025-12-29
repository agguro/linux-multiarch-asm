;name: xorshift.asm
;
;description: Create pseudo random number x in an interval [a,b] using the
;             XorShift pseudo random generator from George Marsaglia.
;
;build: nasm -felf64 -Fdwarf -o xorshift.o xorshift.asm
;       ld -melf_x86_64 -g -o xorshift xorshift.o
;
;source: http://en.wikipedia.org/wiki/Xorshift
;
;remark: produced numbers and count for each is displayed to stdout

bits 64

[list -]
    %include "unistd.inc"
[list +]

;255 is maximum number for this program
%define MAXNUMBERS  255
;linefeed
%define LF          10

section .bss
    buffer:         resb 1
    
section .data
    random:         db  "0"
    .len:           equ $-random
    ; the array to store the frequency of each individual number
    table:          times 9 db 0
    tableline1:     db  "number of generated "
    .len:           equ $-tableline1
    tableline2:     db  "'s : "
    .len:           equ $-tableline2
     
section .text

global _start       
_start:
    mov     rcx,MAXNUMBERS                  ;initialize outer-loop counter
.repeat:      
    push    rcx
    mov     rdi,random                      ;bufferaddress in RDI
    ;generate numbers in the interval [1,9]
    mov     rax,1                           ;lower boundary of interval
    mov     rdx,9                           ;higher boundary of interval
    call    generateRandom
    ;adjust table with counts for each generated number
    mov     rdx,rax                         ;number in RDX
    mov     rsi,table
    add     rsi,rdx                         ;point to the right place in the table
    dec     rsi
    inc     byte[rsi]                       ;increment position in table
    ;convert the number to ASCII
    ;depending the number length needed we convert the number of needed bits in ASCII hexadecimal
    ;in this example I only use the lowest nibble of RAX since the interval is [1,9]
    call    nibble2hexascii
    cld
    stosb
    syscall write,stdout,random,random.len  
    pop     rcx                             ;restore outer-loop counter
    dec     rcx
    and     rcx, rcx
    jz      .printStatistics
    push    rcx                             ;syscall changes RCX !!
    mov     al, ","
    call    writeChar
    pop     rcx
    jmp     .repeat
.printStatistics:
    mov     al,LF
    call    writeChar
    mov     rcx,9
    mov     rsi,table
.nextLine:
    push    rsi
    mov     rsi,tableline1
    mov     rdx,tableline1.len
    call    writeLine      
    mov     rax,10
    sub     rax,rcx
    call    byte2decascii
    call    writeDecimal
    mov     rsi,tableline2
    mov     rdx,tableline2.len
    call    writeLine
    pop     rsi
    xor     rax,rax
    lodsb
    call    byte2decascii
    call    writeDecimal
    mov     al,LF
    call    writeChar
    loop    .nextLine
    syscall exit,0
    
generateRandom:
;in rax : lower boundary of interval
;   rdx : higher boundary of interval
    ;calculate interval len
    dec     rax             ;minus one so we can have value for lower boundary too
    push    rax             ;save lower boundary
    clc
    sub     rdx,rax         ;calculate interval len
    mov     rbx,rdx         ;put in RBX
    ; generate seed
    rdtsc                   ;read cpu time stamp counter
    rol     rdx,32          ;mov EDX in high 32 bits of RAX
    or      rax,rdx         ;RAX = seed
    call    xorShift        ;get a pseudo random number from seed
    ; create random number rax <= number <= rdx
    xor     rdx,rdx
    idiv    rbx             ;rax = rax \ rbx
    cmp     rdx,0
    jnz     .skip
    add     rdx,rbx
.skip:
    pop     rax             ;restore lower boundary
    add     rdx,rax         ;add lower boundary to random number
    mov     rax,rdx         ;rax is number in interval [rax,rdx]
    ret

;XORSHIFT algorithm
xorShift:
    mov     rdx,rax        
    shl     rax,13
    xor     rax,rdx
    mov     rdx,rax
    shr     rax,17
    xor     rax,rdx
    mov     rdx,rax
    shl     rax,5
    xor     rax,rdx         ;rax random 64 bit value
    ret
    
;write a decimal in eax to STDOUT
writeDecimal:
    ror     eax,16
    and     al,al
    jz      gettenthts
    call    writeChar
gettenthts:
    rol     eax,8
    and     al, al
    jz      getdigits
    call    writeChar
getdigits:
    rol     eax,8
    call    writeChar
    ret
    
;write a character in al to stdout
writeChar:
    push    rdx
    push    rsi
    mov     byte[buffer],al
    mov     rdx,1
    mov     rsi,buffer
    jmp     writeLine.write
    
;write a string pointed by rsi with len rdx to stdout
writeLine:
    push    rdx
    push    rsi
.write:
    push    rdi
    push    rcx
    push    rax
    syscall write, stdout
    pop     rax
    pop     rcx
    pop     rdi
    pop     rsi
    pop     rdx
    ret

;convert a byte in AL to its decimalk ASCII equivalent in EAX
byte2decascii:
;in  :: AL  = BYTE or 8 bits
;out :: EAX = lowest 24 bits are Decimal ASCII of BYTE
    push    rbx
    push    rcx
    push    rdx
    push    r8
    xor     rcx,rcx
    xor     r8,r8
    mov     rbx,10
.l1:      
    xor     rdx,rdx
    idiv    rbx
    or      dl,"0"
    shrd    r8,rdx,8
    inc     rcx
    and     al,al
    jnz     .l1
    shl     rcx,3
    shld    rax,r8,cl
    pop     r8
    pop     rdx
    pop     rcx
    pop     rbx
    ret

;convert a nibble in AL to its hexadecimal ASCII equivalent in AL
nibble2hexascii:
;in  :: AL = NIBBLE or 4 bits (least significant)
;out :: AL = Hexadecimal ASCII of NIBBLE
    and     al,0x0F
    or      al,"0"
    cmp     al,"9"
    jbe     .l1
    add     al,7
.l1:
    ret
