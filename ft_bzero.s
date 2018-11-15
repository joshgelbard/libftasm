	default	rel
	global	_ft_bzero

	section	.text
_ft_bzero:	
	cmp		rsi, 0
	je		.done
	mov		[rdi], byte 0
	dec		rsi
	inc		rdi
	jmp		_ft_bzero
.done:
	ret
