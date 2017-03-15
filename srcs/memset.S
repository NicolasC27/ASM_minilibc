	BITS	64
	SECTION	.text
	GLOBAL	memset:function

memset:
	PUSH	RBP
	MOV	RBP, RSP
	MOV	RCX, 0

loop:
	CMP	RDX, RCX
	JE	end
	MOV	BYTE [RDI + RCX], SIL
	INC	RCX
	JMP	loop

end:
	MOV	RAX, RDI
	LEAVE
	RET
