	BITS	64
	SECTION	.text
	GLOBAL	memcpy:function

memcpy:
	PUSH	RBP
	MOV	RBP, RSP
	MOV	RAX, RDI
	MOV	RCX, RSI

loop:
	CMP	RCX, 0
	JE	end
	DEC	RCX
	JMP	loop

end:
	MOV	RAX, RDI
	LEAVE
	RET
