;name:  mod97.template
;
;description:
;    Template to build multiple programs with the application of modulo97
; 
; This file must not be assembled or linked.
;
;usage: 
; First define the four constants and the macro with the modulo97 algorithm to use/
;
; COMMAND:          The commandname of the application as you should type it in a terminal - here it is the name of the .asm file without the .asm
; PURPOSE:          What the program is used for.
; APPLICATIONTITLE: The title of the application. It's a strange constantname but i didn't found another one. This string will be showed also in the usage
;                   text.
; NUMBERLENGTH:     The length of the number to be checked, two digit modulo97 digits included
; NUMBERSTRING:     same value of NUMBERLENGTH but between double quotes
;
; MODULO97CHECK:    Definition of the modulo97 algorithm that must be applied. Some checks implies a subtarction from 97 to obtain the checkdigits, others doesn't.
;                   That's why I define it as a macro.
;                   RDI already contains the parsed number as hexadecimal.
;
; second include this template file in your asm program
;
;example:
; ----------------------------------------------------------
; name:  bebankacc.asm
; description:
;    Modulo 97 check on Belgian Bankaccount Numbers

; %define COMMAND          "bebankacc"
; %define PURPOSE          "Belgian bank account number check"
; %define APPLICATIONTITLE "Belgian bank account number"
; %define NUMBERLENGTH     12
; %define NUMBERSTRING     "12"

; %macro MODULO97CHECK 0
;      call      modulo97.check
; %endm

; [list -]
;     %include "mod97template.asm"
; [list +]
; ----------------------------------------------------------
;
;future: multi-language with this template(?)

bits 64

[list -]
     %include "unistd.inc"
     extern modulo97.calculate
     extern modulo97.check
     extern modulo97.checkLength
     extern modulo97.parseNumber
[list +]

section .data

     Message:
     .usage:                  db  COMMAND, "2012 - agguro <https://agguro.be>.", 10
                              db  PURPOSE, 10
                              db  "This is free software and you are free to redistribute under <http://www.gnu.org/licenses/> conditions.", 10
                              db  "usage: ",COMMAND," n (where n = ", NUMBERSTRING, " digit ", APPLICATIONTITLE, ".)", 10
     .usagelength:            equ $-Message.usage
     .illegalnumber:          db  "il"
     .legalnumber:            db  "legal number", 10
     .legalnumberlength:      equ $-Message.legalnumber
     .illegalnumberlength:    equ Message.legalnumberlength + 2

section .text
     global _start
    
_start:
     pop       rax                     ; get argc
     cmp       rax, 2                  ; two arguments?
     jne       .usage                  ; nope, show usage
     pop       rax                     ; pointer to programname
     pop       rsi                     ; pointer to number string
     mov       rdi, NUMBERLENGTH
     call      modulo97.checkLength
     jc        .illegalnumber
     call      modulo97.parseNumber
     jc        .illegalnumber
     
     MODULO97CHECK
     
     jc        .illegalnumber
     mov       rsi, Message.legalnumber
     mov       rdx, Message.legalnumberlength
     jmp       .printmessage
.illegalnumber:
     mov       rsi, Message.illegalnumber
     mov       rdx, Message.illegalnumberlength
     jmp       .printmessage
.usage:
     mov       rsi, Message.usage
     mov       rdx, Message.usagelength
.printmessage:     
     call      Write
     syscall   exit, 0
     
Write:
     syscall   write, stdout
     ret
