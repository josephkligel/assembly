%include 'functions.asm'

SECTION .text
global _start

_start:
	mov ecx, 0	; ecx is initialized to zero

nextNumber:
	inc ecx		; Increment ecx

	mov eax, ecx	; Move the address of our integer into eax
	add eax, 48	; Add 48 to the number to convert to Ascii
	push eax	; Push eax to the stack
	mov eax, esp	; Get the address of the character from the stack
	call sprintLF

	pop eax		; Clean up stack of unneeded bytes
	cmp ecx, 10	; Check if 10 has been reached
	jne nextNumber	; Jump if not equal and keep counting

	call quit
