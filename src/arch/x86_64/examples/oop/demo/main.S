#include "oop.h"
#include "circle.S"

.set V_DRAW, 1

.text
.globl main
main:
    # 1. Stack setup
    push %rbp
    mov %rsp, %rbp
    
    # We gaan %rbx gebruiken, dus we moeten de originele waarde even opslaan
    # voor we hem overschrijven (netjes zijn voor het OS).
    push %rbx
    and $-16, %rsp

    # ==========================
    # DEEL 1: De Cirkel
    # ==========================
    
    # Sla het object op in RBX (De Veilige Kluis)
    NEW Circle, %rbx

    # Zet RBX in RDI voor de functieaanroep
    mov %rbx, %rdi
    VCALL %rdi, V_DRAW
    
    # HIER GING HET FOUT:
    # RDI is nu kapotgemaakt door printf in Draw.
    # Maar RBX is nog veilig! We zetten hem terug.
    mov %rbx, %rdi
    DELETE %rdi

    # ==========================
    # DEEL 2: De Vorm (Shape)
    # ==========================
    
    # Sla het object op in RBX
    NEW Shape, %rbx
    
    # Voorbereiden voor call
    mov %rbx, %rdi
    VCALL %rdi, V_DRAW
    
    # Herstellen voor delete
    mov %rbx, %rdi
    DELETE %rdi

    # Exit setup
    xor %rax, %rax
    
    # Herstel de originele RBX
    pop %rbx
    
    leave
    ret

.section .note.GNU-stack,"",@progbits
