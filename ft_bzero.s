	default	rel
	global	_ft_bzero

	section	.text

_ft_bzero:
	sub		rsi, 8
	jl		.bytes_start
	mov		qword [rdi], 0
	add		rdi, 8
	jmp		_ft_bzero
.bytes_start:
	add		rsi, 8
.bytes:
	sub		rsi, 1
	jl		.done
	mov		byte [rdi], 0
	inc		rdi
	jmp		.bytes
.done:
	ret
