		global _ft_isalnum
		section .text

_ft_isalnum:
		xor eax, eax
		sub edi, 48
		cmp edi, 9
		setbe al
		add edi, 48
		and edi, -33
		sub edi, 65
		cmp edi, 25
		setbe cl
		or al, cl
		ret
