/* arch/x86_64/include/oop/delete_impl.h */

#ifndef OOP_DELETE_IMPL_H
#define OOP_DELETE_IMPL_H 1

.macro DELETE_IMPL obj
    # 1. Null check (Standard C++ 'delete nullptr' safety)
    #    If the pointer is 0, we do nothing.
    cmp $0, \obj
    je 2f

    # 2. Preserve the object pointer on the stack
    #    We need it later for free(), and the destructor might clobber registers.
    push \obj

    # 3. Fetch VTable and Destructor
    mov (\obj), %r11      # Use %r11 as scratch register to hold VTable address
    mov (%r11), %rax      # Retrieve entry at index 0 (Assumes Destructor is ALWAYS at index 0)
    test %rax, %rax       # Check if destructor exists (is not null)
    jz 1f

    # 4. Setup 'this' and call Destructor
    mov \obj, %rdi        # SET 'THIS' POINTER! (ABI Requirement)
    call *%rax            # Call destructor (Indirect call)

1:
    # 5. Retrieve original pointer from stack for 'free'
    #    Optimization: Pop directly into %rdi (which is the 1st argument for free)
    pop %rdi              
    call free@PLT         # Use @PLT for safe dynamic linking

2:
    # Done
.endm

#endif
