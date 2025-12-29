; #########################################################################
;
;                             FpuRound
;
;##########################################################################

  ; -----------------------------------------------------------------------
  ; This procedure was written by Raymond Filiatreault, December 2002
  ; Modified January 2004 to remove data section
  ; Modified March 2004 to avoid any potential data loss from the FPU
  ; Revised January 2005 to free the FPU st7 register if necessary.
  ; Revised January 2010 to allow additional data types from memory to be
  ;    used as source parameters and allow additional data types for storage.
  ;    Added checking for overflow when storing the result as an integer. 
  ;
  ; This FpuRound function rounds a REAL number (Src) to the nearest
  ; integer and returns the integer portion at the specified destination,
  ; unless an invalid operation is reported by the FPU or the definition
  ; of the parameters (with uID) is invalid.
  ;
  ; The source can only be a REAL number from the FPU itself or either a
  ; REAL4, REAL8 or REAL10 from memory.
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

FpuRound proc public lpSrc:DWORD, lpDest:DWORD, uID:DWORD
        
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

dest0:
      push  eax               ;reserve space on CPU stack
      fstcw [esp]             ;get current control word
      fwait
      mov   ax,[esp]
      and   ax,0f3ffh         ;code it for rounding
      push  eax
      fldcw [esp]             ;change rounding code of FPU to round

      frndint                 ;round the number
      pop   eax               ;get rid of last push
      fldcw [esp]             ;load back the former control word
      
      fstsw ax                ;retrieve exception flags from FPU
      fwait
      shr   al,1              ;test for invalid operation
      pop   eax               ;clean CPU stack
      jc    srcerr            ;clean-up and return error

; store result as specified

      test  uID,DEST_FPU      ;check where result should be stored
      .if   !ZERO?            ;destination is the FPU
            fstp  tempst      ;store it temporarily
            jmp   restore
      .endif
      mov   eax,lpDest
      test  uID,DEST_IMEM
      .if   !ZERO?            ;store as DWORD at specified address
            fistp dword ptr[eax]
            jmp   integersave
      .endif
      test  uID,DEST_IMEM8
      .if   !ZERO?            ;store as QWORD at specified address
            fistp qword ptr[eax]
            jmp   integersave
      .endif
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

      test  uID,SRC1_FPU      ;was any data taken from FPU?
      jz    @F
      fstp  st                ;remove source

   @@:
      test  uID,DEST_FPU
      jz    @F                ;the result has been stored in memory
                              ;none of the FPU data was modified

      ffree st(7)             ;free it if not already empty
      fld   tempst            ;load the result on the FPU
   @@:
      or    al,1              ;to insure EAX!=0
      ret

integersave:
      fstsw ax                ;retrieve exception flags from FPU
      fwait
      shr   al,1              ;test for invalid operation
      jc    srcerr            ;clean-up and return error
      jmp   restore
    
FpuRound endp

; #########################################################################

end
