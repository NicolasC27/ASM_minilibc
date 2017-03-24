	BITS	64
	SECTION	.text
	GLOBAL	strcasecmp:function

strcasecmp:
	MOV	RCX, 0

loop:
	MOV	R8B, [RDI + RCX]
	MOV	R9B, [RSI + RCX]
	CMP	R8B, 0
	JE	end_null
	CMP	R9B, 0
	JE	end_null
	
	CMP	R8B, 65
	JL	inc
	CMP	R8B, 91
	JL	lower
	
	CMP	R9B, 65
	JL	inc
	CMP	R9B, 91
	JL	lower

	CMP	R8B, R9B
	JNE	end
	INC	RCX
	JMP	loop

inc:
	INC	RCX
	JMP	loop

lower:
	ADD	R8B, 32
	INC	RCX
	JMP	loop

end_null:
	MOV	RAX, 0
	RET

end:
	SUB	R8B, R9B
	MOVSX	RAX, R8B
	RET
