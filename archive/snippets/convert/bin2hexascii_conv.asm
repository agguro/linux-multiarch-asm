; ==============================================================================
; File: bin2hexascii_conv.asm
; Version: 7.7 (2025-12-28)
; Description: Fixed Procedure Names, SDE Alignment Errors, and Immediates.
; ==============================================================================

bits 64

global bin2hexascii_uint4
global bin2hexascii_uint8
global bin2hexascii_uint16
global bin2hexascii_uint32
global bin2hexascii_uint64
global bin2hexascii_uint128
global bin2hexascii_uint256
global bin2hexascii_uint512

section .text

; --- 4-bit Nibble to Hex-ASCII ---
bin2hexascii_uint4:
    movzx   eax, dil
    and     al, 0x0F           ;
    cmp     al, 10             ;
    setge   cl                 ;
    movzx   ecx, cl            ;
    imul    ecx, 7             ; Magic 7
    add     al, '0'            ;
    add     al, cl             ;
    ret

; --- 8-bit Byte to Hex-ASCII ---
bin2hexascii_uint8:
    movzx   edi, dil
    mov     eax, edi
    shr     al, 4              ; High nibble
    and     dil, 0x0F          ; Low nibble
    
    ; Process High (Digit 1)
    cmp     al, 10
    setge   cl
    movzx   ecx, cl
    imul    ecx, 7
    add     al, '0'
    add     al, cl
    
    ; Process Low (Digit 2)
    cmp     dil, 10
    setge   cl
    movzx   ecx, cl
    imul    ecx, 7
    add     dil, '0'
    add     dil, cl
    
    shl     eax, 8             ; Shift Digit 1 to AH
    mov     al, dil            ; Digit 2 in AL
    ret

; --- 16-bit Word to Hex-ASCII ---
bin2hexascii_uint16:
    movzx   eax, di
    mov     edx, eax
    shl     edx, 8
    or      eax, edx
    and     eax, 0x00FF00FF    ; Spread to bytes
    mov     edx, eax
    shl     edx, 4
    or      eax, edx
    and     eax, 0x0F0F0F0F    ; Spread to nibbles
    
    mov     edx, eax
    add     edx, 0x06060606    ;
    and     edx, 0x10101010    ; Identify A-F
    shr     edx, 4             ;
    imul    edx, 7             ;
    add     eax, 0x30303030    ;
    add     eax, edx           ;
    bswap   eax                ;
    ret


section .note.GNU-stack noalloc noexec nowrite progbits
