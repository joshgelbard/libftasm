		global _ft_strcat
		default rel
		section .text

_ft_strcat:
		mov rax, rdi
	.find_s1_nul:
		cmp byte [rdi], 0
		jz .cat_s2_s1
		lea rdi, [rdi + 1]
		jmp .find_s1_nul
	.cat_s2_s1:
		cmp byte [rsi], 0
		mov r9b, byte [rsi]
		lea rsi, [rsi + 1]
		mov byte [rdi], r9b
		lea rdi, [rdi + 1]
		jnz .cat_s2_s1
		ret
