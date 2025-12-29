;name: pagesize.asm
;
;description: Get the pagesize programmatically of a platform in rax
;             The function doesn't need input parameters.
;
;source: https://stackoverflow.com/questions/3351940/detecting-the-memory-page-size/3351960#3351960

bits 64

%include "asm-generic/mman.inc"

section .text

global pagesize

pagesize:
    push        r15                         ;save help registers
    push        r14
    push        r10
    push        r9
    push        r8
    push        rdx
    push        rsi
    push        rdi

    xor         r14,r14
    inc         r14
    mov         r15,r14
.repeat:
    shl         r15,1
    syscall     mmap,0,r15,PROT_NONE,MAP_ANONYMOUS | MAP_PRIVATE,-1,0
    and         rax,rax
    js          .failed
    mov         rdx,rax
    mov         r15,rax
    add         r15,r14
    syscall     munmap,r15,r14
    mov         r8,rax                      ;save error code
    mov         r15,r14
    shl         r15,1
    syscall     munmap,rdx,r15
    mov         rax,r14
    and         r8,r8                       ;if r8==0 then we have our pagesize
    jz          .exit
    clc                                     ;clear carry bit
    rcl         r14,1                       ;we do a rotate instead of a shift
    jc          .failed                     ;to avoid an endless loop
    jmp         .repeat                     ;still not there
.failed:
    mov         rax,-1
.exit:
    pop         rdi                         ;restore used registers
    pop         rsi
    pop         rdx
    pop         r8
    pop         r9
    pop         r10
    pop         r14
    pop         r15
    ret
