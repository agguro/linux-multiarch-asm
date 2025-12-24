; #########################################################################
;
;                             FpuChs
;
;##########################################################################

  ; -----------------------------------------------------------------------
  ; This procedure was written by Raymond Filiatreault, December 2002
  ; Modified March 2004 to avoid any potential data loss from the FPU
  ; Revised January 2005 to free the FPU st7 register if necessary.
  ; Revised January 2010 to allow additional data types from memory to be
  ;    used as source parameter and allow additional data types for storage. 
  ;
  ;                           -(Src) -> Dest
  ;
  ; This FpuChs function changes the sign of a REAL number (Src) and returns
  ; the result at the specified destination (the FPU itself or a memory
  ; variable), unless an invalid operation is reported by the FPU or the
  ; definition of the parameters (with uID) is invalid.
  ;
  ; The source can only be a REAL number from the FPU itself or either a
  ; REAL4, REAL8 or REAL10 from memory. (The sign of integers can be changed
  ; easily with a CPU instruction.)
  ;
  ; The source is not checked for validity. This is the programmer's
  ; responsibility.
  ;
  ; Only EAX is used to return error or success. All other CPU registers
  ; are preserved.
  ;
  ; IF a source is specified to be the FPU top data register, it would be
  ; removed from the FPU. It would be replaced by the result only if the
  ; FPU is specified as the destination.
  ;
  ; IF source data is only from memory
  ; AND the FPU is specified as the destination for the result,
  ;       the st7 data register will become the st0 data register where the
  ;       result will be returned (any valid data in that register would
  ;       have been trashed).
  ;
  ; -----------------------------------------------------------------------

    .386
    .model flat, stdcall  ; 32 bit memory model
    option casemap :none  ; case sensitive

    include Fpu.inc

    .code

; #########################################################################

FpuChs proc public lpSrc:DWORD, lpDest:DWORD, uID:DWORD
        
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;
; Because a library is assembled before its functions are called, all
; references to external memory data must be qualified for the expected
; size of that data so that the proper code is generated.
;
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

LOCAL content[108] :BYTE
LOCAL tempst       :TBYTE

      test  uID,SRC1_FPU      ;is Src taken from FPU?
      jz    continue

;-------------------------------
;check if top register is empty
;-------------------------------

      fxam                    ;examine its content
      fstsw ax                ;store results in AX
      fwait                   ;for precaution
      sahf                    ;transfer result bits to CPU flag
      jnc   continue          ;not empty if Carry flag not set
      jpe   continue          ;not empty if Parity flag set
      jz    srcerr1           ;empty if Zero flag set

continue:
      fsave content

;----------------------------------------
;check source for Src and load it to FPU
;----------------------------------------

      test  uID,SRC1_FPU
      .if   !ZERO?            ;Src is taken from FPU?
            lea   eax,content
            fld   tbyte ptr[eax+28]
            jmp   dest0       ;go complete process
      .endif
      
      mov   eax,lpSrc
      test  uID,SRC1_REAL
      .if   !ZERO?            ;Src is an 80-bit REAL10 in memory?
            fld   tbyte ptr[eax]
            jmp   dest0       ;go complete process
      .endif
      test  uID,SRC1_REAL8
      .if   !ZERO?            ;Src is a 64-bit REAL8 in memory?
            fld   qword ptr[eax]
            jmp   dest0       ;go complete process
      .endif
      test  uID,SRC1_REAL4
      .if   !ZERO?            ;Src is a 32-bit REAL4 in memory?
            fld   dword ptr[eax]
            jmp   dest0       ;go complete process
      .endif

srcerr:
      frstor content
srcerr1:
      xor   eax,eax
      ret

   @@:
      mov   eax,lpSrc
      fld   tbyte ptr[eax]

dest0:
      fchs      

      fstsw ax                ;retrieve exception flags from FPU
      fwait
      shr   al,1              ;test for invalid operation
      jc    srcerr            ;clean-up and return error

; store result as specified

      test  uID,DEST_FPU      ;check where result should be stored
      .if   !ZERO?            ;destination is the FPU
            fstp  tempst      ;store it temporarily
            jmp   restore
      .endif
      mov   eax,lpDest
      test  uID,DEST_MEM4
      .if   !ZERO?            ;store as REAL4 at specified address
            fstp  dword ptr[eax]
            jmp   restore
      .endif
      test  uID,DEST_MEM8
      .if   !ZERO?            ;store as REAL8 at specified address
            fstp  qword ptr[eax]
            jmp   restore
      .endif
      fstp  tbyte ptr[eax]    ;store as REAL10 at specified address (default)

restore:
      frstor  content         ;restore all previous FPU registers

      test  uID,SRC1_FPU      ;was Src taken from FPU
      jz    @F
      fstp  st                ;remove source

   @@:
      test  uID,DEST_FPU      ;check where result should be stored
      .if   !ZERO?            ;destination is the FPU
            ffree st(7)       ;free it if not already empty
            fld   tempst      ;return the result on the FPU
      .endif

      or    al,1              ;to insure EAX!=0
      ret
    
FpuChs endp

; #########################################################################

end
