	default	rel
	global	_ft_cat

	section	.text
_ft_cat:
	lea		rsi, [rel buf]

; read syscall: edi=fd, esi=buf addr, edx=nbyte
.read:
	mov		edx, 4096
	mov		eax, 0x02000003
	syscall
	jc		.done
	cmp		eax, 0
	jz		.done

; write syscall: edi=1, rsi=buf, rdx=nbyte (in rax after read call)
.write:
	mov		r9d, edi
	mov		edi, 1
	mov		rdx, rax
	mov		eax, 0x02000004
	syscall
	jc		.done
	mov		edi, r9d
	jmp		.read

.done:
	ret

	section .bss
buf:	resb	4096
