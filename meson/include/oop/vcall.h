#ifndef OOP_CALL_H
#define OOP_CALL_H 1

# VCALL: Virtual Call (zoekt functie in de vtable op index)
# Verwijst door naar backend implementatie VCALL_IMPL

.macro VCALL obj, index
    VCALL_IMPL \obj, \index
.endm

#endif
