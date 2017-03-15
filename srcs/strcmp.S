	BITS	64
	SECTION	.text
	GLOBAL	strcmp:function

strcmp:
	PUSH	RBP
	MOV	RBP, RSP
	MOV	RDX, 0

loop:
	CMP	BYTE[RDI + RDX], 0
	JE	end
	INC	RDX
	JMP	loop

end:
	MOV	RAX, RDI - RSI
	LEAVE
	RET
