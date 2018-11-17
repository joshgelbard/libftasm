	default	rel
	global	_ft_bzero

	section	.text

_ft_bzero:
	cmp		rsi, 128 ; for very small sizes, stosb is actually slower
	jle		.shortbuf
	cld
	xor		eax, eax
	mov		rcx, rsi
	rep		stosb
	ret

.shortbuf:
	sub		rsi, 8
	jl		.bytes_start
	mov		qword [rdi], 0
	add		rdi, 8
	jmp		.shortbuf
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
