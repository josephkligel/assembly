%include 'functions.asm'

SECTION .text
global _start

_start:
	pop ecx		; First value on the stack is the number of args
	
nextArg:
	cmp ecx, 0h	; Check to see if any args are left
	jz noMoreArgs
	pop eax		; Pop the next arg off the stack
	call sprintLF
	dec ecx		; Decrease ecx by 1
	jmp nextArg	

noMoreArgs:
	call quit
