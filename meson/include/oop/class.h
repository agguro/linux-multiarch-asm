#ifndef OOP_CLASS_H
#define OOP_CLASS_H 1

/* ==========================================
 * Architecture Validation
 * ========================================== */
/* * PTR_SIZE acts as the source of truth for the pointer width 
 * of the target architecture (e.g., 8 for x86_64, 4 for MIPS).
 *
 * If this is missing, offsets will be calculated incorrectly.
 * We must halt the build immediately to prevent silent failures.
 */
.ifndef PTR_SIZE
    .error "FATAL ERROR: PTR_SIZE is not defined! Define it in your config or build arguments."
.endif

/* ==========================================
 * CLASS Definition
 * ========================================== */
/* * Initializes the class size.
 * We rely on PTR_SIZE to reserve space for the Virtual Table Pointer (vptr)
 * at offset 0.
 */
.macro CLASS name
    .set \name\().size, PTR_SIZE
.endm

/* ==========================================
 * FIELD Definition
 * ========================================== */
/*
 * Defines a member variable (field).
 * 1. Sets the offset of the field to the current class size.
 * 2. Increments the total class size by the field size.
 */
.macro FIELD class, field, size
    .set \class\().\field, \class\().size
    .set \class\().size, \class\().size + \size
.endm

/* ==========================================
 * EXTENDS (Inheritance)
 * ========================================== */
/*
 * Inheritance logic.
 * Sets the child's initial size to the parent's total size.
 * This ensures new fields in the child class are appended 
 * after the parent's fields.
 */
.macro EXTENDS parent, child
    .set \child\().size, \parent\().size
.endm

/* ==========================================
 * ENDCLASS (Padding & Alignment)
 * ========================================== */
/*
 * Finalizes the class definition.
 * Argument: name (The name of the class)
 *
 * It calculates if the total size is aligned to PTR_SIZE.
 * If not, it adds padding bytes. This ensures arrays of objects
 * remain aligned in memory.
 */
.macro ENDCLASS name
    .set _rem, \name\().size % PTR_SIZE
    .if _rem > 0
        .set _pad, PTR_SIZE - _rem
        .set \name\().size, \name\().size + _pad
    .endif
.endm

/* ==========================================
 * METHOD Registration
 * ========================================== */
/*
 * Adds a function pointer to the current section (usually .rodata).
 * This is used inside a VTable definition to list methods.
 */
.macro METHOD class, index, label
    .pushsection .rodata
        .quad \label
    .popsection
.endm

#endif
