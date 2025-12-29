/* arch/riscv64/include/syscalls.h */

#ifndef SYSCALLS_H
#define SYSCALLS_H 1

#include "unistd.h"

/* ============================================================
 * RISCV64 SYSCALL MACROS
 * ============================================================ */

/* Helper: _set_arg reg, arg (RISCV64) */
.macro _set_arg reg, arg
    .ifc \arg, SKIP
        /* Do nothing (argument not provided) */
    .else
        .ifc \arg, 0
            xor \reg, \reg, \reg // Faster/smaller than li \reg, 0 (or use 'li \reg, 0')
        .else
            .ifnc \arg, \reg
                mv \reg, \arg // Pseudo-instructie: Move (alias for addi reg, arg, 0)
            .endif
        .endif
    .endif
.endm

/* Main Macro: _syscall (RISCV64) */
.macro _syscall nr, a0=SKIP, a1=SKIP, a2=SKIP, a3=SKIP, a4=SKIP, a5=SKIP
    /* Set arguments (RISC-V ABI) */
    _set_arg a0, \a0
    _set_arg a1, \a1
    _set_arg a2, \a2
    _set_arg a3, \a3
    _set_arg a4, \a4
    _set_arg a5, \a5

    /* Load syscall number (in register a7) */
    li a7, $__NR_\nr // Load Immediate

    ecall // Environment Call
.endm

#endif

