	default	rel
	global	_ft_strcat

	section	.text
_ft_strcat:
	mov		rax, rdi
.find_s1_nul:
	cmp		byte [rdi], 0
	jz 		.cat_s2_s1
	inc		rdi
	jmp		.find_s1_nul
.cat_s2_s1:
	movzx	edx, byte [rsi] ; mov dl would be ok this time, not always
	mov		byte [rdi], dl
	inc		rsi
	inc		rdi
	test	dl, dl ; best compare-to-zero per StackOverflow and gcc
	jnz		.cat_s2_s1
	ret

; char *ret = s1;
; .find_s1_nul --> while (*s1) s1++;
; .cat_s2_s1   --> do { *s1++ = *s2++ } while (*s2);

; Tried tried using rep and string instructions, but it was much slower
; Afterwards, I found a school resource page claiming they're outdated, and
; that in the post-Pentium age you just "do it the long way."
; Something to do with parallel execution.
