	global _ft_toupper
	section .text

; my first try:
; store orig in eax; store islower(edi) in edx
; then subtract either 0 or 32 from eax to get the result;
;    * set edx <- ~(islower(edi) << 5) ; edx is now -1 or -33
;    * set eax <- eax & edx ; flip the 32's bit only if edi was in range 97..122
; _ft_toupper:
; 	mov eax, edi
; 	xor edx, edx
; 	sub edi, 97
; 	cmp edi, 25
; 	setbe dl
; 	shl edx, 5
; 	not edx
; 	and eax, edx
; 	ret

; gcc's shorter version:
; store orig in eax; store rdi-32 in edx; set eax <- islower(edi) ? edx : eax
_ft_toupper:
	mov     eax, edi
	lea     edx, [edi-32]
	lea     ecx, [edi-97]
	cmp     ecx, 26
	cmovb   eax, edx
	ret
