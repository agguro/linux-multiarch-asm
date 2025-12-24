; #######################################################################
;
;                               smqtoa
;
; Procedure for converting a 64-bit signed integer from memory to ASCII
; without any leading "0"
;
; Return:   Null-terminated ASCII string in memory
;           EAX = address of first character of the string
;           ECX = number of characters in string (excluding terminating 0)
;
; Usage:    invoke smqtoa,lpQW,lpBuf
;
;   where:  
;   lpQW  = pointer to the location of the qword in memory
;   lpBuf = pointer to a memory buffer for the null-terminated ASCII
;           string (a 22-byte buffer is sufficient for the largest of
;           numbers, i.e. 20 digits maximum, sign and the terminating 0)
;
; EAX, ECX and EDX are trashed. EBX, ESI and EDI are preserved.
;
; NOTE: This procedure cannot determine if the data pointed to by
;       lpQW is a valid signed QWORD INTEGER. It is the responsibility
;       of the programmer to insure that. No error code can be returned.
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

;smqtoa PROTO :DWORD, :DWORD

.code

smqtoa proc uses ebx esi edi lpsrc:DWORD, lpdest:DWORD

LOCAL x10 :DWORD
LOCAL r10L :DWORD
LOCAL r10H :DWORD
LOCAL t1 :DWORD
LOCAL t2 :DWORD

      mov   esi,lpsrc         ;memory address of QWORD
      mov   edi,lpdest        ;buffer address
      mov   ebx,[esi]         ;EBX = low DWORD of QWORD
      mov   esi,[esi+4]       ;ESI = high DWORD of QWORD
      add   edi,21            ;=>22th byte of the buffer
      push  edi
      mov   byte ptr[edi],0   ;string terminating 0
      mov   r10L,0CCCCCCCDh   ;low DWORD of "magic number" multiplier
      mov   r10H,0CCCCCCCCh   ;high DWORD of "magic number" multiplier
      mov   x10,10

      test  esi,esi
      push  esi               ;save for retrieving sign later
      .if   SIGN?
            not   esi
            not   ebx
            add   ebx,1
            adc   esi,0
      .endif

; multiplications of two 64-bit numbers will be required as long as
; the "quotient" is greater than a DWORD
; the result of such a multiplication has potentially up to 127 bits

   @@:
      .if   esi != 0          ;if still greater than a DWORD
            xor   ecx,ecx     ;for the 96-127 bits

;multiply the "magic number" by the low DWORD

            mov   eax,r10L
            mul   ebx         ;multiply by the low DWORD
            mov   t1,edx      ;keep only the higher 32 bits (32-63)
            mov   eax,r10H
            mul   ebx
            add   t1,eax      ;add to the previous 32 bits
            adc   edx,0       ;add any overflow to the 64-95 bits
            mov   t2,edx      ;store those bits

;multiply the "magic number" by the high DWORD and add

            mov   eax,r10L
            mul   esi         ;multiply by the high DWORD
            add   t1,eax      ;add the 32-63 bits
            adc   t2,edx      ;add with carry the 64-95 bits
            adc   ecx,0       ;transfer the carry to the 96-127 bits
            mov   eax,r10H
            mul   esi
            add   eax,t2      ;add with the previous 64-95 bits
            adc   edx,ecx     ;add with carry with the previous 96-127 bits
            mov   ecx,t1      ;retrieve the lower 32-63 bits
            shrd  ecx,eax,3   ;binary fractional "remainder" back in ECX
            shrd  eax,edx,3   ;low DWORD of quotient in EAX
            inc   ecx         ;precaution against occasional "underflow"
            shr   edx,3       ;high DWORD of quotient in EDX
            mov   ebx,eax     ;low DWORD of quotient back in EBX
            mov   esi,edx     ;high DWORD of quotient back in ESI
            mov   eax,ecx     ;binary fractional "remainder" back in EAX
            mul   x10         ;=>"decimal" remainder into EDX
            add   dl,30h      ;convert remainder to ascii
            dec   edi         ;back to previous digit in buffer
            mov   [edi],dl    ;insert it into buffer
            jmp   @B
      .endif

; multiplications of DWORDs will be sufficient after "quotient" is
; reduced to a DWORD.

   @@:
      mov   eax,ebx           ;current DWORD quotient
      mul   r10L              ;multiply by "magic number" for DWORD
      shrd  eax,edx,3         ;binary fractional "remainder" back in EAX
      shr   edx,3             ;EDX = quotient
      inc   eax               ;precaution against occasional "underflow"
      mov   ebx,edx           ;save current quotient in EBX
      mul   x10               ;=> "decimal" remainder into EDX
      dec   edi               ;back to previous digit in buffer
      add   dl,30h            ;convert remainder to ascii
      mov   [edi],dl          ;insert it into buffer
      test  ebx,ebx           ;test if done
      jnz   @B                ;continue if not done
      pop   esi               ;retrieve high DWORD of original QWORD
      test  esi,esi
      jns   @F
      dec   edi
      mov   byte ptr[edi],"-"
   @@:
      pop   ecx
      mov   eax,edi           ;EAX = address of first character
      sub   ecx,edi           ;ECX = number of characters
      ret

smqtoa endp

end
