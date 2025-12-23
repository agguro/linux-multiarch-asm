/* arch/aarch64/include/syscalls.h */

#ifndef SYSCALLS_H
#define SYSCALLS_H 1

#include "unistd.h"

/* ============================================================
 * AARCH64 SYSCALL MACROS
 * ============================================================ */

/* Helper: _set_arg reg, arg (AArch64) */
.macro _set_arg reg, arg
    .ifc \arg, SKIP
        /* Do nothing (argument not provided) */
    .else
        .ifc \arg, 0
            eor \reg, \reg, \reg // Faster/smaller than mov \reg, #0
        .else
            .ifnc \arg, \reg
                mov \reg, \arg
            .endif
        .endif
    .endif
.endm

/* Main Macro: _syscall (AArch64) */
.macro _syscall nr, a0=SKIP, a1=SKIP, a2=SKIP, a3=SKIP, a4=SKIP, a5=SKIP
    /* Set arguments (AArch64 ABI) */
    _set_arg x0, \a0
    _set_arg x1, \a1
    _set_arg x2, \a2
    _set_arg x3, \a3
    _set_arg x4, \a4
    _set_arg x5, \a5

    /* Load syscall number (in register x8) */
    mov x8, $__NR_\nr

    svc #0 // System Call
.endm

#endif

