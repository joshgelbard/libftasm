	default	rel
	global	_ft_isascii

	section	.text
_ft_isascii:
	xor		eax, eax
	cmp		edi, 127
	setbe	al ; see ft_isdigit.s for the "range trick"
	ret
