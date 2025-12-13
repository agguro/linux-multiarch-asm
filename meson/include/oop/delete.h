#ifndef OOP_DELETE_H
#define OOP_DELETE_H 1

# Portable frontend — implemented in backend.h

.macro DELETE obj
    DELETE_IMPL \obj
.endm

#endif

