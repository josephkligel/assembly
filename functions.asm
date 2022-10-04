; int slen(String message)
; String length calculation function

slen:
	push ebx
	mov ebx, eax

nextchar:
	cmp byte [eax], 0
	jz finished
	inc eax
	jmp nextchar

finished:
	sub eax, ebx
	pop ebx
	ret

sprint:
	push edx
	push ecx
	push ebx
	push eax
	call slen

	mov edx, eax
	pop eax
	
	mov ecx, eax
	mov ebx, 1
	mov eax, 4
	int 80h
	
	pop ebx
	pop ecx
	pop edx
	ret

sprintLF:
	call sprint
	
	push eax	; Perserve eax in the stack while it is being used elsewhere
	mov eax, 0Ah
	push eax	; Push line feed character onto stack
	mov eax, esp	; Move the address of the current stack pointer into eax
	call sprint
	pop eax		; Remove address of linefeed from the stack
	pop eax		; Restore the original value of eax before our function was called
	ret	

quit:
	mov ebx, 0
	mov eax, 1
	int 80h
	ret
