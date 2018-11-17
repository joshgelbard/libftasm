	default	rel
	global	_ft_memset

	section	.text
_ft_memset:
	cld
	mov		r8, rdi ; destination address -- save to return later
	mov		eax, esi ; fill byte
	mov		rcx, rdx ; len
	rep		stosb ; do { mov byte [rdi] al; inc rdi; dec rcx } while rcx != 0
	mov		rax, r8
	ret
