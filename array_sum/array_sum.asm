%include 'stud_io.inc'

section .bss

	array resw 10

section .text

	mov cx, 10
	mov esi, array

lp:
	mov [esi], cx
	add esi, 4
	loop lp

	mov ax, 0
	mov cx, 10
	mov esi, array

sum_lp:
	add ax, [esi]
	add esi, 4
	loop sum_lp

	cmp ax, 55
	je is_equal

	PUTCHAR 48 ; 0
	PUTCHAR 10
	FINISH

is_equal:
	PUTCHAR 49 ;1
	PUTCHAR 10
	FINISH
