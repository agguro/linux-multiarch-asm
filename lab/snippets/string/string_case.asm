; ==============================================================================
; File: string_case.asm
; Description: Alphanumeric string case manipulation (Zero-terminated)
; Author: agguro
; ==============================================================================

bits 64
section .text

global togglecase
global tolower
global toupper

; --- Branchless Toggle Case ---
; Input:  DIL (char)
; Output: AL  (char)
togglecase:
    mov     al, dil         ; Copy original input to AL
    mov     dl, al          ; Copy to DL to create the range check
    or      dl, 0x20        ; Force DL to lowercase (e.g., 'A' becomes 'a')
    sub     dl, 'a'         ; Shift range: 'a' becomes 0
    cmp     dl, 25          ; Check if 0 <= DL <= 25 ('z'-'a')
    setbe   dl              ; DL = 1 if it is an alpha character, else 0   
    shl     dl, 5           ; DL becomes 0x20 if it was alpha, else 0x00
    xor     al, dl          ; Toggle bit 5 only if it was an alpha character
    ret

; --- Branchless Convert to Lowercase ---
; Input:  DIL (char)
; Output: AL  (char)
tolower:
    mov     al, dil         ; Copy input to AL
    mov     dl, al          ; Copy to DL for mask generation
    sub     dl, 'A'         ; Shift range: 'A' becomes 0
    cmp     dl, 25          ; Check if 0 <= DL <= 25
    setbe   dl              ; DL = 1 if inside range, else 0
    shl     dl, 5           ; DL becomes 0x20 if in range, else 0x00
    or      al, dl          ; Set bit 5 if uppercase, else keep original
    ret

; --- Branchless Convert to Uppercase ---
; Input:  DIL (char)
; Output: AL  (char)
toupper_branchless:
    mov     al, dil         ; Copy input to AL
    mov     dl, al          ; Copy to DL for mask generation
    sub     dl, 'a'         ; Shift range: 'a' becomes 0
    cmp     dl, 25          ; 'z' - 'a' = 25. Check if 0 <= DL <= 25
    setbe   dl              ; DL = 1 if inside range, else 0
    shl     dl, 5           ; DL becomes 0x20 (bit 5) if in range, else 0x00
    not     dl              ; DL becomes 0xDF (mask) if in range, else 0xFF
    and     al, dl          ; Clear bit 5 if lowercase, else keep original
    ret
    
section .note.GNU-stack noalloc noexec nowrite progbits
