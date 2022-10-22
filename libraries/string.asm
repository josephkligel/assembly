;; ----------- String Functions ------------
;; All functions are under the assumption a string is stored in eax register
push eax
push ebx	
push ecx
push edx			; Save register values on the stack
mov ecx, 0			; Set counter to zero

length:
	cmp byte [eax], 0	; Is the current value a null byte
	jz end			; If null end function
	inc ecx			; Add 1 to the count if a byte is present 
	inc eax			; Point eax to the next character in the string
	call length		; Call function again
	
end:
	mov ebx, 0
	mov eax, 1
	int 80h
	ret

pop eax
pop ebx
pop ecx
pop edx
