#ifndef OOP_NEW_H
#define OOP_NEW_H 1

# Portable frontend — implemented in backend.h

.macro NEW class, obj
    NEW_IMPL \class, \obj
.endm

#endif

