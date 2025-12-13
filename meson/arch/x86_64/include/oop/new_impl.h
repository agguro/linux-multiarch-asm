#ifndef OOP_NEW_IMPL_H
#define OOP_NEW_IMPL_H 1

.macro NEW_IMPL class, obj
    mov $\class\().size, %rdi
    call malloc
    mov %rax, \obj
    leaq \class\()_vtable(%rip), %rcx
    mov %rcx, (\obj)
.endm

#endif
