SECTION .data
msg: db 'This and that, uh huh',0Ah
len: equ $-msg

SECTION .text
global _start

_start:

	mov edx, len
	mov ecx, msg
	mov ebx, 1
	mov eax, 4
	int 80h

	mov ebx, 0
	mov eax, 1
	int 80h 
