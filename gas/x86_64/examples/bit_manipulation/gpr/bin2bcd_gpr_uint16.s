# -----------------------------------------------------------------------------
# Name:        bin2bcd_gpr_uint16
# ABI:         void bin2bcd_gpr_uint16(char *buf, uint16_t val)
# Input:       RDI = Pointer to destination buffer (5 bytes)
#              RSI = 16-bit value (0-65535)
# -----------------------------------------------------------------------------

.section .text
.global bin2bcd_gpr_uint16

bin2bcd_gpr_uint16:
    # 1. Extraction Phase
    # We need digits for 10000, 1000, 100, 10, 1
    movzwq  %si, %rax           # Load 16-bit value
    
    # Extract 10000s
    xor     %rdx, %rdx
    mov     $10000, %rcx
    div     %cx                 # AX = Ten-thousands, DX = Remainder
    movb    %al, 0(%rdi)        # Store 10000s digit immediately
    
    # Extract 1000s
    mov     %dx, %ax
    xor     %rdx, %rdx
    mov     $1000, %rcx
    div     %cx                 # AX = Thousands, DX = Remainder
    mov     %eax, %r8d          # R8 = Thousands Lane
    
    # Extract 100s
    mov     %dx, %ax
    xor     %rdx, %rdx
    mov     $100, %rcx
    div     %cx                 # AX = Hundreds, DX = Remainder
    mov     %eax, %r9d          # R9 = Hundreds Lane
    
    # Extract 10s and 1s
    mov     %dx, %ax
    xor     %rdx, %rdx
    mov     $10, %rcx
    div     %cx                 # AL = Tens, AH = Units
    movzbq  %al, %r10           # R10 = Tens Lane
    movzbq  %ah, %r11           # R11 = Units Lane

    # 2. Parallel Correction Phase (Vertical Lanes)
    # Applying your branch-free "Add 3" logic to digits in parallel

    # --- LANE 1: Thousands (R8) ---
    mov     %r8, %rax           
    add     $3, %r8             
    and     $8, %r8             
    shr     $3, %r8             
    leaq    (%r8, %r8, 2), %r8   
    add     %rax, %r8           

    # --- LANE 2: Hundreds (R9) ---
    mov     %r9, %rax           
    add     $3, %r9             
    and     $8, %r9             
    shr     $3, %r9             
    leaq    (%r9, %r9, 2), %r9   
    add     %rax, %r9           

    # --- LANE 3: Tens (R10) ---
    mov     %r10, %rax          
    add     $3, %r10            
    and     $8, %r10            
    shr     $3, %r10            
    leaq    (%r10, %r10, 2), %r10 
    add     %rax, %r10          

    # --- LANE 4: Units (R11) ---
    mov     %r11, %rax          
    add     $3, %r11            
    and     $8, %r11            
    shr     $3, %r11            
    leaq    (%r11, %r11, 2), %r11 
    add     %rax, %r11          

    # 3. Store Results
    movb    %r8b, 1(%rdi)       # Store Thousands
    movb    %r9b, 2(%rdi)       # Store Hundreds
    movb    %r10b, 3(%rdi)      # Store Tens
    movb    %r11b, 4(%rdi)      # Store Units

    ret
