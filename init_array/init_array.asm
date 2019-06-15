%include 'stud_io.inc'

section .bss

	array resb 10

section .text

	mov ecx, 10
	mov al, 'X'
	mov edi, array

again:
	mov [edi], al
	inc edi
	dec ecx
	jnz again

	mov ecx, 10
	mov edi, array

again_print:
	PUTCHAR [edi]
	inc edi
	dec ecx
	jnz again_print
	
	PUTCHAR 10
	FINISH
