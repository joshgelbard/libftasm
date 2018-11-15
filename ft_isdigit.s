	default	rel
	global	_ft_isdigit

	section	.text
_ft_isdigit:
	xor		eax, eax
	sub		edi, '0' ; x = x - lower
	cmp		edi, 9 ; compare x to (upper - lower)
	setbe	al ; interpret result as if x were (unsigned int)x
	ret

; "The range trick":
; To check whether (x >= lower || x <= upper), we can use the fact that
; negative numbers "look big" when viewed as unsigned. After subtracting
; the lower bound of our comparison (here, 48, or '0') from our upper bound '9'
; and from the value being checked (edi), we have three cases:
;   1) edi was in the range 48..57. In this case, it will now be in range 0..9.
;   2a) edi was greater than 57. In this case, edi will now be 10 or greater.
;   2b) edi was less than 48. In this case, edi will now be negative.
; Using `setbe`, which treats all numbers as unsigned, collapses cases 2a and 2b.
; The sign bit present in 2b will make it look like an enormous positive number --
; greater than any "actually positive" value, and certainly greater than 57.
; (The signed version of the comparison would be `setle`.)

; Therefore we can use only one `cmp` instruction and no `jmp`.
