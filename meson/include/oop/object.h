#ifndef OOP_OBJECT_H
#define OOP_OBJECT_H 1

/* ==========================================
 * Base Object Layout
 * ========================================== */
/*
 * Every object starts with a Virtual Table Pointer (vptr).
 * This pointer is the link to the object's specific methods (vtable).
 * All classes defined using the CLASS macro automatically reserve 
 * space for this pointer at offset 0.
 *
 * Object Layout:
 * Memory Address (Offset) | Field
 * ------------------------|---------------------------
 * 0                     | Virtual Table Pointer (vptr)
 * PTR_SIZE              | First member variable (if any)
 */
 
/* Define the offset of the Virtual Table Pointer (vptr) */
.set OBJECT.vptr, 0

#endif
