%include 'string.asm'
SECTION .bss

SECTION .data
	msg: db 'Hello', 0Ah

SECTION .text
global _start

_start:
	mov eax, msg
	call length
	mov eax, [ecx]
	int 80h
	
