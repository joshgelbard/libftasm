		global _ft_isalpha
		section .text

_ft_isalpha:
		xor eax, eax
		and edi, -33
		sub edi, 65
		cmp edi, 25
		setbe al
		ret

