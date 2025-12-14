/* arch/x86_64/include/oop/vcall_impl.h */

#ifndef OOP_VCALL_IMPL_H
#define OOP_VCALL_IMPL_H 1

/*
 * Macro: VCALL_IMPL (Virtual Call Implementation)
 * Description: Calls a method dynamically via the object's VTable.
 * ABI Requirement: The first argument (the 'this' pointer) MUST be in %rdi.
 *
 * Usage: VCALL_IMPL %rax, 0  (Call method at index 0 on object in %rax)
 */
.macro VCALL_IMPL obj, index
    # 1. Fetch the VTable pointer from the start of the object.
    #    We use %rcx as a scratch register.
    mov (\obj), %rcx
    
    # 2. Retrieve the function address from the VTable.
    #    Calculation: Index * 8 bytes (pointer size).
    #    Store address in %rax for the jump.
    mov \index * 8(%rcx), %rax
    
    # 3. CRITICAL: Set the 'this' pointer.
    #    We copy the object address to %rdi, as required by the System V ABI.
    mov \obj, %rdi
    
    # 4. Execute Indirect Call
    #    The asterisk (*) indicates we are jumping to an address stored in a register.
    call *%rax
.endm

#endif
