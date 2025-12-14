#ifndef SYSCALLS_H
#define SYSCALLS_H 1

#include "unistd.h"

/* * Helper macro: Determines MOV or LEA smartly.
 * ROBUST VERSION (Tab-safe & Optimized):
 * 1. Fast Path: Checks for 0 or $0 -> XOR (Optimize!)
 * 2. Scans string char by char.
 * 3. If it finds '(' -> EXPLICIT MEMORY (LEA).
 * 4. If it finds $ % - 0-9 -> VALUE (MOV). Stop scanning.
 * 5. If it finds a letter (a-z) -> LABEL (LEA). Stop scanning.
 */
.macro _set_arg reg, arg
    /* --- 1. OPTIMIZATION FAST PATH --- */
    
    /* Check for SKIP */
    .ifc \arg, SKIP
        .exitm
    .endif

    /* Check for literal 0 (Optimize to XOR) */
    .ifc \arg, 0
        xor \reg, \reg
        .exitm
    .endif
    
    /* Check for Immediate $0 (Optimize to XOR) <--- DIT MISTE ER! */
    .ifc \arg, $0
        xor \reg, \reg
        .exitm
    .endif

    /* --- 2. REGULAR SCANNING --- */

    /* State variables */
    is_value = 0        /* 1 = MOV */
    is_explicit = 0     /* 1 = LEA raw */
    
    .irpc char, \arg
        
        /* CHECK: Explicit Memory '(' */
        .ifc "\char", "("
            is_explicit = 1
            .exitm
        .endif

        /* CHECK: Value Starters ($ % - 0-9) */
        .ifc "\char", "$"
            is_value = 1
            .exitm
        .endif
        .ifc "\char", "%"
            is_value = 1
            .exitm
        .endif
        .ifc "\char", "-"
            is_value = 1
            .exitm
        .endif
        .ifc "\char", "0"
            is_value = 1
            .exitm
        .endif
        .ifc "\char", "1"
            is_value = 1
            .exitm
        .endif
        .ifc "\char", "2"
            is_value = 1
            .exitm
        .endif
        .ifc "\char", "3"
            is_value = 1
            .exitm
        .endif
        .ifc "\char", "4"
            is_value = 1
            .exitm
        .endif
        .ifc "\char", "5"
            is_value = 1
            .exitm
        .endif
        .ifc "\char", "6"
            is_value = 1
            .exitm
        .endif
        .ifc "\char", "7"
            is_value = 1
            .exitm
        .endif
        .ifc "\char", "8"
            is_value = 1
            .exitm
        .endif
        .ifc "\char", "9"
            is_value = 1
            .exitm
        .endif

        /* CHECK: Label Starters (a-z, A-Z, _) */
        .ifc "\char", "a"
            .exitm
        .endif
        .ifc "\char", "b"
            .exitm
        .endif
        .ifc "\char", "c"
            .exitm
        .endif
        .ifc "\char", "d"
            .exitm
        .endif
        .ifc "\char", "e"
            .exitm
        .endif
        .ifc "\char", "f"
            .exitm
        .endif
        .ifc "\char", "g"
            .exitm
        .endif
        .ifc "\char", "m"
            .exitm
        .endif
        .ifc "\char", "s"
            .exitm
        .endif
        .ifc "\char", "h"
            .exitm
        .endif
        .ifc "\char", "p"
            .exitm
        .endif
        .ifc "\char", "w"
            .exitm
        .endif
        .ifc "\char", "_"
            .exitm
        .endif
        
        /* Ignore spaces/tabs */
    .endr

    /* 3. GENERATE INSTRUCTION */
    .if is_value == 1
        .ifnc \arg, \reg
            mov \arg, \reg
        .endif
    .else
        .if is_explicit == 1
            lea \arg, \reg
        .else
            lea \arg(%rip), \reg
        .endif
    .endif
.endm

/* The Main Syscall Macro */
.macro _syscall nr, a1=SKIP, a2=SKIP, a3=SKIP, a4=SKIP, a5=SKIP, a6=SKIP
    _set_arg %rdi, \a1
    _set_arg %rsi, \a2
    _set_arg %rdx, \a3
    _set_arg %r10, \a4
    _set_arg %r8,  \a5
    _set_arg %r9,  \a6
    
    mov \nr, %rax
    syscall
.endm

#endif
