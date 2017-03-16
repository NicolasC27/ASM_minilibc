	BITS	64
	SECTION	.text
	GLOBAL	strcmp:function

strcmp:
	PUSH	RBP
	MOV	RBP, RSP
	MOV	RCX, 0

loop:
	CMP	BYTE[RDI + RCX], 0
	JE	end
	INC	RCX
	JMP	loop

end:
	MOV	RAX, RDI
	LEAVE
	RET
