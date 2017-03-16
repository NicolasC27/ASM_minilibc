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
	CMP	BYTE [RDI], 0
	JE	end_null
	MOV	BYTE [RDI + RCX], SIL
	INC	RCX
	JMP	loop

end_null:
	MOV	RAX, 0
	LEAVE
	RET
	
end:
	MOV	RAX, RDI
	LEAVE
	RET
