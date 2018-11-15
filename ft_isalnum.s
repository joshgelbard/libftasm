	default	rel
	global	_ft_isalnum

	section	.text
_ft_isalnum:
.isdigit:
	xor		eax, eax
	sub		edi, '0'
	cmp		edi, 9
	setbe	al
	add		edi, '0' ; undo our subtract to prep for isalpha
.isalpha:
	and		edi, -33
	sub		edi, 'A'
	cmp		edi, 25
	setbe	cl
	or		al, cl ; return isdigit(edi) || isalpha(edi)
	ret

; Explanatory comments for .isalpha and .isdigit are in their respective
; source files.
