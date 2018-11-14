			global	_ft_bzero
			section	.text
_ft_bzero:	
.loop:
			cmp rsi, 0
			je .done
			mov [rdi], byte 0
			dec rsi
			inc rdi
			jmp .loop
.done:
			ret
