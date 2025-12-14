#ifndef OOP_VCALL_H
#define OOP_VCALL_H 1

/* ==========================================
 * Virtual Call Interface
 * ========================================== */

/*
 * VCALL Macro
 * ------------------------------------------
 * This is the portable frontend for making a Virtual Function Call.
 * It searches for the correct function pointer within the object's VTable 
 * based on the provided index, and then executes (jumps to) that function.
 *
 * It delegates the low-level logic (reading vptr, calculating offset, jumping)
 * to the architecture-specific macro 'VCALL_IMPL' (defined in the backend).
 *
 * Arguments:
 * obj:   The register holding the pointer to the object (e.g., %rdi).
 * index: The index of the method within the VTable (e.g., 0 for 'speak').
 */
.macro VCALL obj, index
    VCALL_IMPL \obj, \index
.endm

#endif
