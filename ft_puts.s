	default	rel
	global	_ft_puts

	section	.text
_ft_puts:
	xor		rdx, rdx ; buf len
	mov		rsi, rdi ; buf addr
	mov		edi, 1 ; fd (must set AFTER mov buf addr)
	cmp		rsi, 0x0 ; special case: ft_puts(NULL) prints "(null)"
	jne		.get_len
	lea		rsi, [rel strnull]
	mov		rdx, 6
	jmp		.writestr
.get_len:
	cmp		byte [rsi+rdx], 0
	jz		.writestr
	inc		rdx
	jmp		.get_len
.writestr:
	mov		eax, 0x02000004 ; write
	syscall
	jc		.fail ; carry flag = syscall failed
.writenl:
	mov		eax, 0x02000004 ; write syscall has clobbered rax
	lea		rsi, [rel newline]
	mov		rdx, 1
	syscall
	jc		.fail ; syscalls signal fail with carry flag
	ret ; return any nonnegative on success is ok per man page
.fail:
	mov		eax, -1 ; return EOF
	ret

	section	.data
newline:	db `\n`
strnull:	db '(null)'

; setting up for write syscall:
;   eax: 0x02000004 (number of write syscall)
;   edi: file descriptor
;   rsi: address of buf
;   rdx: length of buf
; after the call:
;   on success, carry flag will not be set and eax will be nonnegative
;   on error, carry flag will be set and eax will hold errno
