SECTION .data
msg: db 'Hello, brave new world!', 0Ah

SECTION .text
global _start:

_start:
	
	mov ebx, msg	; Move the address of the msg string into ebx
	mov eax, ebx	; Move the address in ebx into eax as well

nextchar:
	cmp byte [eax],0	; Compare the byte to by eax to zero
	jz finished		; If zero flag is set jump to finished
	inc eax			; Increment by one byte
	jmp nextchar		; If zero flag is not set, nextchar is repeated
	
finished:
	sub eax, ebx	; Subtract the address in ebx from eax
			; Remember eax has been incremented
			; When subtracting one address from another,
			; the result is the number of bytes btw them

	mov edx, eax
	mov ecx, msg
	mov ebx, 1
	mov eax, 4
	int 80h

	mov ebx, 0
	mov eax, 1
	int 80h
	
