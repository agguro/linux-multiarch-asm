;name: %{FileName}.asm
;
;description: shared library lib%{FileName}.so
;
;remark: use objdump -T lib%{FileName}.so | grep "DF" for exported functions
;            objdump -T lib%{FileName}.so | grep "DO" for exported symbols

bits 64

%include "%{FileName}.inc"

section .bss

section .data

section .rodata

section .text

;TODO start code here

