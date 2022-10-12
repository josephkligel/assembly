; ----------------------------------
; void iprint(Integer number)
; Integer printing function (itoa)
iprint:
	push eax	; All push incantations are to preserve values on the stack
	push ecx
	push edx
	push esi
	mov ecx, 0	; Counter of how many bytes we need to print

divideLoop:
	inc ecx		; Count each byte to print
	mov edx, 0	; empty edx
	mov esi, 10	; Move 10 into source register
	idiv esi	; divide eax by esi
	add edx, 48	; Convert to ascii value of integer. Edx holds remainder
	push edx	; push string representation of integer onto stack
	cmp eax, 0	; Can the integer be divided anymore
	jnz divideLoop	; Jump back to the beginning of divideLoop if not zero

printLoop:
	dec ecx		; Count down each byte on the stack
	mov eax, esp	; Move the stack pointer into eax for printing
	call sprint	; call our string print function
	pop eax		; Remove the character printed to move esp forward
	cmp ecx, 0	; Have all bytes been printed from stack?
	jnz printLoop	; Continue printing if all bytes are not printed
	
	pop esi		; Restore esi from the value we pushed onto the stack
	pop edx		; Ditto
	pop ecx		; Ditto
	pop eax		; Ditto
	ret

; --------------------------
; void iprintLF (int. number)
iprintLF:
	call iprint	; Call integer printing function
	
	push eax	; Preserve current value of eax while eax is used in this function
	mov eax, 0Ah	; Put linefeed ascii character into eax
	push eax	; Push the linefeed onto the stack to get the address
	mov eax, esp	; Move the address of stack pointer into eax
	call sprint	; Call string print function
	pop eax		; Remove linefeed from stack
	pop eax		; Restore original value to eax
	ret
	
;-----------------------------
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
