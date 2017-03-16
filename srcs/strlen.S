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
	CMP	BYTE [RDI], 0
	JE	end_null
	INC	RCX
	JMP	loop

end_null:
	MOV	RAX, 0
	LEAVE
	RET
	
end:
	MOV	RAX, RCX
	LEAVE
	RET
