#ifndef OOP_NEW_H
#define OOP_NEW_H 1

/* ==========================================
 * Object Instantiation Interface
 * ========================================== */

/*
 * NEW Macro
 * ------------------------------------------
 * This is the portable frontend for creating (instantiating) objects.
 *
 * It delegates the low-level work (like memory allocation, calling 'malloc', 
 * and setting the vptr) to the architecture-specific macro 'NEW_IMPL'
 * (which must be implemented in backend.h or a similar file).
 *
 * Arguments:
 * class: The name of the class (e.g., Dog or Cat). This is used 
 * to determine the required size (\class\().size).
 * obj:   The register where the newly allocated object pointer 
 * will be stored (e.g., %rbx).
 */
.macro NEW class, obj
    NEW_IMPL \class, \obj
.endm

#endif
