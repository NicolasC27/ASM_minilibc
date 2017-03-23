	BITS 64
	global rindex:function
	section .text

rindex:
	xor rcx, rcx

loop:
	cmp BYTE [rdi + rcx], 0
	jz not_found
	cmp BYTE [rdi + rcx], sil
	jz found
	inc rcx
	jmp loop

not_found:
	mov rax, 0
	jmp end

found:
	mov rax, rdi
	add rax, rcx

end:
	ret