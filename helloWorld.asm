SECTION .data
msg: db 'Hello World!',0Ah

SECTION .text
global _start

_start:
	mov edx,13	;Number of bytes to write
	mov ecx,msg	;Move memory address into ecx register
	mov ebx,1	;Write to stdout file
	mov eax,4	;Invoke SYS_WRITE (kernel opcode 4)
	int 80h

	mov ebx,0	;Return 0 status on exit
	mov eax,1	;Invoke SYS_EXIT (kernel opcode 1)
	int 80h
