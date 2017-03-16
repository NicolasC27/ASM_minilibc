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
	CMP	BYTE [RDI], 0
	JE	end_null
	MOV	BYTE [RDI + RCX], R10B
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
