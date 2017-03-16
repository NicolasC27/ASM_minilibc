	BITS	64
	SECTION	.text
	GLOBAL	memcpy:function

memcpy:
	PUSH	RBP
	MOV	RBP, RSP
	MOV	RCX, 0

loop:
	MOV	R10B, BYTE [RSI + RCX]
	CMP	RCX, RDX
	JE	end
	MOV	BYTE [RDI + RCX], R10B
	INC	RCX
	JMP	loop

end:
	MOV	RAX, RDI
	LEAVE
	RET
