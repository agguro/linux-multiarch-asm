%include "../includes/startup.inc"

     BITS 16
     
os_main:
     ; initialisation of kernel
     ; cs, ds, es, fs, gs and ss points to same segment (where kernel is loaded)
     ; sp points to last word of stacksegment
     cld
     mov       ax, cs                   ; Set all segments to match where kernel is loaded
     mov       ds, ax                   
     mov       es, ax                   
     mov       fs, ax                   
     mov       gs, ax
     cli                                ; Clear interrupts
     mov       ss, ax                   ; Set stack segment and pointer
     mov       sp, 0FFFEh
     sti                                ; Restore interrupts
     mov       byte[bootdrive], dl      ; save boot drive letter
     
     mov       ax, 0x4F02
     mov       bx, 0x107              ; <-1280x1024 256 = 107h colors
     mov       ax,0x4F02
     int       0x10

     ; print welcome screen
     ;mov       si, welcome
     ;call      Print
     
     ; load file from cd
     mov       si, shell
     call      LoadFile     
     jc        NotFound                 ; file wasn't found, so not loaded and will not be executed
     call      Execute
     jmp       Continue
     
NotFound:
     mov       si, [fileName]
     call      Print
     mov       si, notfound
     call      Print
     mov       si, pressAnyKey
     call      Print
     xor       ah, ah
     int       0x16                                                   ; wait for key press

Continue: 

osloop:

     hlt
     jmp       osloop
        
welcome:       db   'Mini Kernel example by Agguro - Version 1.0.0 Beta', 10, 13, 0
bootdrive:     db   0
fileName:      dw   0
shell:          db  'SHELL.BIN', 0

directoryEntrySize:      db   0
fileSector:              dd   0
fileSize:                dd   0
fileNameLength:          db   0
fileNameEntry:           TIMES 255 db ' '     
fileEntryNumber:         db   0
notfound:                db   " not found.",10,13,0
pressAnyKey:             db   "press any key to continue...",10,13,0
stackpointer:            dw   0

databyte:  db "00h",10,13,0

SPECIFICATION_PACKET     specificationPacket
DISK_ADDRESS_PACKET      diskAddressPacket,SHELLCS,SHELLIP
     
Print:
     pusha
     mov       ah, 0Eh             ; int 10h teletype function
     mov       bx, 0x000F
.repeat:
     lodsb                         ; Get char from string
     cmp       al, 0
     je        .done               ; If char is zero, end of string
     int       10h                 ; Otherwise, print it
     jmp       .repeat             ; And move on to next char
.done:
     popa
     ret

LoadFile:
; Call Check Extensions Present?
     mov       [fileName], si
     pushad
     mov       es, word[diskAddressPacket.segment]
     mov       di, word[diskAddressPacket.offset]
     mov       dl, byte[bootdrive]                                    ; Prepare to read CD-ROM, load boot drive
     
     mov       ah, 0x42                                               ; Read from drive function, DL holds the boot drive
     mov       si, diskAddressPacket                                  ; Load SI with address of the Disk Address Packet
     int       0x13                                                   ; Call read sector from drive
     jc        NonBootable
     mov       eax, dword[es:di+158]                                  ; LBA of root directory, where all things start.
     mov       dword[diskAddressPacket.start_absolute_sector], eax    ; Load packet with new address on CD of the root directory
     mov       ah, 0x42                                               ; Read from drive function, DL holds the boot drive
     mov       si, diskAddressPacket                                  ; Load SI with address of DAP
     int       0x13
     jnc       SearchFile

NonBootable:
     popad
     stc
     ret                                                              ; reboot system

SearchFile:     
.nextDirEntry:
    
     mov       al, byte[es:di]                                        ; Length of the current directory entry
     mov       byte[directoryEntrySize],al
     mov       eax, dword[es:di+2]                                    ; Starting sector of directory entry
     mov       dword[fileSector], eax
     mov       eax, dword[es:di+10]                                   ; Size of file on CD/DVD/BD
     mov       dword[fileSize], eax

     mov       al, byte[es:di+32]                                     ; File's name length (see El Torito of ISO:9660 or CDROM.ASM)
     dec       al                                                     ; for trailing ;
     dec       al                                                     ; for trailing 1
     mov       byte[fileNameLength], al

     xor       bx, bx
     xor       cx, cx
     mov       si, di
     add       si, 33
     mov       bx, fileNameEntry
     mov       al, byte[fileNameLength]

.LoopFileNameEntry:

     mov       al, byte[es:si]
     mov       byte[ds:bx], al
     inc       bx
     inc       cx
     inc       si
     xor       ax, ax
     mov       al, byte[fileNameLength]
     cmp       cx, ax
     jne        .LoopFileNameEntry

     mov       byte[ds:bx],0

     mov       si, fileNameEntry
     push      di
     mov       di, [fileName]
    
.CompareLoop:

     mov       al, byte[si]        ; Grab byte from ESI
     mov       bl, byte[di]        ; Grab byte from EDI
     cmp       al, bl              ; Compare if they are equal
     jne       .NotEqual           ; They aren't equal

     and       al, al              ; Both bytes are null
     jz        .compareDone

     inc       di             ; Increment EDI
     inc       si             ; Increment ESI
     jmp       .CompareLoop           ; Start looping

.NotEqual:
     stc                        ; Set the carry flag to indicate failure
     jmp       .compareEnd

.compareDone:

     clc                 ; Clear the carry flag to indicate success

.compareEnd:
    
     pop       di
     jnc       .nextsector
     
     xor       cx, cx                                   ; Prepare CX to do math for DI
     mov       cl, byte[directoryEntrySize]                 ; Get the size of the directory entry
     add       di, cx                                   ; Add that size to the DI to get to the next record
     cmp       byte[es:di],0                          ; Is the next entry = 0?
     je        NonBootable                                     ; If so, we're at the end of the directory, move on

     xor       cx, cx
     mov       bx, fileNameEntry

.ClearFileNameEntry:

     mov       byte[ds:bx],0                           ; Erase the begin
     inc       bx
     inc       cx
     cmp       cx, 254
     jb        .ClearFileNameEntry
     mov       byte[ds:bx],0
     jmp       SearchFile.nextDirEntry

.nextsector:     
     mov       eax, dword[fileSector]
     mov       dword[diskAddressPacket.start_absolute_sector], eax             ; Save the starting sector into DAP
     mov       eax, dword[fileSize]
     xor       edx, edx
     mov       ebx, 2048
     div       ebx
     inc       eax
     mov       [diskAddressPacket.sectors_to_read], ax    ; Save number of sectors to read

     mov       dl, byte[bootdrive]                      ; boot drive in DL
     mov       ah,0x42                                  ; Read from drive function
     mov       si,diskAddressPacket                    ; Load SI with address of the Disk Address Packet
     int       0x13                                     ; Call read sector from drive
     jc        NonBootable                                  ; Nope, hosed, get out
     
     mov       eax,dword[diskAddressPacket]
     popad
     clc
     ret

Execute:
     ; pushing stackpointer onto stack won't work
     mov       word[stackpointer], sp        ; save stackpointer in memory
     mov       ax, SHELLCS                     ; Set all segments to match where kernel is loaded
     mov       ds, ax                   
     mov       es, ax                   
     mov       fs, ax                   
     mov       gs, ax
     mov       ax, SHELLSS               ; stacksegment at last useable segment in low RAM
     cli
     push      sp
     mov       ss, ax
     mov       sp, SHELLSP               ; stackpointer at last word of stack
     sti
     clc
     cld
     xor       ax, ax
     xor       bx, bx
     xor       cx, cx
     xor       dx, dx
     xor       si, si
     xor       di, di
     xor       bp, bp
     call      SHELLCS:SHELLIP
     mov       ax, cs
     cli
     mov       ss, ax
     pop       sp
     sti
     mov       ds, ax                   
     mov       es, ax                   
     mov       fs, ax                   
     mov       gs, ax
     mov       sp, word[stackpointer]
     ret       
