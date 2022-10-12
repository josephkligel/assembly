; Calculator - Addition

%include 'functions.asm'

SECTION .text
global _start

_start:
	mov eax, 90	; Move first number into eax
	mov ebx, 9	; Move second number into ebx
	add eax, ebx	; Add ebx to eax
	call iprintLF	; Call integer print with linefeed function

	call quit
