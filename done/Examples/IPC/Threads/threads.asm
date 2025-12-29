; name: threads.asm
;
; description:  Pure assembly, library-free Linux threading demo
;               A demonstration of library-free, Pthreads-free threading in Linux with
;               pure x86_64 assembly. Thread stacks are allocated with the syscall mmap
;               and new threads are spawned with the clone syscall.
;               Synchronization is achieved with the x86 `lock` instruction prefix.
;
; build:        nasm -felf64 threads.asm -o threads.o
;               ld -melf_x86_64 threads.o -o threads  
;
; source:       [Raw Linux Threads via System Calls](http://nullprogram.com/blog/2015/05/15/)

bits 64

[list -]
    %include "unistd.inc"
    %include "sys/sched.inc"
    %include "asm-generic/mman.inc"

    %define THREAD_FLAGS    CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_PARENT|CLONE_THREAD|CLONE_IO
    %define STACK_SIZE      (4096 * 1024)
    %define MAX_LINES       100000                  ;number of output lines before exiting
[list +]

section .bss

section .data

    count:  dq MAX_LINES
    hello:  db `Hello from \e[93;1mmain!\e[0m\n\0`
    hello1: db `Hello from \e[91;1mthread 1!!\e[0m\n\0`
    hello2: db `Hello from \e[96;1mthread 2!!\e[0m\n\0`
    
section .text

global _start
_start:
;spawn a few threads
    mov	    rdi, threadfn1
    call    thread_create
    mov	    rdi, threadfn2
    call    thread_create

.loop:
    call    check_count
    mov	    rdi, hello
    call    puts
    mov	    rdi, 0
    jmp	    .loop

threadfn1:
    call    check_count
    mov	    rdi, hello1
    call    puts
    jmp	    threadfn1

threadfn2:
    call    check_count
    mov	    rdi, hello2
    call    puts
    jmp	    threadfn2

; -- may not return
check_count:
    mov	    rax, -1
    lock   xadd [count], rax
    jl	    .exit
    ret
.exit:
    syscall exit, 0

puts:
    mov	    rsi, rdi
    mov	    rdx, -1
.count:
    inc	    rdx
    cmp	    byte[rsi + rdx], 0
    jne	    .count
    syscall write, stdout
    ret

thread_create:
    push    rdi
    call    stack_create
    lea	    rsi, [rax + STACK_SIZE - 8]
    pop	    qword [rsi]
    syscall clone, THREAD_FLAGS
    ret

stack_create:
    xor     r8,r8
    dec     r8
    xor     r9,r9
    syscall mmap, 0, STACK_SIZE,PROT_WRITE | PROT_READ,MAP_ANONYMOUS | MAP_PRIVATE | MAP_GROWSDOWN
    ret
