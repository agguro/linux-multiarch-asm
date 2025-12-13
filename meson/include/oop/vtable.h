#ifndef OOP_VTABLE_H
#define OOP_VTABLE_H 1

# ============================================================
# VTABLE DEFINITIONS (Generic)
# ============================================================

# Start de tabel in read-only geheugen
.macro VTABLE name
    .section .data.rel.ro
    .align 8
    .globl \name\()_vtable
\name\()_vtable:
.endm

# Voeg een functiepointer toe
.macro VFUNC label
    .quad \label
.endm

# Einde tabel, terug naar code sectie
.macro ENDVTABLE
    .text
.endm

#endif
