	BITS	64
	SECTION	.text
	GLOBAL	strchr:function

strchr:
	PUSH	RBP
	MOV	RBP, RSP

loop:
	CMP	BYTE[RDI], SIL
	JE	end
	CMP	BYTE[RDI], 0
	JE	end_null
	INC	RDI
	JMP	loop

end_null:
	MOV	RAX, 0
	LEAVE
	RET

end:
	MOV	RAX, RDI
	LEAVE
	RET
