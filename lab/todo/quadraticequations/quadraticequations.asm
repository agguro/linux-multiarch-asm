; Name:         quadraticequations.asm
; Build:        nasm -felf64 quadraticequations.asm -l quadraticequations.lst -o quadraticequations.o
;               ld -s -melf_x86_64 -o quadraticequations quadraticequations.o
; Description:  Generates a quadratic equation from a given squareroot of D,x1 and x2, all integers.

bits 64

[list -]
    %include "unistd.inc"
    %include "fraction.class"
[list +]

section .bss
    contentlength:  resq    1
    envparams:      resq    1
    signbuffer:     resb    1
    integerbuffer:  resb    20
    
section .data
request_method: db  "REQUEST_METHOD"
.len:           equ $-request_method
content_length: db  "CONTENT_LENGTH"
.len:           equ $-content_length
post:           db  "POST"
.len:           equ $-post
d:              db  "d="
.len:           equ $-d
.start:         dq  0
.size:          dq  0
.value:         dq  0
.ascii:         times 20 db 0
.ascstart:      dq  0
.asclen:        dq  0

x1:             db  "x1="
.len:           equ $-x1
.start:         dq  0
.size:          dq  0
.value:         dq  0
.ascii:         times 20 db 0
.ascstart:      dq  0
.asclen:        dq  0

x2:             db  "x2="
.len:           equ $-x2
.start:         dq  0
.size:          dq  0
.value:         dq  0
.ascii:         times 20 db 0
.ascstart:      dq  0
.asclen:        dq  0

ampersand:      db  "&"

minus:          db  "-"
.len:           equ $-minus
plus:           db  "+"
.len:           equ $-plus
division:       db  "/"
.len:           equ $-division
xx:             db  "x²"
.len:           equ $-xx
x:              db  "x"
.len:           equ $-x
equals:         db  "=0"
.len:           equ $-equals



httpheader:     db  'Content-type: text/html',0x0A,0x0A
.len:           equ $-httpheader
JSONObject:
    .part1:     db  '{"d":"'
    .part1.len: equ $-JSONObject.part1
    .part2:     db  '","x1":"'
    .part2.len: equ $-JSONObject.part2
    .part3:     db  '","x2":"'
    .part3.len: equ $-JSONObject.part3
    .part4:     db  '","equation":"'
    .part4.len: equ $-JSONObject.part4
    .part5:     db  '"}'
    .part5.len: equ $-JSONObject.part5
htmleol:        db  "<br><br>"
.len:           equ $-htmleol

middle:
          db   '":"'
.length:  equ  $-middle    

separator:
          db   '","'
.length:  equ  $-separator

bottom:
          db   '"}'
.length:  equ  $-bottom

FRACTION a
FRACTION b
FRACTION c

equation:
    .xx:        db  "x²"
    .xxlen:     equ $-equation.xx
    .x:         db  "x"
    .xlen:      equ $-equation.x
    .zero:      db  "=0"
    .zerolen:   equ $-equation.zero
    .astart:    db  "a("
    .astartlen: equ $-equation.astart
    .aend:      db  ")=0 for any a in R"
    .aendlen:   equ $-equation.aend
    .basic:     db  "ax²=0"
    .basiclen:  equ $-equation.basic

rooterror:
.unequal:       db  "if D=0, x1 and x2 cannot be the different."
.unequallen:    equ $-rooterror.unequal
.equal:         db  "if D<>0, x1 and x2 cannot be the equal."
.equallen:      equ $-rooterror.equal
    
    
divsign: db "/"
eol:     db 10

section .text
     global _start

_start:
    ;initialize the cgi environment
    call    CgiInit
    call    IsPostBack
    and     rax,rax
    jz      .nopostback
    ;syscall write,stdout,postback,postback.len
    call    GetContentLength
    ;content length is in rax, reserve memory on heap to load the posted parameters
    mov     r15,rax                                     ;save content length
    inc     r15                                         ;extra byte for trailing &
    syscall brk,0                                       ;get start of heap
    mov     r14,rax                                     ;save start of heap
    add     rax,r15                                     ;add bytes to heapaddress
    syscall brk,rax                                     ;reserve memory
    syscall read,stdin,r14,r15                          ;read posted parameterstring
    add     rax,r14
    mov     byte[rax],"&"                               ;trailing ampersand at the end
    
    ;get d
    mov     rdi,d
    mov     rsi,d.len
    mov     rdx,r14                                     ;start of postparams
    mov     rcx,r15                                     ;length of postparams
    call    GetPostParam       
    mov     qword[d.start],rax
    mov     rdi,rax
    call    GetPostValueLength
    mov     qword[d.size],rax
    mov     rdi,qword[d.start]                          ;start of integer in rdi
    mov     rsi,rax                                     ;length of integer in rsi
    call    CheckParameter
    mov     qword[d.start],rax
    mov     qword[d.size],rdx
    mov     rdi,qword[d.start]                          ;convert string to integer
    mov     rsi,qword[d.size]
    
    call    StringToInteger
    mov     qword[d.value],rax
    mov     rdi,qword[d.value]
    mov     rsi,d.ascii
    call    IntegerToString
    mov     qword[d.ascstart],rax
    mov     qword[d.asclen],rdx
    
    ;get x1
    mov     rdi,x1
    mov     rsi,x1.len
    mov     rdx,r14                                     ;start of postparams
    mov     rcx,r15                                     ;length of postparams
    call    GetPostParam       
    mov     qword[x1.start],rax                         ;rsi points to value of post parameter
    mov     rdi,rax
    call    GetPostValueLength
    mov     qword[x1.size],rax
    mov     rdi,qword[x1.start]                         ;start of integer in rdi
    mov     rsi,rax                                     ;length of integer in rsi
    call    CheckParameter
    mov     qword[x1.start],rax
    mov     qword[x1.size],rdx
    mov     rdi,qword[x1.start]                          ;convert string to integer
    mov     rsi,qword[x1.size]
    call    StringToInteger
    mov     qword[x1.value],rax
    mov     rdi,qword[x1.value]
    mov     rsi,x1.ascii
    call    IntegerToString
    mov     qword[x1.ascstart],rax
    mov     qword[x1.asclen],rdx
    
    ;get x2
    mov     rdi,x2
    mov     rsi,x2.len
    mov     rdx,r14                                     ;start of postparams
    mov     rcx,r15                                     ;length of postparams
    call    GetPostParam       
    mov     qword[x2.start],rax                         ;rsi points to value of post parameter
    mov     rdi,rax
    call    GetPostValueLength
    mov     qword[x2.size],rax
    mov     rdi,qword[x2.start]                         ;start of integer in rdi
    mov     rsi,rax                                     ;length of integer in rsi
    call    CheckParameter
    mov     qword[x2.start],rax
    mov     qword[x2.size],rdx
    mov     rdi,qword[x2.start]                          ;convert string to integer
    mov     rsi,qword[x2.size]
    call    StringToInteger
    mov     qword[x2.value],rax
    mov     rdi,qword[x2.value]
    mov     rsi,x2.ascii
    call    IntegerToString
    mov     qword[x2.ascstart],rax
    mov     qword[x2.asclen],rdx
    
       
    syscall write,stdout,httpheader,httpheader.len
    syscall write,stdout,JSONObject.part1,JSONObject.part1.len   
    syscall write,stdout,qword[d.ascstart],qword[d.asclen]
    syscall write,stdout,JSONObject.part2,JSONObject.part2.len
    syscall write,stdout,qword[x1.ascstart],qword[x1.asclen]
    syscall write,stdout,JSONObject.part3,JSONObject.part3.len
    syscall write,stdout,qword[x2.ascstart],qword[x2.asclen]
    syscall write,stdout,JSONObject.part4,JSONObject.part4.len

    call    QuadraticEquation
    
.endjson:    
    syscall write,stdout,JSONObject.part5,JSONObject.part5.len
    
    syscall brk,r14                                     ;release allocated memory
.nopostback:    
    syscall exit,0

    
;Initialize the cgi environment
CgiInit:
    push    rbp
    add     rsp,40
    mov     rbp,rsp
    mov     qword[envparams],rbp
    sub     rsp,40
    pop     rbp
    ret

; check if a webpage is posted back or not.  If posted back then rax=1 otherwise 0
IsPostBack:
    push    rdi
    push    rsi
    push    rdx
    mov     rdi,request_method
    mov     rsi,qword[envparams]
    mov     rdx,request_method.len
    call    GetWebVar
    and     rax,rax
    jz      .done
    mov     rsi,rax
    lodsd                                   ;get "POST" or "GET"
    cmp     eax,"POST"
    jne     .done
    mov     rax,1
.done:
    pop     rdx
    pop     rsi
    pop     rdi
    ret

GetContentLength:
    push    rdi
    push    rsi
    push    rdx
    mov     rdi,content_length
    mov     rsi,qword[envparams]
    mov     rdx,content_length.len
    call    GetWebVar
    and     rax,rax
    jz      .done
    mov     rsi,rax
    ; initialise rcx, rcx wil contain the hexadecimal value of CONTENT_LENGTH
    xor     rcx,rcx
.nextdigit:
    xor     rax,rax
    lodsb                                ;get digit
    and     al,al                        ;if 0 then no digits
    je      .end
    xor     rdx,rdx
    mov     rbx,10
    imul    rcx,rbx
    and     al,0x0F
    add     rcx,rax                      ;previous digit x 10 + current digit     
    jmp     .nextdigit
.end:
    mov     rax,rcx                     ;content length in rax
.done:
    pop     rdx
    pop     rsi
    pop     rdi
    ret
    
;RSI has first item in the list with strings

GetWebVar:
    ;RSI = pointer to first item in zero terminated list of webvars
    ;RDI = pointer to string to find
    ;RDX = length of string to find
    ;on return: RAX is pointer to value of webvar or zero if not found
    push    r14
    push    r15
    push    rcx
    push    rdx
    push    rsi
    push    rdi
    push    rbp
    mov     rbp,rsp
    mov     r14,rdi
    mov     r15,rdx
    mov     rsp,rsi                         ;stackpointer points to webserver variables
    xor     rdx,rdx                         ;assume not found
.search:
    pop     rsi
    and     rsi, rsi                        ;done yet?
    jz      .done
    mov     rcx,r15
    mov     rdi,r14
    cld
    rep     cmpsb                           ;compare RCX bytes
    jne     .search                         ;no match get the next variable, if any
    inc     rsi                             ;point to value of webvar
.done:
    mov     rax,rsi
    mov     rsp,rbp
    pop     rbp
    pop     rdi
    pop     rsi
    pop     rdx
    pop     rcx
    pop     r15
    pop     r14
    ret
    
GetPostValueLength:
    ;RDI = pointer to post parameter value
    ;on return RAX = length of parametervalue string
    push    rdi
    push    rcx
    xor     rcx,rcx
    not     rcx
    mov     al,"&"
    repne   scasb
    neg     rcx                                         ;length of parameter value
    dec     rcx
    dec     rcx
    mov     rax,rcx
    pop     rcx
    pop     rdi
    ret
    
GetPostParam:
    ;RDI = start of substring
    ;RSI = length of substring
    ;RDX = start of string to look in
    ;RCX = length of string to look in
    ;on return RAX = pointer to start of substring or 0 if not found
    push    rdi
    push    rsi
    push    rdx
    push    rcx
    push    r8                                          ;help registers
    push    r9
    xor     rax,rax                                     ;assume not present
    mov     r8,rdi                                      ;start of substring
    mov     r9,rsi                                      ;length of substring
    mov     rsi,rdx                                     ;start of string to look in, in rsi
    add     rdx,rcx                                     ;calculate last offset of string    
    ;we now have: RDI = start of substring
    ;             RCX = length of substring
    ;             RSI = start of entire string
    ;             RDX = end of entire string
    ;now let's search for the substring
    cld
.search:
    cmp     rsi,rdx                                     ;already at the end?
    ja      .done
    mov     rdi,r8                                      ;start of postparam
    mov     rcx,r9                                      ;length of postparam
    rep     cmpsb                                       ;compare RCX bytes
    jne     .search                                     ;no match get the next variable, if any
    mov     rax,rsi                                     ;offset of substring in entire string in rax
.done:
    pop     r9
    pop     r8
    pop     rcx
    pop     rdx
    pop     rsi
    pop     rdi
    ret
    
CheckParameter:
    ;RDI = address of ascii string integer
    ;RSI = length of ascii string integer
    ;on return: RAX = modified pointer if string starts with %2B
    ;           RDX = modified length of the parameter string
    push    rsi
    push    rdi
    push    rcx
    mov     rcx,rsi                                     ;length of integer in rcx
    cmp     rcx,0
    jz      .done   
    mov     rsi,rdi                                     ;start of string in rsi
    lodsb                                               ;first byte in AL
    dec     rsi                                         ;adjust pointer
    cmp     al,"-"
    je      .done
    cmp     al,"%"
    jne     .done                                       ;no sign in number
    ;here we can have %2B or some other combination with %
    ;in case %2B the number is positive, otherwise we leave the pointer to the string which will later result
    ;in a convert error.
    cmp     rcx,2
    jl      .done
    lodsd                                               ;load byte in AL
    and     eax,0xFFFFFF                                ;mask off high 8 bits
    sub     rsi,4                                       ;adjust pointer   
    cmp     eax,"%2B"                                   ;plus sign
    je      .ispositive
    jmp     .done
.ispositive:
    inc     rsi
    inc     rsi                                         ;adjust pointer to positive number
    inc     rsi
    dec     rcx
    dec     rcx
    dec     rcx
.done:
    mov     rax,rsi                                     ;result in rax
    mov     rdx,rcx
    pop     rcx
    pop     rdi
    pop     rsi
    ret
    
StringToInteger:
    push    rbx
    push    rcx
    push    rdx
    push    r8
    push    r9
    push    rdi
    push    rsi
    mov     rcx,rsi                                     ;length in RCX
    mov     rsi,rdi                                     ;pointer in RSI
    xor     r8,r8                                       ;assume positive integer
    xor     r9,r9                                       ;temp value in R9
    xor     rax,rax                                     ;RAX = 0
    mov     al,byte[rsi]                                ;read first byte, must be minus sign or digit
    cmp     al,"-"
    jne     .checkdigits
    inc     r8
    inc     rsi                                         ;point to next byte
    dec     rcx                                         ;adjust loop counter
    cmp     rcx,0                                       ;check if any bytes left in string
    jz      .done                                       ;we're done
.checkdigits:
    mov     rax,r9                                      ;temp value in rax
    xor     rdx,rdx                                     ;prepare multiplication
    mov     rbx,10
    mul     rbx                                         ;RDX:RAX = RAX * RBX
    mov     r9,rax                                      ;store temp value again
    xor     rax,rax
    lodsb                                               ;read byte
    cmp     al,"0"
    jl      .done
    cmp     al,"9"
    jg      .done
    and     al,0x0F                                     ;unascii
    add     r9,rax                                      ;add to temp value
    loop    .checkdigits
.done:
    mov     rax,r9
    and     r8,r8
    jz      .exit
    neg     rax                                         ;make RAX negative
.exit:    
    pop     rsi
    pop     rdi
    pop     r9
    pop     r8
    pop     rdx
    pop     rcx
    pop     rbx
    ret

IntegerToString:
    push    rdi                         ;save value on stack
    push    rsi
    push    rbx
    push    r8
    
    mov     r8,rdi                      ;save value in r8
    ;initialize the buffer
    mov     rdi,rsi
    xor     rax,rax
    stosq                               ;clear the buffer
    stosq
    stosd
    mov     rdi,rsi
    add     rdi,19                      ;point to end of buffer
    xor     rdx,rdx
    mov     rax,r8                      ;get the hexadecimal value in rax
    and     rax,rax                     ;is it zero?
    jz      .iszero
    jns     .convert
    neg     rax                         ;get absolute value of rax
.convert:
    ;rax has the absolute value,rdi points to the last byte in the buffer
    ;start to convert.
    mov     rbx,10                      ;decimal base in rbx
.repeat:
    xor     rdx,rdx                     ;clear rdx
    div     rbx                         ;divide by ten, rdx has remainder, rax quotient
    or      dl,0x30                     ;make human readable
    mov     byte[rdi],dl                ;save digit
    dec     rdi                         ;adjust buffer pointer for next digit
    and     rax,rax                     ;is quotient zero?
    jnz     .repeat                     ;if not repeat the whole loop
    and     r8,r8                       ;test if value is negative
    jns     .ispositive
    mov     byte[rdi],'-'               ;value is negative, copy sign byte
    dec     rdi                         ;adjust buffer and continue calculating length
.ispositive:
    mov     rdx,rsi
    add     rdx,19                      ;point to last position in buffer
    sub     rdx,rdi                     ;subtract start position to get length of number
    inc     rdi                         ;adjust buffer pointer
    jmp     .exit
.iszero:
    or      byte[rdi],'0'               ;make ascii
    inc     rdx                         ;length of decimal value is 1
.exit:
    mov     rax,rdi                     ;return pointer in rax
    pop     r8
    pop     rbx
    pop     rsi
    pop     rdi                         ;restore hexadecimal value in rdi
    ret

QuadraticEquation:
    mov     rdi,1
    mov     rsi,1
    a.Load
    b.Load
    c.Load
    mov     rdi,qword[d.value]
    cmp     rdi,0
    je      .discriminantiszero
    ;discriminant is not zero, x1 and x2 may not be equal
    mov     rdi,qword[x1.value]
    sub     rdi,qword[x2.value]
    cmp     rdi,0
    je      .errorrootsequal
    ;discriminant is not zero and roots x1 and x2 are different
    ;the equation is 0 = a(x-x1)(x-x2) = ax²-a(x1+x2)x+ax1x2
    ;
    ;D = d² = b²-4ac = (-a(x1+x2))²-4a²x1x2
    ;                = a²((x1+x2)²-4x1x2)
    ;                = a²(x1²+2x1x2+x2²-4x1x2)
    ;                = a²(x1²-2x1x2+x2²)
    ;                = a²(x1-x2)²
    ;we can calculate a because all other terms are known:
    ;a = d/(x1-x2) , because x1<>x2 we don't have division by zero
    ;b = -d(x1+x2)/(x1-x2)
    ;c = dx1x2/(x1-x2)
    ;because a is the square root of a², the terms a,b and c can be
    ;negative to which means that we have two equations which are opposite
    ;in sign.
    ;
    ;calculate x1-x2
    mov     rax,qword[x1.value]
    sub     rax,qword[x2.value]
    mov     r8,rax                      ;save x1-x2
    mov     rdi,qword[d.value]
    mov     rsi,r8
    a.Load                              ;load values in fraction a
        
    ;calculate -d(x1+x2)
    mov     rax,qword[x1.value]               ;rax = x1
    add     rax,qword[x2.value]               ;rax = x1+x2
    mov     rbx,qword[d.value]        
    xor     rdx,rdx                     
    imul    rbx                         ;rax = d(x1+x2)
    neg     rax                         ;rax = -d(x1+x2)
    mov     rdi,rax
    mov     rsi,r8
    b.Load
    
    ;calculate dx1x2
    mov     rax,qword[x1.value]
    mov     rbx,qword[x2.value]
    xor     rdx,rdx
    imul    rbx
    mov     rbx,qword[d.value]
    imul    rbx
    mov     rdi,rax
    mov     rsi,r8
    c.Load
    ;print the equation
    call    PrintEquation
    syscall write,stdout,equation.zero,equation.zerolen
    syscall write,stdout,htmleol,htmleol.len
    neg     byte[a.sign]
    neg     byte[b.sign]
    neg     byte[c.sign]
    call    PrintEquation
    syscall write,stdout,equation.zero,equation.zerolen
    syscall write,stdout,htmleol,htmleol.len
    ret  
    
.discriminantiszero:
    ;if the disriminant is zero then both roots x1 and x2 must be equal, if not
    ;then we have an error in the input.
    mov     rax,qword[x1.value]
    sub     rax,qword[x2.value]
    cmp     rax,0
    jne     .errorrootsnotequal
    ;discriminant is zero and x1 = x2
    ;check if x1 and x2 are different from zero, in this case we have a very
    ;basic equation: ax²=0.
    mov     rax,qword[x1.value]
    cmp     rax,0
    je      .basicequation
    ;the equation now is a(x-x1)(x-x2) with x1=x2
    ;                    a(x-x1)(x-x1)
    ;                    a(x²-xx1-xx1+x1²)
    ;                    a(x²-2xx1+x1²)
    ;because the discriminant is zero, we can't calculate a value for a.
    ;What we can do however is calculate b=-2x1 and c=x1² and keep a=1 in
    ;x²-2x1x+x1².  Then for any value of 'a' the equation is a solution.
    ;
    ;fill a with ones
    mov     rdi,1
    mov     rsi,1
    a.Load
    ;now calculate -2x1
    mov     rax,qword[x1.value]                   ;rax = x1
    sal     rax,1                           ;rax = 2x1
    neg     rax
    mov     rdi,rax
    mov     rsi,1
    b.Load
    ;calculate x1²
    mov     rax,qword[x1.value]                   ;rax = x1
    xor     rdx,rdx
    imul    rax                             ;rax = x1²
    mov     rdi,rax
    mov     rsi,1
    c.Load
    ;print the equation
    syscall write,stdout,equation.astart,equation.astartlen
    call    PrintEquation
    syscall write,stdout,equation.aend,equation.aendlen
    syscall write,stdout,htmleol,htmleol.len
    neg     byte[a.sign]
    neg     byte[b.sign]
    neg     byte[c.sign]
    syscall write,stdout,equation.astart,equation.astartlen
    call    PrintEquation
    syscall write,stdout,equation.aend,equation.aendlen
    syscall write,stdout,htmleol,htmleol.len
    ret
.basicequation:
    syscall write,stdout,equation.basic,equation.basiclen
    ret
.errorrootsequal:
    syscall write,stdout,rooterror.equal,rooterror.equallen
    ret
.errorrootsnotequal:
    syscall write,stdout,rooterror.unequal,rooterror.unequallen
    ret

    
PrintEquation:
    a.Simplify
    b.Simplify
    c.Simplify
    call    PrintTermA
    call    PrintTermB
    call    PrintTermC
    ret

PrintTermA:
    mov     rax,qword[a.numerator]
    cmp     rax,0                       ;a.numerator = 0 then we don't print
    je      .done
    mov     cl,byte[a.sign]
    cmp     cl,1
    je      .nosign
    mov     byte[signbuffer],"-"
    syscall write,stdout,signbuffer,1
.nosign:    
    mov     rax,qword[a.numerator]
    cmp     rax,1
    je      .nonumerator
    mov     rdi,rax
    mov     rsi,integerbuffer
    call    HexToDecAscii
    syscall write,stdout,rax,rdx
.nonumerator:
    syscall write,stdout,equation.xx,equation.xxlen
    mov     rax,qword[a.denominator]
    cmp     rax,1
    je      .done
    mov     byte[signbuffer],"/"
    syscall write,stdout,signbuffer,1
    mov     rdi,qword[a.denominator]
    mov     rsi,integerbuffer
    call    HexToDecAscii
    syscall write,stdout,rax,rdx
.done:
    ret
    
PrintTermB:
    mov     rax,qword[b.numerator]
    cmp     rax,0                       ;a.numerator = 0 then we don't print
    je      .done
    mov     byte[signbuffer],"+"
    mov     cl,byte[b.sign]
    cmp     cl,1
    je      .printsign
    mov     byte[signbuffer],"-"
.printsign:    
    syscall write,stdout,signbuffer,1
    mov     rax,qword[b.numerator]
    cmp     rax,1
    je      .nonumerator
    mov     rdi,rax
    mov     rsi,integerbuffer
    call    HexToDecAscii
    syscall write,stdout,rax,rdx
.nonumerator:
    syscall write,stdout,equation.x,equation.xlen
    mov     rax,qword[b.denominator]
    cmp     rax,1
    je      .done
    mov     byte[signbuffer],"/"
    syscall write,stdout,signbuffer,1
    mov     rdi,qword[b.denominator]
    mov     rsi,integerbuffer
    call    HexToDecAscii
    syscall write,stdout,rax,rdx
.done:
    ret

PrintTermC:
    mov     rax,qword[c.numerator]
    cmp     rax,0
    je      .done
    mov     byte[signbuffer],"+"
    mov     cl,byte[c.sign]
    cmp     cl,1
    je      .printsign
    mov     byte[signbuffer],"-"
.printsign:    
    syscall write,stdout,signbuffer,1
    mov     rax,qword[c.numerator]
    mov     rdi,rax
    mov     rsi,integerbuffer
    call    HexToDecAscii
    syscall write,stdout,rax,rdx
    mov     rax,qword[c.denominator]
    cmp     rax,1
    je      .done
    mov     byte[signbuffer],"/"
    syscall write,stdout,signbuffer,1
    mov     rdi,qword[c.denominator]
    mov     rsi,integerbuffer
    call    HexToDecAscii
    syscall write,stdout,rax,rdx
.done:
    ret