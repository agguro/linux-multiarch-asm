#ifndef OOP_RUNTIME_H
#define OOP_RUNTIME_H 1

/* TypeInfo: stored at vtable[-1] */

.macro TYPEINFO name
    .quad \name\()_type
\name\()_type:
    .asciz "\name"
.endm

#endif

