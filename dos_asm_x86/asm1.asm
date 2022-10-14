; Let's Code: x86 Assembler
; Episode 0x01: Hello World
org 0x100	; Start at memory address 256 because 
		; the first 256 bytes are being used by msdos program

start:
	mov bx, string
repeat:
	mov al, [bx]
	test al, al	; If al == 0 flag will be set
	jz end
	push bx		; Store value
	mov ah, 0x0e
	mov bx, 0x000f	; 00 is the text mode and 0f is the color white
	int 0x10
	pop bx		; Restore value
	inc bx		; Point to the next character
	jmp repeat
end:
	int 0x20	; Terminate interrupt for DOS
	
	; AX, 	  BX, 	  CX, 	  DX
	; AH, AL, BH, BL, CH, CL, DH, DL
	; CS, DS, ES
	; SS, IP, Flags	
string:
	db "Hello, world! ", 0x01, 0xA, 0x00	
				; 0x01 is a smiley face and 0x00 is
				; a terminating byte in ASCII DOS

