/* arch/x86_64/include/oop/new_impl.h */

#ifndef OOP_NEW_IMPL_H
#define OOP_NEW_IMPL_H 1

/*
 * Macro: NEW_IMPL
 * Simulates the C++ 'new' operator.
 * 1. Allocates memory for the object.
 * 2. Initializes the Virtual Pointer (vptr) at the start of the object.
 */
.macro NEW_IMPL class, obj
    # 1. Prepare argument for malloc
    #    We assume the class has a defined size constant (e.g., MyClass.size).
    #    Note: The syntax \class\().size is needed to separate the macro arg from the dot.
    mov $\class\().size, %rdi
    
    # 2. Allocate memory
    #    Resulting pointer returns in %rax.
    #    Using @PLT is recommended for position-independent code.
    call malloc@PLT
    
    # 3. Save the allocated pointer
    #    Move the address from %rax to the user's destination register.
    mov %rax, \obj
    
    # 4. Fetch the VTable address
    #    We load the address of the static VTable associated with this class.
    #    Using RIP-relative addressing for PIE compliance.
    leaq \class\()_vtable(%rip), %rcx
    
    # 5. Initialize the VPtr (Virtual Pointer)
    #    We store the VTable address at the very first 8 bytes of the object.
    #    This allows VCALL_IMPL to find the methods later.
    mov %rcx, (\obj)
.endm

#endif
