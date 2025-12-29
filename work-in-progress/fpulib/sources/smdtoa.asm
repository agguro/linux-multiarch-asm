; #######################################################################
;
;                               smdtoa
;
; Procedure for converting a 32-bit signed integer to ASCII without
; any leading "0"
;
; Return:   Null-terminated ASCII string in memory
;           EAX = address of first character of the string
;           ECX = number of characters in string (excluding terminating 0)
;
; Usage:    invoke smdtoa,src,lpBuf
;
;   where:  
;   src   = dword to be converted
;   lpBuf = pointer to a memory buffer for the null-terminated ASCII
;           string (a 12-byte buffer is sufficient for the largest of
;           numbers, i.e. 10 digits maximum, sign, and the terminating 0)
;
; EAX, ECX and EDX are trashed. EBX, ESI and EDI are preserved.
;
; NOTE: This procedure cannot determine if the source dword is a valid
;       signed DWORD INTEGER. It is the responsibility of the
;       programmer to insure that. No error code can be returned.
;
;                       by Raymond Filiatreault
;                            Otober 2009
;                            MASM  syntax
;
; The "m" in the procedure name is to indicate that this procedure is
; based on the principal of multiplying by the reciprocal of 10 instead
; of dividing by 10, i.e. the use of "magic numbers".
;
; #######################################################################

      .686                   ; minimum processor needed for 32 bit
      .model flat, stdcall   ; FLAT memory model & STDCALL calling
      option casemap :none   ; set code to case sensitive

; #######################################################################

;smdtoa PROTO :DWORD, :DWORD

.code

smdtoa proc uses ebx edi src:DWORD, lpdest:DWORD

      mov   edi,lpdest        ;buffer address
      mov   eax,src
      add   edi,11            ;=>12th byte of the buffer
      push  edi
      mov   ecx,0CCCCCCCDh    ;"magic number" multiplier for division by 10
      mov   ebx,10
      mov   byte ptr[edi],0   ;string terminating 0
      test  eax,eax
      .if   SIGN?
            neg   eax
      .endif
   @@:
      mul   ecx               ;multiply by magic number
      shrd  eax,edx,3         ;binary fractional "remainder" back in EAX
      shr   edx,3             ;EDX = quotient
      inc   eax               ;precaution against occasional "underflow"
      push  edx               ;save current quotient for next division
      mul   ebx               ;x10 gets "decimal" remainder into EDX
      dec   edi               ;back to previous digit in buffer
      add   dl,30h            ;convert remainder to ascii
      mov   [edi],dl          ;insert it into buffer
      pop   eax               ;retrieve current quotient
      test  eax,eax           ;test if done
      jnz   @B                ;continue if not done
      mov   eax,src           ;retrieve original dword
      test  eax,eax
      .if   SIGN?
            dec   edi
            mov   byte ptr[edi],"-"
      .endif
      pop   ecx
      mov   eax,edi           ;EAX = address of first character
      sub   ecx,edi           ;ECX = number of characters
      ret

smdtoa endp

end
