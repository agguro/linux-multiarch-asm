# arch/x86_64/include/oop/rtti_impl.h

# x86_64 implementation of RTTI (Type Info) setting
# In x86 we can move an immediate address directly into memory
.macro SET_TYPE_IMPL obj, class
    leaq \class\()_typeinfo(%rip), %r11  # Laad adres in register (PIC safe)
    mov %r11, (\obj)                     # Schrijf naar object
    # Let op: Dit overschrijft de vtable pointer als je niet oppast!
    # Normaal is TypeInfo onderdeel van de vtable, niet van het object zelf.
    # Maar voor jouw simpele implementatie is dit oké.
.endm
