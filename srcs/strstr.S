	BITS 64
	SECTION .text
	global strstr:function

strstr:
	push rbp
	mov rbp, rsp

reset:
	xor rcx, rcx
	jmp loop

start:
	cmp r10b, 0
	je fail
	inc rdi
	jmp reset
loop:
	mov r10b, [rdi + rcx]
	mov r8b, [rsi + rcx]
	cmp r8b, 0
	jz stop
	cmp r10b, r8b
	jne start
	inc rcx
	jmp loop

fail:
	xor rax, rax
	jmp end

stop:
	mov rax, rdi

end:
	mov rsp, rbp
	pop rbp

	ret
