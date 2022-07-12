SECTION .data

msg: db "Hello, World", 10
msglen: equ $-msg

global _start

SECTION .text
_start:
	mov eax, 4	;Sys_write call
	mov ebx, 1	;File descriptor for stdout
	mov ecx, msg	;offset of msg string
	mov edx, msglen	;Length of string
	int 80h

	mov eax, 1
	mov ebx, 0
	int 80h
	
