#ifndef OOP_CALL_IMPL_H
#define OOP_CALL_IMPL_H 1

/* * x86_64 - VCALL_IMPL
 * * ABI EIS: Het eerste argument (de 'this' pointer) MOET in %rdi staan.
 */
.macro VCALL_IMPL obj, index
    # 1. Haal de VTable pointer uit het begin van het object
    #    We gebruiken %rcx als tijdelijk register
    mov (\obj), %rcx
    
    # 2. Haal het functie-adres uit de VTable
    #    Index * 8 bytes (want 64-bit pointers)
    #    We zetten het adres in %rax voor de jump straks
    mov \index * 8(%rcx), %rax
    
    # 3. CRUCIAAL: Zet het object zelf in %rdi
    #    Dit is de 'this' pointer voor de methode die we gaan roepen.
    mov \obj, %rdi
    
    # 4. Roep de functie aan
    call *%rax
.endm

/* Directe (niet-virtuele) call */
.macro CALL_IMPL func
    call \func
.endm

#endif
