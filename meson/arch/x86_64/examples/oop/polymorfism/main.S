 /* main.S (Program Entry and Object Instantiation) */
#include "syscalls.h"
#include "oop/aggregator.h"

    .section .bss
    .align 16
    /* Array to hold 2 object pointers (16 bytes) */
    animal_list: .skip 16

    .section .text
    .globl main

main:
    push %rbp
    mov %rsp, %rbp

    /* --- 1. Instantiate Objects --- */
    /* NEW_IMPL uses Dog_size/Cat_size (now global) */
    NEW_IMPL Dog, %rbx
    NEW_IMPL Cat, %r12

    /* --- 2. Fill the List (Array) --- */
    
    /* Load address of the list using RIP-relative addressing (correct for PIC) */
    lea animal_list(%rip), %r13
    mov %rbx, 0(%r13)               # list[0] = dog pointer
    mov %r12, 8(%r13)               # list[1] = cat pointer

    /* --- 3. The Polymorphic Loop --- */
    
    xor %r14, %r14                  # Loop counter i = 0
    
loop_start:
    cmp $2, %r14                    # Loop 2 times
    je loop_end

    /* Get the animal pointer from the list: list[i] */
    mov (%r13, %r14, 8), %rax       # %rax = animal pointer
    
    /* VCALL: Calls the method at index 0 (speak) polymorphically */
    VCALL_IMPL %rax, 0

    inc %r14
    jmp loop_start

loop_end:
    
    /* --- 4. Cleanup --- */
    /* obj pointer moved to %rdi for DELETE_IMPL */
    mov 0(%r13), %rdi
    DELETE_IMPL %rdi

    mov 8(%r13), %rdi
    DELETE_IMPL %rdi

    xor %rax, %rax
    leave
    ret
