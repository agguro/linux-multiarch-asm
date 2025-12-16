/* arch/mips/include/syscalls.h */

#ifndef SYSCALLS_H
#define SYSCALLS_H 1

#include "unistd.h"

/* ============================================================
 * MIPS32 SYSCALL MACROS
 * ============================================================ */

/* Helper: _set_arg reg, arg (MIPS32) */
.macro _set_arg reg, arg
    .ifc \arg, SKIP
        /* Do nothing (argument not provided) */
    .else
        .ifc \arg, 0
            xor \reg, \reg, \reg // Faster/smaller than li \reg, 0
        .else
            .ifnc \arg, \reg
                move \reg, \arg // Pseudo-instructie: Verplaatst registerinhoud
            .endif
        .endif
    .endif
.endm

/* Main Macro: _syscall (MIPS32) */
.macro _syscall nr, a0=SKIP, a1=SKIP, a2=SKIP, a3=SKIP
    /* Set arguments (MIPS32 O32 ABI - max 4 args) */
    _set_arg $a0, \a0
    _set_arg $a1, \a1
    _set_arg $a2, \a2
    _set_arg $a3, \a3

    /* Load syscall number (in register v0) */
    li $v0, $__NR_\nr // Load Immediate

    syscall
.endm

#endif

