	default	rel
	global	_ft_isprint

	section .text
_ft_isprint:
	xor		eax, eax
	sub		edi, ' '
	cmp		edi, 94
	setbe	al ; see ft_isdigit.s for the "range trick"
	ret
