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
.macro ENDCLASS name
    /* * Calculates padding bytes needed to align to PTR_SIZE.
     * Formula: (PTR_SIZE - (CurrentSize % PTR_SIZE)) % PTR_SIZE 
     * This avoids the "symbol definition loop" error by calculating
     * the new size in a single, atomic step, rather than depending on
     * the symbol's previous state in the definition line.
     */
    
    .set _current_size, \name\().size
    
    /* Calculate the required padding amount */
    .set _pad, (PTR_SIZE - (_current_size % PTR_SIZE)) % PTR_SIZE
    
    /* Apply the padding by setting the symbol to the calculated final size */
    .set \name\().size, _current_size + _pad
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
