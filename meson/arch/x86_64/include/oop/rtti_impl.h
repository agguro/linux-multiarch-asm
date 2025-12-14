/* arch/x86_64/include/oop/rtti_impl.h */

#ifndef OOP_RTTI_IMPL_H
#define OOP_RTTI_IMPL_H 1

/*
 * x86_64 implementation of RTTI (Run-Time Type Information) setting.
 * In x86, we can move an immediate address directly into memory.
 */
.macro SET_TYPE_IMPL obj, class
    leaq \class\()_typeinfo(%rip), %r11  # Load address into register (PIC safe)
    mov %r11, (\obj)                     # Write to object memory
    
    /* * WARNING: This writes to offset 0 of the object!
     * If the object also has a VTable (vptr), this operation overwrites it.
     * In standard C++, RTTI is usually stored inside the VTable (at index -1),
     * not directly on the object. Ensure this fits your specific object layout.
     */
.endm

#endif
