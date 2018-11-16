	default	rel
	global	_ft_strlen

	section .text
_ft_strlen:
	cld ; DF=1 means scan backwards; so make sure it's cleared
	xor		eax, eax ; target byte = '\0'
	xor		ecx, ecx
	not		rcx ; rcx = 0xffffffffff...
	repnz	scasb ; do { inc rdi; dec rcx } while rcx != 0 && byte [rdi] != al
	lea		rax, [rcx + 1] ; rax = -1 - strlen
	not		rax ; ~(-1 - strlen) == strlen
	ret
