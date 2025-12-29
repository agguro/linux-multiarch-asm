;Name:         bootloader64.asm
;Build:        see makefile
;Source:       http://wiki.osdev.org/Entering_Long_Mode_Directly
;Description:  64 Bits Bootloader from snippets of site mentioned in source.
;              To test a virtual machine is required. In the makefile qemu is used, VirtualBox compllains that longmode isn't
;              supported, so that part of the code works too ;)
;              All credits go to the creator of this code.
;              My small contribution is the makefile so you can build your floppy and iso images and providing more info (maybe too
;              much) on some topics.
;To do's:      switch to a higher screen resolution (800x600 at least)
;              check memory
;              load files to continue in the environment, my idea is to make a old msdos debug like program.
;To test this program install qemu (sudo apt-get install qemu-system)


;constants used in the source file
%define FREE_SPACE 0x9000

;LongModeDirectly
%define PAGE_PRESENT    (1 << 0)
%define PAGE_WRITE      (1 << 1)
%define CODE_SEG        0x0008
%define DATA_SEG        0x0010

;offset of program start
ORG 0x7C00

BITS 16
;Main entry point where BIOS leaves us.
;Start of the program (thus at address 0x0000:0x7C00)

main:
        ;Some BIOS' may load us at 0x0000:0x7C00 while other may load us at 0x07C0:0x0000.
        ;Do a far jump to fix this issue, and reload CS to 0x0000.

        jmp     0x0000:.flushCS               
                                     
.flushCS:

        xor     ax, ax          ;AX = 0
        ;initialize all segmentregisters to 0x0000
        ;codesegment is already at 0x0000
        
        mov     ss, ax
        mov     ds, ax
        mov     es, ax
        mov     fs, ax
        mov     gs, ax
        
        ;Set up stack so that it starts below Main.
        mov     sp, main

        ;set direction flag (to increment memory addresses)
        cld
 
        ;Check whether we support Long Mode or not.
        call    CPUCheck
        jc      main.NoLongMode
 
        ;Point edi to a free space bracket.
        mov     edi, FREE_SPACE
       
        ;Switch to Long Mode.
        jmp     SwitchToLongMode
  
BITS 64
.Long:
        hlt
        jmp     .Long

;print message that CPU doesn't support long mode 
BITS 16
.NoLongMode:
        mov     si, NoLongMode
        call    Print
.Die:
        hlt
        jmp     .Die

;****************************
;Here we switch to Longmode
;****************************

ALIGN 4
IDT:
        .Length         dw 0
        .Base           dd 0
 
;Function to switch directly to long mode from real mode.
;Identity maps the first 2MiB.
;Uses Intel syntax.
 
;es:edi    Should point to a valid page-aligned 16KiB buffer, for the PML4, PDPT, PD and a PT.
;ss:esp    Should point to memory that can be used as a small (1 dword ) stack
 
SwitchToLongMode:
      ;Zero out the 16KiB buffer.
      ;Since we are doing a rep stosd, count should be bytes/4.   
        push    di                              ;REP STOSD alters DI.
        mov     ecx, 0x1000
        xor     eax, eax
        cld
        rep     stosd
        pop     di                              ;Get DI back.
  
  
;Build the Page Map Level 4.
;es:di points to the Page Map Level 4 table.
        lea     eax, [es:di + 0x1000]                   ;Put the address of the Page Directory Pointer Table in to EAX.
        or      eax, PAGE_PRESENT | PAGE_WRITE          ;Or EAX with the flags - present flag, writable flag.
        mov     [es:di], eax                            ;Store the value of EAX as the first PML4E.
  
  
;Build the Page Directory Pointer Table.
        lea     eax, [es:di + 0x2000]                   ;Put the address of the Page Directory in to EAX.
        or      eax, PAGE_PRESENT | PAGE_WRITE          ;Or EAX with the flags - present flag, writable flag.
        mov     [es:di + 0x1000], eax                   ;Store the value of EAX as the first PDPTE.
  
;Build the Page Directory.
        lea     eax, [es:di + 0x3000]                   ;Put the address of the Page Table in to EAX.
        or      eax, PAGE_PRESENT | PAGE_WRITE          ;Or EAX with the flags - present flag, writeable flag.
        mov     [es:di + 0x2000], eax                   ;Store to value of EAX as the first PDE.
   
        push    di                                      ;Save DI for the time being.
        lea     di, [di + 0x3000]                       ;Point DI to the page table.
        mov     eax, PAGE_PRESENT | PAGE_WRITE          ;Move the flags into EAX - and point it to 0x0000.
    
;Build the Page Table.
.LoopPageTable:
        mov     [es:di], eax
        add     eax, 0x1000
        add     di, 8
        cmp     eax, 0x200000           ;If we did all 2MiB, end.
        jb      .LoopPageTable
        pop     di                      ;Restore DI.
  
      ;Disable IRQs
        mov     al, 0xFF                ;Out 0xFF to 0xA1 and 0x21 to disable all IRQs.
        out     0xA1, al
        out     0x21, al
        nop
        nop
        lidt    [IDT]                   ;Load a zero length IDT so that any NMI causes a triple fault.
  
;Enter long mode.
        mov     eax, 10100000b          ;Set the PAE and PGE bit.
        mov     cr4, eax
        mov     edx, edi                ;Point CR3 at the PML4.
        mov     cr3, edx
        mov     ecx, 0xC0000080         ;Read from the EFER MSR. 
        rdmsr    
        or      eax, 0x00000100         ;Set the LME bit.
        wrmsr
        mov     ebx, cr0                ;Activate long mode -
        or      ebx,0x80000001          ;- by enabling paging and protection simultaneously.
        mov     cr0, ebx                    
        lgdt    [GDT.Pointer]           ;Load GDT.Pointer defined below.
        jmp     CODE_SEG:LongMode       ;Load CS with 64 bit segment and flush the instruction cache
  
  
;Global Descriptor Table
GDT:
.Null:
        dq      0x0000000000000000      ;Null Descriptor - should be present.
 
.Code:
        dq      0x0020980000000000      ;64-bit code descriptor. 
        dq      0x0000900000000000      ;64-bit data descriptor. 
 
ALIGN 4
        dw      0                       ;Padding to make the "address of the GDT" field aligned on a 4-byte boundary
 
.Pointer:
        dw      $ - GDT - 1             ;16-bit Size (Limit) of GDT.
        dd      GDT                     ;32-bit Base Address of GDT. (CPU will zero extend to 64-bit)

BITS 64      
LongMode:
        mov     ax, DATA_SEG
        mov     ds, ax
        mov     es, ax
        mov     fs, ax
        mov     gs, ax
  
        ;Blank out the screen to a blue color.
        mov     edi, 0xB8000
        mov     rcx, 500                        ;Since we are clearing QWORDs over here, we put the count as Count/4.
        mov     rax, 0x1F201F201F201F20         ;Set the value to set the screen to: Blue background, white foreground, blank spaces.
        rep     stosq                           ;Clear the entire screen.

        ;Display "Hello World!"
        mov     edi, 0xb8000              
        mov     rax, 0x1F6C1F6C1F651F48    
        mov     rcx, 1
        stosq
        mov     rax, 0x1F6F1F571F201F6F
        stosq
        mov     rax, 0x1F211F641F6C1F72
        stosq

        jmp     main.Long                       ;You should replace this jump to wherever you want to jump to.
    
;**********************************    

BITS 16

        NoLongMode      db      "ERROR: CPU does not support long mode.",0

;*** Checks whether CPU supports long mode or not. ***
;*** Returns with carry set if CPU doesn't support long mode. ***
 
CPUCheck:
        ;Check whether CPUID is supported or not.
        pushfd                  ;Get flags (32 bits) in EAX register.
        pop     eax
        mov     ecx, eax        ;save original state of flags in ECX  
        xor     eax, 0x200000   ;toggle bit 21 ID-flag to check if CPUID is supported 
        push    eax             ;save value in flag register
        popfd
        pushfd                  ;get flags (32 bits) again in EAX register 
        pop     eax
        xor     eax, ecx        ;compare original settings with new loaded one
        shr     eax, 21         ;shift bit 21 to LSBit of EAX
        and     eax, 1          ;check whether bit 21 is set or not. If EAX now contains 0, CPUID isn't supported.
        push    ecx             ;restore original flags
        popfd 
        test    eax, eax        ;check if EAX is zero
        jz      .NoCPUID

        ;For our convenience I've added the different EAX values and their signification here
        ;EAX = 80000001h: Extended Processor Info and Feature Bits (in EDX and ECX)
        ;EAX = 80000002h,80000003h,80000004h: Processor Brand String (in EAX, EBX, ECX and EDX.)
        ;EAX = 80000005h: L1 Cache and TLB Identifiers
        ;EAX = 80000006h: Extended L2 Cache Features
        ;EAX = 80000007h: Advanced Power Management Information
        ;EAX = 80000008h: Virtual and Physical address Sizes

        mov     eax, 0x80000000   
        cpuid                           ;get highest extended function supported
        cmp     eax, 0x80000001         ;Check whether extended function 0x80000001 is available are not.
        jb      .NoLongMode             ;If not, long mode not supported.
 
        mov     eax, 0x80000001         ;get Extended Processor Info and Feature Bits  
        cpuid
        test    edx, 1 << 29            ;Test if the LM-bit, is set or not.
        jz      .NoLongMode             ;If not Long mode not supported.
        ret

.NoCPUID:
.NoLongMode:
        stc
        ret

;*** Prints out a message using the BIOS. ***
;ES:SI :       Address of ASCIIZ string to print.

Print: 
        pushad                  ;save 32-bit registers to stack
.Loop:
        lodsb                   ;Load the value at [ES:SI] in AL.
        test    al, al          ;If AL is the terminator character (= 0), stop printing.
        je      Print.Done                      
        mov     ah, 0x0E        ;Bios INT 10/0E write AL to screen
        int     0x10
        jmp     Print.Loop      ;Loop till the null character not found.
.Done:
        popad                   ;restore 32 bit general purpose registers.
        ret

;Pad out file.
        times   510 - ($-$$)    db      0
                                dw      0xAA55          ;x86 specific magic number
                                                        ;indicating this is bootable code