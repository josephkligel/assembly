; Hello World program - Count to 10 using the itoa functions

%include 'functions.asm'

SECTION .text
global _start

_start:
	
	mov ecx, 0

nextNumber:
	inc ecx
	mov eax, ecx
	call iprintLF		; Call new integer printing function
	cmp ecx, 10
	jne nextNumber

	call quit
