# arch/x86_64/include/oop/delete_impl.h

.macro DELETE_IMPL obj
    # 1. Check of object null is (optioneel, maar netjes, zoals 'delete nullptr')
    cmp $0, \obj
    je 2f

    # 2. Bewaar de object pointer veilig op de stack
    push \obj

    # 3. Haal vtable en destructor op
    mov (\obj), %r11      # Gebruik r11 als scratch
    mov (%r11), %rax      # Veronderstelt dat Destructor ALTIJD op index 0 staat
    test %rax, %rax
    jz 1f

    # 4. Stel 'this' in en roep destructor aan
    mov \obj, %rdi        # ZET THIS POINTER!
    call *%rax            # Destructor mag registers trashen

1:
    # 5. Haal originele pointer terug van stack voor 'free'
    pop %rdi              # Zet direct in RDI (1e argument voor free)
    call free

2:
    # Done
.endm
