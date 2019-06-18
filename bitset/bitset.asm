%include 'stud_io.inc'

section .bss
	array resd 16

section .text



	call get_number
	mov edx, eax   ; считываем количество цифр в строке

start_input:

	xor eax, eax
	xor ebx, ebx
	xor ecx, ecx

	call get_number    ; read current number
	
	call get_indexes

	add eax, array
	or [eax], ebx
		
	dec edx
	jnz start_input

	mov ecx, 16
	mov edx, array

start_print:
	
	mov eax, dword [edx]
	call print_in_bites
	PUTCHAR 32
	
	add edx, 4
	loop start_print

	PUTCHAR 10
	PUTCHAR 10
	PUTCHAR 10


	call get_number
	mov edx, eax

start_input_second_block:
	
	call get_number
	
	call get_indexes

	add eax, array

	mov ecx, [eax]
	mov eax, ecx
	or eax, ebx

	cmp eax, ecx
	jz is_exist

	PUTCHAR 48
	PUTCHAR 10

continue_second_block:
	
	dec edx
	jnz start_input_second_block

	FINISH


is_exist:
	PUTCHAR 49
	PUTCHAR 10
	jmp continue_second_block

get_number:
	push ebx

	xor eax, eax
	xor ebx, ebx

get_number_start_cycle:
	GETCHAR
	
	cmp al, 10
	jz get_number_end_cycle
	
	sub eax, 48
	
	push eax
	mov eax, ebx
	mov bl, 10
	mul bl
	mov ebx, eax
	pop eax

	add ebx, eax
	jmp get_number_start_cycle

get_number_end_cycle:
	mov eax, ebx
	
	pop ebx
	
	ret


print_in_bites:
	push eax
	push ebx
	push ecx

	mov ecx, 32

print_in_bites_start_cycle:
	mov ebx, eax
	and ebx, 1
	add bl, 48

	PUTCHAR bl

	shr eax, 1
	loop print_in_bites_start_cycle
	
	pop ecx
	pop ebx
	pop eax

	ret


get_indexes:
	mov ecx, eax
	
	and ecx, 11111b
	shr eax, 5

	mov ebx, 1
	shl ebx, cl

	push ebx
	mov ebx, 4
	mul bl
	pop ebx

	ret
