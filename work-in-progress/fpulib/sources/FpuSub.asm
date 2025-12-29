; #########################################################################
;
;                             FpuSub
;
;##########################################################################

  ; -----------------------------------------------------------------------
  ; This procedure was written by Raymond Filiatreault, December 2002
  ; Modified March 2004 to avoid any potential data loss from the FPU
  ; Revised January 2005 to free the FPU st7 register if necessary.
  ; Revised January 2010 to allow additional data types from memory to be
  ;    used as source parameters and allow additional data types for storage. 
  ;
  ;                           Src1 - Src2 -> Dest
  ;
  ; This FpuSub function subtracts the Src2 number from the Src1 number
  ; with the FPU and returns the result as a REAL number at the specified
  ; destination (the FPU itself or a memory location), unless an invalid
  ; operation is reported by the FPU or the definition of the parameters
  ; (with uID) is invalid.
  ;
  ; Either of the two sources can be:
  ; a REAL number from the FPU itself, or
  ; a REAL4, REAL8 or REAL10 from memory, or
  ; an immediate DWORD integer value, or
  ; a DWORD or QWORD integer from memory, or
  ; one of the FPU constants.
  ;
  ; None of the sources are checked for validity. This is the programmer's
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

FpuSub proc public lpSrc1:DWORD, lpSrc2:DWORD, lpDest:DWORD, uID:DWORD
        
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;
; Because a library is assembled before its functions are called, all
; references to external memory data must be qualified for the expected
; size of that data so that the proper code is generated.
;
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

LOCAL content[108] :BYTE
LOCAL tempst       :TBYTE

      test  uID,SRC1_FPU or SRC2_FPU      ;is data taken from FPU?
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
;check source for Src1 and load it to FPU
;----------------------------------------

      test  uID,SRC1_FPU
      .if   !ZERO?            ;Src1 is taken from FPU?
            lea   eax,content
            fld   tbyte ptr[eax+28]
            jmp   src2        ;check next parameter for Src2
      .endif

      mov   eax,lpSrc1
      test  uID,SRC1_CONST
      jnz   constant
      test  uID,SRC1_REAL
      .if !ZERO?              ;Src1 is an 80-bit REAL10 in memory?
            fld   tbyte ptr [eax]
            jmp   src2        ;check next parameter for Src2
      .endif
      test  uID,SRC1_REAL8
      .if !ZERO?              ;Src1 is a 64-bit REAL10 in memory?
            fld   qword ptr [eax]
            jmp   src2        ;check next parameter for Src2
      .endif
      test  uID,SRC1_REAL4
      .if !ZERO?              ;Src1 is a 32-bit REAL10 in memory?
            fld   dword ptr [eax]
            jmp   src2        ;check next parameter for Src2
      .endif

      test  uID,SRC1_DMEM
      .if !ZERO?              ;Src1 is a 32-bit integer in memory?
            fild  dword ptr [eax]
            jmp   src2        ;check next parameter for Src2
      .endif
      test  uID,SRC1_QMEM
      .if !ZERO?              ;Src1 is a 64-bit integer in memory?
            fild  qword ptr [eax]
            jmp   src2        ;check next parameter for Src2
      .endif

      test  uID,SRC1_DIMM
      .if   !ZERO?            ;Src1 is an immediate 32-bit integer?
            fild  lpSrc1
            jmp   src2        ;check next parameter for Src2
      .endif

      ;otherwise no valid ID for Src1

srcerr:
      frstor content
srcerr1:
      xor   eax,eax           ;error code
      ret

constant:
      cmp   eax,FPU_PI
      jnz   @F
      fldpi
      jmp   src2
   @@:
      cmp   eax,FPU_NAPIER
      jnz   srcerr            ;no correct CONST for Src1
      fld1
      fldl2e
      fsub  st,st(1)
      f2xm1
      fadd  st,st(1)
      fscale
      fstp  st(1)

;----------------------------------------
;check source for Src2 and load it to FPU
;----------------------------------------

src2:
      test  uID,SRC2_FPU
      .if   !ZERO?            ;Src2 is taken from FPU?
            lea   eax,content
            fld   tbyte ptr[eax+28] ;retrieve it from the stored data
            jmp   dest0       ;go complete process
      .endif

      mov   eax,lpSrc2
      test  uID,SRC2_CONST
      jnz   constant2
      test  uID,SRC2_REAL
      .if   !ZERO?            ;Src2 is an 80-bit REAL10 in memory?
            fld   tbyte ptr [eax]
            jmp   dest0       ;go complete process
      .endif
      test  uID,SRC2_REAL8
      .if   !ZERO?            ;Src2 is a 64-bit REAL10 in memory?
            fld   qword ptr [eax]
            jmp   dest0       ;go complete process
      .endif
      test  uID,SRC2_REAL4
      .if   !ZERO?            ;Src2 is a 32-bit REAL10 in memory?
            fld   dword ptr [eax]
            jmp   dest0       ;go complete process
      .endif

      test  uID,SRC2_DMEM
      .if   !ZERO?            ;Src2 is a 32-bit integer in memory?
            fild  dword ptr [eax]
            jmp   dest0       ;go complete process
      .endif
      test  uID,SRC2_QMEM
      .if   !ZERO?            ;Src2 is a 64-bit integer in memory?
            fild  qword ptr [eax]
            jmp   dest0       ;go complete process
      .endif

      test  uID,SRC2_DIMM
      .if   !ZERO?            ;Src2 is an immediate 32-bit integer?
            fild  lpSrc2
            jmp   dest0       ;go complete process
      .endif
      jmp   srcerr            ;no correct flag for Src2

constant2:
      cmp   eax,FPU_PI
      jnz   @F
      fldpi                   ;load pi (3.14159...) on FPU
      jmp   dest0             ;go complete process
   @@:
      cmp   eax,FPU_NAPIER
      jnz   srcerr            ;no correct CONST for Src2
      fld1
      fldl2e
      fsub  st,st(1)
      f2xm1
      fadd  st,st(1)
      fscale
      fstp  st(1)

dest0:
      fsub
      fstsw ax                ;retrieve exception flags from FPU
      fwait
      shr   eax,1             ;test for invalid operation
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

      test  uID,SRC1_FPU or SRC2_FPU      ;was any data taken from FPU?
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
    
FpuSub endp

; #########################################################################

end
