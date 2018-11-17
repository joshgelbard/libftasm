	default	rel
	global	_ft_strdup
	extern	_malloc

	section	.text
_ft_strdup:
	push	rdi ; preserve s1
; get size of source string and send it to malloc
	xor		eax, eax
	xor		ecx, ecx
	not		rcx
	repnz	scasb ; rcx = -strlen - 2
	not		rcx ; rcx = buflen = strlen + 1
	push	rcx ; preserve buflen
	mov		rdi, rcx ; also send to malloc
	sub		rsp, 8 ; 16byte-align
	call	_malloc ; rax = ptr to new buf
	add		rsp, 8
; copy original string into buffer
	mov		rdi, rax
	pop		rcx ; buflen
	pop		rsi ; s1
	rep		movsb
	ret
