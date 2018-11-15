		global _ft_isascii
		section .text

_ft_isascii:
		xor eax, eax
		cmp edi, 127
		setbe al
		ret
