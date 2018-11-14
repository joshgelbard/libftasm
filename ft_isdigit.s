		global _ft_isdigit
		section .text

_ft_isdigit:
		xor eax, eax
		sub edi, 48
		cmp edi, 9
		setbe al
		ret


