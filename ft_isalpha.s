	default	rel
	global	_ft_isalpha

	section	.text
_ft_isalpha:
	xor		eax, eax
	and		edi, -33 ; Zeroing the 32's bit is an effective toupper()
	sub		edi, 'A'
	cmp		edi, 25
	setbe	al ; see ft_isdigit.s for "the range trick"
	ret
