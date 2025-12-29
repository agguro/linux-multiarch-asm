%ifndef __FPU_INC__
%define __FPU_INC__

SRC_FPU         equ   00001b
SRC_EXTENDED    equ   00010b
SRC_DOUBLE      equ   00100b
SRC_SINGLE      equ   01000b

DEST_FPU        equ   10001b
DEST_EXTENDED   equ   10010b
DEST_DOUBLE     equ   10100b
DEST_SINGLE     equ   11000b

;errors
ERR_FPU_EMPTY	equ 	-1

SRC1_FPU    equ   1
SRC1_REAL   equ   2
SRC1_REAL4  equ   10000h
SRC1_REAL8  equ   20000h
SRC1_DMEM   equ   4
SRC1_QMEM   equ   1000000h
SRC1_DIMM   equ   8
SRC1_CONST  equ   10h

SRC2_FPU    equ   100h
SRC2_REAL   equ   200h
SRC2_REAL4  equ   40000h
SRC2_REAL8  equ   80000h
SRC2_DMEM   equ   400h
SRC2_QMEM   equ   2000000h
SRC2_DIMM   equ   800h
SRC2_CONST  equ   1000h

DEST_MEM    equ   0
DEST_MEM4   equ   100000h
DEST_MEM8   equ   200000h
DEST_IMEM   equ   40h
DEST_IMEM8  equ   400000h
;DEST_FPU    equ   80h

ANG_DEG     equ   0
ANG_RAD     equ   20h

STR_REG     equ   0
STR_SCI     equ   8000h

FPU_PI      equ   1
FPU_NAPIER  equ   2

XAM_VALID   equ   1
XAM_ZERO    equ   2
XAM_NEG     equ   4
XAM_SMALL   equ   8
XAM_INFINIT equ   16

CMP_EQU     equ   1
CMP_GREATER equ   2
CMP_LOWER   equ   4

%endif
