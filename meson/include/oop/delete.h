#ifndef OOP_DELETE_H
#define OOP_DELETE_H 1

/* ==========================================
 * Object Destruction Interface
 * ========================================== */

/*
 * DELETE Macro
 * ------------------------------------------
 * This is the portable frontend for destroying objects.
 *
 * It delegates the low-level work (like calling 'free' or 
 * memory deallocation syscalls) to the architecture-specific 
 * macro 'DELETE_IMPL' (which must be implemented in backend.h).
 *
 * Arguments:
 * obj: The register containing the object pointer to delete (e.g., %rbx).
 */
.macro DELETE obj
    DELETE_IMPL \obj
.endm

#endif
