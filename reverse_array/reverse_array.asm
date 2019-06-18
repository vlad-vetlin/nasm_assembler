%include 'stud_io.inc'

section .bss

	array resb 32

section .text

	xor ecx, ecx

start:
	GETCHAR
	
	cmp ax, 10
	jz exit

	push ax
	inc ecx

	jmp start

exit:
	pop ax
	PUTCHAR al

	loop exit


	PUTCHAR 10
	FINISH
