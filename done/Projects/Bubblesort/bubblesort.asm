;name:         bubblesort.asm
;
;description:  Demonstration of the BubbleSort Algorithm, with or without optimzing steps.
;              The program needs to be re-assembled and linked when changing to an
;              optimization step.
;              source : https://en.wikipedia.org/wiki/Bubble_sort
;
;build:        ;O : [default] no optimization
;              nasm -felf64 -dOPTIMIZE_STEP=0 bubblesort.asm -l bubblesort.lst -o bubblesort.o
;build:        ;1 : n-th pass finds the n-th largest elements
;              nasm -felf64 -dOPTIMIZE_STEP=1 bubblesort.asm -l bubblesort.lst -o bubblesort.o
;build:        ;2 : no check after last swap
;              nasm -felf64 -dOPTIMIZE_STEP=2 bubblesort.asm -l bubblesort.lst -o bubblesort.o
;              ld -s -melf_x86_64 -o bubblesort bubblesort.o

bits 64

[list -]
    %include "unistd.inc"
[list +]

; here you can choose between the 3 different steps of optimization
; O : [default] no optimization
; 1 : n-th pass finds the n-th largest elements
; 2 : no check after last swap

%ifndef OPTIMIZE_STEP
   %define OPTIMIZE_STEP 0
   %warning "build defaults to 'no optimization'"
%endif

%define TRUE      1
%define FALSE     0

%macro STRING 1
    .start:     db %1
    .length:    equ $-.start
%endmacro

%macro ARRAY 1-*
    %rep  %0
         dq  %1
         %rotate 1
    %endrep 
%endmacro

section .bss

; 64 bit integers have a range of -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807
; both included, so we need a buffer of 20 bytes at least to store them
Buffer:
    sign           resb      1              ; ascii sign
    decimal        resb     19              ; 20 bytes to store a 64 bits number + sign

section .data

; The list is intentionally sorted in descending order to demonstrate the wurst case scenario
; and determine the swaps and iterations.

    datasize:      equ       8   
    array:         ARRAY     154,2144,119,98,4,520,2, 75, 15, 0, -85,-4, -78,-54, -485,-458,-25, -92,-233,720,368,547,758,8, -233,72,-36,854,-775,807
    .length        equ       ($-array)/datasize

    title:         STRING    {"Bubblesort Algorithm - Agguro 2012",10}

%if OPTIMIZE_STEP == 0
    opt0:          STRING    {"Optimization step: no optimization",10}
%endif
%if OPTIMIZE_STEP == 1
    opt0:          STRING    {"Optimization step: n-th pass finds the n-th largest elements",10}
%endif
%if OPTIMIZE_STEP == 2
    opt0:          STRING    {"Optimization step: no check after last swap",10}
%endif

    unsorted:      STRING    {"The UNSORTED array:",10,"-------------------",10}
    sorted:        STRING    {10,"The SORTED array:",10,"-----------------",10}
    iterations:    STRING    {10,"Number of iterations: "}
    swaps:         STRING    {"Number of swaps     : "}
    lf:            STRING    {10}
     
section .text
        global _start
     
_start:
    pushfq
    push      rax
    push      rbx
    push      rcx
    push      rdx
    push      rsi
    push      r9
    push      r8
; clear the screen and print title
; if the terminal you use don't support this, modify the bytes in .data
    mov       rsi, title
    mov       rdx, title.length
    call      Print.string

    mov       rsi, opt0
    mov       rdx, opt0.length
    call      Print.string

; display the unsorted Array on screen
    mov       rsi, unsorted
    mov       rdx, unsorted.length
    call      Print.string
; print the Array elements
    call      ShowArray

; Here the Bubblesort algorithm starts. Depending the value of OPTIMIZE_STEP an optimized or
; non-optimized version is included.

%if OPTIMIZE_STEP == 0
    %include "optimizingstep0.asm"
%endif
%if OPTIMIZE_STEP == 1
    %include "optimizingstep1.asm"
%endif
%if OPTIMIZE_STEP == 2
    %include "optimizingstep2.asm"
%endif

; End of the BubbleSort algorithm.

; all we need to do is to display the sorted Array and restore the used registers
    mov       rsi, sorted
    mov       rdx, sorted.length
    call      Print.string
    call      ShowArray
    ; show number of iterations
    mov       rsi, iterations
    mov       rdx, iterations.length
    call      Print.string
    mov       rax, r8                       ; iterations in RAX
    call      Convert                       ; RAX contains the number to convert
    call      Print.integer
    call      ClearBuffer                   ; clear buffer for next use
     ; show number of swaps
    mov       rax, r9                       ; number of swaps in RAX
    mov       rsi, swaps
    mov       rdx, swaps.length
    call      Print.string
    call      Convert                       ; RAX contains the number to convert
    call      Print.integer
    call      Print.linefeed
     ; restore used registers
    pop       r8
    pop       r9
    pop       rsi
    pop       rdx
    pop       rcx
    pop       rbx
    pop       rax
    popfq
Exit:      
    syscall   exit, 0
ShowArray:
    push      rcx
    push      rsi
    mov       rcx, array.length             ; show all integers
    mov       rsi, array                    ; start of the array
.nextInteger:      
    lodsq                                   ; get integer
    call      Convert                       ; RAX contains the number to convert
    call      Print.integer
    call      ClearBuffer                   ; clear buffer for next use
    loop      .nextInteger
    pop       rsi
    pop       rcx
    ret
Convert:
    push      rax
    push      rbx
    push      rdx
    push      rdi
    push      rcx
    mov       rdi,sign
    mov       byte[rdi]," "                 ; default no sign
    cmp       rax, 0
    jge       .noSign
    mov       byte[rdi],"-"                 ; number is zero
    neg       rax                           ; make positive
.noSign:
    mov       rdi, decimal                  ; address of buffer in RDI 
    add       rdi, 18                       ; 0..18 = 19 bytes of storage
    ; start conversion of absolute value of RAX
.repeat:      
    xor       rdx, rdx                      ; remainder will be in RDX
    mov       rbx, 10
    div       rbx                           ; RDX = remainder of division
    or        dl,"0"                        ; make remainder decimal ASCII
    mov       byte[rdi],dl                  ; and store
    dec       rdi                           ; go to previous position
    cmp       rax, 0                        ; RAX = quotient of division, if zero stop
                                            ; we can stop when AL < 10 however this will add more code to store AL
    jnz       .repeat
    ; align integers to the right
    mov       dl ,byte[sign]                ; copy sign character in [RDI] just before the number
    mov       byte[rdi], dl
    dec       rdi                           ; point to position before the sign character
    mov       rcx, rdi                      ; calculate remaining bytes
    sub       rcx, sign
    cmp       rcx, 0
    jle       .end
    inc       rcx
    mov       al," "                        ; fill remaining bytes with spaces
    std
.fill:      
    stosb
    loop      .fill
.end:      
    pop       rcx
    pop       rdi
    pop       rdx
    pop       rbx
    pop       rax
    ret
     
; **** Clear the integer buffer
ClearBuffer:
    push      rax
    push      rcx
    push      rdi
    mov       rdi, Buffer
    mov       rcx, 20                       ; 20 bytes to clear (1 added to clear last too)
    xor       rax, rax
    cld                                     ; begin at lowest address
.repeat:      
    stosb                                   ; erase [RDI] and increment RSI pointer
    loop      .repeat
    pop       rdi
    pop       rcx
    pop       rax
    ret
; *** Print routines
Print:
.integer:
    push      rdx
    push      rsi
    mov       rsi,Buffer
    mov       rdx, 20                       ; 20 bytes to display
    call      Print.string
    call      Print.linefeed
    pop       rsi
    pop       rdx
    ret
.linefeed:
    mov       rsi, lf
    mov       rdx, lf.length
.string:  
    push      rax
    push      rdi
    push      rcx                           ; even not used, RCX is changed after syscall
    syscall   write, stdout
    pop       rcx
    pop       rdi
    pop       rax
    ret
