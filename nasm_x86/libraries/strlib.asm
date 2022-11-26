
%macro print 0
	mov eax, "H"
	mov ebx, $-[eax]
	mov ecx, 4
	mov edx, 1

	int 80h	
%endmacro
