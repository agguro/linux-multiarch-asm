/* include/oop/object.h */

#ifndef OOP_OBJECT_H
#define OOP_OBJECT_H 1

/* ==========================================
 * Base Object Layout
 * ========================================== */

/* Define the offset of the Virtual Table Pointer (vptr).
 * FIX: Use an underscore to avoid the ambiguous '.' syntax that caused the 
 * "invalid character '\'" error during macro expansion.
 */
.set OBJECT_VPTR_OFFSET, 0

#endif
