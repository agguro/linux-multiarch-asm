;name: %{FileName}.asm
;
;description: static library / archive %{FileName}.a
;
;remark: use nm %{FileName}.a for a list of published functions

bits 64

%include "%{FileName}.inc"

section .bss

section .data

section .text

