section .text
	global ft_atoi_base ; rdi = string, rsi = base
ft_atoi_base:
	xor rax, rax
	jmp skip_space

increm:
	inc rdi

skip_space:
	cmp byte [rdi], 9
	jz increm
	cmp byte [rdi], 10
	jz increm
	cmp byte [rdi], 11
	jz increm
	cmp byte [rdi], 12
	jz increm
	cmp byte [rdi], 13
	jz increm
	cmp byte [rdi], 32
	jz increm

check_sign:
	cmp byte [rdi], '+'
	jz positive
	cmp byte [rdi], '-'
	jz negative
	jmp check_char

positive:
	mov rdx, 1
	jmp check_char

negative:
	mov rdx, 0
	jmp check_char

check_char:
	cmp byte [rdi], 0
	jz exit
	xor rcx, rcx
	inc rdi
	cmp byte [rdi], '0'
	jz convert
	inc rcx
	cmp byte [rdi], '1'
	jz convert
	inc rcx
	cmp byte [rdi], '2'
	jz convert
	inc rcx
	cmp byte [rdi], '3'
	jz convert
	inc rcx
	cmp byte [rdi], '4'
	jz convert
	inc rcx
	cmp byte [rdi], '5'
	jz convert
	inc rcx
	cmp byte [rdi], '6'
	jz convert
	inc rcx
	cmp byte [rdi], '7'
	jz convert
	inc rcx
	cmp byte [rdi], '8'
	jz convert
	inc rcx
	cmp byte [rdi], '9'
	jz convert
	inc rcx
	cmp byte [rdi], 'a'
	jz convert
	cmp byte [rdi], 'A'
	jz lower
	inc rcx
	cmp byte [rdi], 'b'
	jz convert
	cmp byte [rdi], 'B'
	jz lower
	inc rcx
	cmp byte [rdi], 'c'
	jz convert
	cmp byte [rdi], 'C'
	jz lower
	inc rcx
	cmp byte [rdi], 'd'
	jz convert
	cmp byte [rdi], 'D'
	jz lower
	inc rcx
	cmp byte [rdi], 'e'
	jz convert
	cmp byte [rdi], 'E'
	jz lower
	inc rcx
	cmp byte [rdi], 'f'
	jz convert
	cmp byte [rdi], 'F'
	jz lower
	jmp exit

lower:
	add byte [rdi], 32
	jmp convert

convert:
	cmp rsi, rcx
	jl exit
	xor r8, r8
	mov byte r8, [rdi]
	mul rsi
	cmp rcx, '9'
	jbe convert_num

convert_char:
	sub r8, 87
	add rax, r8
	inc rdi
	jmp check_char

convert_num:
	sub r8, '0'
	add rax, r8
	inc rdi
	jmp check_char

exit:
	ret
