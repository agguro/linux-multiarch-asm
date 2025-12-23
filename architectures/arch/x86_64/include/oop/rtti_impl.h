/* arch/x86_64/include/oop/rtti_impl.h (Final Corrected Code) */

#ifndef OOP_RTTI_IMPL_H
#define OOP_RTTI_IMPL_H 1

/* ============================================================
 * SET_TYPE_IMPL (RTTI Implementation)
 * ------------------------------------------------------------
 * WARNING: This implementation conflicts with VTable-based polymorphism.
 * Use only if your object layout reserves offset 0 for RTTI, not the VTable.
 * ============================================================ */

/*
 * Macro: SET_TYPE_IMPL (RTTI-based Type Setting)
 * Description: Stores a pointer to the type information structure 
 * at the start of the object.
 * Arguments: obj (register with object pointer), class (class name label)
 */
.macro SET_TYPE_IMPL obj, class
    /* Load the address of the typeinfo structure (e.g., Dog_typeinfo).
     * FIX: Use the simplified concatenation (removes problematic backslashes).
     */
    leaq \class_typeinfo(%rip), %r11
    
    /* Write the TypeInfo pointer to the first 8 bytes of the object. */
    mov %r11, (\obj)
    
    /* NOTE: If VTable is also required, this macro MUST NOT be executed, 
     * or the object layout must be redefined.
     */
.endm

#endif
