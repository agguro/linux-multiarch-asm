/* animals.S (Final Corrected Version) */
#include "syscalls.h"

    /* --- FIX 1: Make size symbols Global (Resolves 'undefined symbol') --- */
    .globl Dog_size
    .globl Cat_size

    .section .data

.globl str_dog
str_dog: .asciz "Woof! (I am a Dog)\n"
len_dog = . - str_dog

.globl str_cat
str_cat: .asciz "Meow! (I am a Cat)\n"
len_cat = . - str_cat

/* --- Class Sizes (Constants used by NEW_IMPL) --- */
.equ Dog_size, 8
.equ Cat_size, 8

/* --- VTables --- */
.globl Dog_vtable
.align 8
Dog_vtable:
    .quad dog_speak    # Index 0

.globl Cat_vtable
.align 8
Cat_vtable:
    .quad cat_speak    # Index 0

    .section .text

/* --- Methods --- */
.type dog_speak, @function
dog_speak:
    /* FIX 2: Removed '$' for string label to activate automatic RIP-relative LEA in _syscall. */
    _syscall $__NR_write, $STDOUT, str_dog, $len_dog
    ret

.type cat_speak, @function
cat_speak:
    _syscall $__NR_write, $STDOUT, str_cat, $len_cat
    ret
