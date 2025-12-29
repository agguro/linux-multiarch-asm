#ifndef OOP_SET_TYPE_H
#define OOP_SET_TYPE_H 1

/* ==========================================
 * Runtime Type Setting Interface (RTTI Helper)
 * ========================================== */

/*
 * SET_TYPE Macro
 * ------------------------------------------
 * This is the portable frontend for setting the Virtual Table Pointer (vptr) 
 * inside an object. In C++, this is equivalent to calling the constructor 
 * to initialize the vptr to the class's VTable.
 *
 * It delegates the low-level memory store operation to the 
 * architecture-specific macro 'SET_TYPE_IMPL' (defined in the backend).
 *
 * Arguments:
 * obj:   The register holding the pointer to the object (e.g., %rbx).
 * class: The name of the class whose VTable should be used (e.g., Dog). 
 * This implies the label for the VTable (e.g., Dog_vtable).
 */
.macro SET_TYPE obj, class
    SET_TYPE_IMPL \obj, \class
.endm

#endif
