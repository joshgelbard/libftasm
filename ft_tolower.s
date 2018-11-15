	default	rel
	global	_ft_tolower

	section	.text
_ft_tolower:
	mov		eax, edi ; store original in eax
	lea		edx, [edi+32] ; if edi was in 'A'-'Z', this is the lowercase version
	lea		ecx, [edi-65] ; see ft_isdigit.s for "the range trick"
	cmp		ecx, 25
	cmovbe	eax, edx ; return wasuppercase(edi) ? edx : eax
	ret
