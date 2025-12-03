#ifndef _ASM_UNISTD_H
#define _ASM_UNISTD_H

/* Include the list of syscall numbers (SYS_write, SYS_exit, etc.) */
#include "asm-generic/unistd64.h"

/* * Macro: do_syscall
 * Customized version for GNU Assembler with 'Zero-Overhead' optimization.
 *
 * Usage:
 * do_syscall SYS_write, 1, offset msg, 10
 *
 * Mapping (Linux x86_64 ABI):
 * Argument 1 -> RDI
 * Argument 2 -> RSI
 * Argument 3 -> RDX
 * Argument 4 -> R10
 * Argument 5 -> R8
 * Argument 6 -> R9
 * Syscall Nr -> RAX
 */

.macro do_syscall nr, arg1, arg2, arg3, arg4, arg5, arg6

    /* --- 1. Argument: RDI --- */
    .ifnb \arg1              /* Check if argument is present */
        .ifc \arg1, 0        /* Check if argument is literally "0" */
            xor rdi, rdi     /* Yes: Optimize (Zero out register) */
        .else
            mov rdi, \arg1   /* No: Standard move */
        .endif
    .endif

    /* --- 2. Argument: RSI --- */
    .ifnb \arg2
        .ifc \arg2, 0
            xor rsi, rsi
        .else
            mov rsi, \arg2
        .endif
    .endif

    /* --- 3. Argument: RDX --- */
    .ifnb \arg3
        .ifc \arg3, 0
            xor rdx, rdx
        .else
            mov rdx, \arg3
        .endif
    .endif

    /* --- 4. Argument: R10 --- */
    .ifnb \arg4
        .ifc \arg4, 0
            xor r10, r10
        .else
            mov r10, \arg4
        .endif
    .endif

    /* --- 5. Argument: R8 --- */
    .ifnb \arg5
        .ifc \arg5, 0
            xor r8, r8
        .else
            mov r8, \arg5
        .endif
    .endif

    /* --- 6. Argument: R9 --- */
    .ifnb \arg6
        .ifc \arg6, 0
            xor r9, r9
        .else
            mov r9, \arg6
        .endif
    .endif

    /* --- Syscall name: RAX --- */
    mov rax, SYS_\nr

    /* Execute Syscall */
    syscall

.endm

/* Standard definitions for readability */
   .equ stdin,  0
   .equ stdout, 1
   .equ stderr, 2
   .equ true,   1
   .equ false,  0
   
   /* Uppercase version for those who like uppercase */
   .equ STDIN,  stdin
   .equ STDOUT, stdout
   .equ STDERR, stderr
   .equ TRUE,   true
   .equ FALSE,  false

#endif /* _ASM_UNISTD_INC_ */
