	default	rel
	global	_ft_puts

	section	.text
_ft_puts:
	xor		rdx, rdx ; rdx = buf len for write
	cmp		rdi, 0x0 ; special case: puts(NULL) prints "(null)"
	jne		.get_len
	lea		rsi, [rel strnull] ; rsi = buf ptr
	mov		rdx, 6
	jmp		.writestr
.get_len:
	mov		rsi, rdi ; relocate buf ptr for write
	cmp		byte [rsi+rdx], 0
	jz		.writestr
	inc		rdx
	jmp		.get_len
.writestr:
	mov		rax, 0x02000004
	mov		rdi, 1 ; stdout
	syscall
	jc		.fail
.writenl:
	mov		rax, 0x02000004 ; write syscall has clobbered rax
	lea		rsi, [rel newline]
	mov		edi, 1
	mov		rdx, 1
	syscall
	jc		.fail ; syscalls signal fail with carry flag
	ret ; return any nonnegative on success is ok per man page
.fail:
	mov		rax, -1
	ret

	section	.data
newline:	db `\n`
strnull:	db '(null)'

; write syscall info:
; rax: 4 (number of write syscall)
; rdi: file descriptor
; rsi: address of buf
; rdx: length of buf
; on success, carry flag will not be set and rax will hold length of buf
; on error, carry flag will be set and rax will hold errno
