%include 'stud_io.inc'

section .bss
	
	array resb 256

section .text

	mov edi, array
	mov ecx, 5
	mov eax, '@'

	call fill_array

	mov ecx, 5
	mov edi, array

print_start:
	PUTCHAR [edi]
	inc edi
	loop print_start

	PUTCHAR 10
	FINISH



fill_array:
	mov [edi], al
	inc edi
	loop fill_array

	ret
