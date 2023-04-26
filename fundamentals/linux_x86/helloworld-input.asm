%include 'functions.asm'

SECTION .data
msg1 db 'Please enter your name: ', 0h
msg2 db 'Hello, ', 0h

SECTION .bss
sinput: resb 255	; Reserve 255 bytes in memory

SECTION .text
global _start

_start:
	mov eax, msg1
	call sprint

	mov edx, 255	; Number of bytes to read
	mov ecx, sinput	; Reserved space to store our input
	mov ebx, 0	; Write to the STDIN file
	mov eax, 3	; Invoke SYS_READ
	int 80h

	mov eax, msg2
	call sprint
	
	mov eax, sinput	; Move our buffer into eax
	call sprint	; Call our print function

	call quit
