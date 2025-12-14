#ifndef OOP_VTABLE_H
#define OOP_VTABLE_H 1

/* ============================================================
 * VTABLE DEFINITIONS (Generic)
 * ============================================================ */

/* * VTABLE Macro
 * ------------------------------------------
 * Starts the definition of a class's Virtual Table (VTable).
 * Arguments:
 * name: The name of the class (e.g., Dog).
 * * * Actions:
 * 1. Switches to the '.data.rel.ro' section (Read-Only Data, important for security).
 * 2. Ensures 8-byte alignment.
 * 3. Declares the VTable label globally (\name_vtable).
 * 4. Defines the start label.
 */
.macro VTABLE name
    .section .data.rel.ro
    .align 8
    .globl \name\()_vtable
\name\()_vtable:
.endm

/* * VFUNC Macro
 * ------------------------------------------
 * Adds a function pointer (method address) to the VTable at the current index.
 * Arguments:
 * label: The label of the function/method (e.g., dog_speak).
 */
.macro VFUNC label
    .quad \label
.endm

/* * ENDVTABLE Macro
 * ------------------------------------------
 * Closes the VTable definition and switches the assembler back to 
 * the text (code) section.
 */
.macro ENDVTABLE
    .text
.endm

#endif
