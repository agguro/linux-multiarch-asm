; #########################################################################
;
;                             FpuExam
;
;##########################################################################

  ; -----------------------------------------------------------------------
  ; This procedure was written by Raymond Filiatreault, December 2002
  ; Modified March 2004 to avoid any potential data loss from the FPU
  ; Revised January 2010 to allow additional data types from memory to be
  ;    used as source parameters. Also corrected a potential bug. 
  ;
  ; This FpuExam function examines a REAL number (Src) for its validity,
  ; its sign, a value of zero, an absolute value less than 1, and a value
  ; of infinity.
  ; The result is returned in EAX as coded bits:
  ;         EAX = 0     invalid number
  ;         bit 0       1 = valid number
  ;         bit 1       1 = number is equal to zero
  ;         bit 2       1 = number is negative
  ;         bit 3       1 = number less than 1 but not zero
  ;         bit 4       1 = number is infinity
  ; If the source was on the FPU, it will be preserved if no error is
  ; reported.
  ;
  ; The source can only be a REAL number from the FPU itself or either a
  ; REAL4, REAL8 or REAL10 from memory.
  ;
  ; Only EAX is used to return the result. All other CPU registers are
  ; preserved. All FPU registers are also preserved.
  ;
  ; -----------------------------------------------------------------------

    .386
    .model flat, stdcall  ; 32 bit memory model
    option casemap :none  ; case sensitive

    include Fpu.inc

    .code

; #########################################################################

FpuExam proc public uses edx lpSrc:DWORD, uID:DWORD
        
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;
; Because a library is assembled before its functions are called, all
; references to external memory data must be qualified for the expected
; size of that data so that the proper code is generated.
;
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

LOCAL content[108] :BYTE

      test  uID,SRC1_FPU      ;is data taken from FPU?
      jz    @F                ;continue if not

;-------------------------------
;check if top register is empty
;-------------------------------

      fxam                    ;examine its content
      fstsw ax                ;store results in AX
      fwait                   ;for precaution
      sahf                    ;transfer result bits to CPU flag
      jnc   @F                ;not empty if Carry flag not set
      jpe   @F                ;not empty if Parity flag set
      jz    srcerr1           ;empty if Zero flag set

   @@:
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
      ftst                    ;test number
      fstsw ax                ;retrieve exception flags from FPU
      fwait
      shr   al,1              ;invalid operation?
      jc    srcerr

      xor   edx,edx
      sahf                    ;transfer flags to CPU flag register
      jnz   @F                ;if not 0 value or NAN
      jc    examine           ;go check for infinity or NAN value
      or    edx,XAM_ZERO or XAM_SMALL
      jmp   finish            ;no need for checking for sign or size if 0
      
   @@:
      jnc   @F                ;number is not negative
      or    edx,XAM_NEG

;check for size smaller than 1 by comparing the absolute value to 1

   @@:
      fabs                    ;make sure it is positive
      fld1                    ;for comparing to 1
      fcompp                  ;compare 1 to absolute value and pop both
      fstsw ax                ;retrieve result flags from FPU
      fwait
      sahf                    ;transfer flags to CPU flag register
      jc    finish            ;src>1
      jz    finish            ;src=1
      or    edx,XAM_SMALL     ;value less than 1 

finish:
      frstor content
      mov   eax,edx
      or    al,1              ;to indicate source was a valid number
      ret

examine:                      ;strictly for infinity value
      fxam
      fstsw ax                ;retrieve result of fxam
      fwait
      sahf                    ;transfer flags to CPU flag register
      jpo   srcerr            ;must be NAN
      or    edx,XAM_INFINIT
      jmp   finish
      

FpuExam endp

; #########################################################################

end
