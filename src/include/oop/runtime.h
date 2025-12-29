#ifndef OOP_RUNTIME_H
#define OOP_RUNTIME_H 1

/* ==========================================
 * Runtime Type Information (RTTI) Definition
 * ========================================== */

/* * The TYPEINFO mechanism is required for advanced features like 
 * dynamic casting (dynamic_cast<>) and type checking (instanceof / is_a).
 * * RTTI Design:
 * We store a pointer to the type information immediately BEFORE the vtable label.
 * This means: TypeInfo is located at vtable[-1] (vtable minus 8 bytes).
 */

/*
 * TYPEINFO Macro
 * ------------------------------------------
 * Creates the RTTI structure for a specific class.
 * Arguments:
 * name: The name of the class (e.g., Dog).
 * * Output Structure in .rodata:
 * - A 8-byte pointer (quad) pointing to the start of the string (\name_type).
 * - A NULL-terminated ASCII string (asciz) containing the class name.
 */
.macro TYPEINFO name
    /* Store the pointer to the type name string */
    .quad \name\()_type
    
    /* Define the label for the type name string */
\name\()_type:
    /* Store the NULL-terminated string (the actual class name) */
    .asciz "\name"
.endm

#endif
