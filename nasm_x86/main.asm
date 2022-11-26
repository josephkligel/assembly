%include "./libraries/strlib.asm"
SECTION .bss

SECTION .data
	msg: db 'Hello', 0Ah

SECTION .text
global _start

_start:

	print
	
	mov eax, 0
	mov ebx, 1
	int 80h
