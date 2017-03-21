	BITS 64
	global strpbrk:function
	section .text
		
strpbrk:	
	xor rax, rax
	
start_loop:
	cmp byte[rdi], 0
	je end
	xor rcx, rcx

loop:
	mov r8b, [rsi + rcx]
	cmp r8b, 0
	je loop_end
	cmp byte[rdi], r8b
	je found	
	inc rcx
	jmp loop

loop_end:
	inc rdi
	jmp start_loop

found:
	mov rax, rdi

end:
	ret
