	BITS 	64
	SECTION	.text
	GLOBAL	strlen:function

strlen:
	PUSH	RBP
	MOV	RBP, RSP
	MOV	RCX, 0

loop:
	CMP	BYTE [RDI + RCX], 0
	JE	end
	INC	RCX
	JMP	loop

end:
	MOV	RAX, RCX
	LEAVE
	RET
