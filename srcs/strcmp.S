	BITS	64
	SECTION	.text
	GLOBAL	strcmp:function

strcmp:
	MOV	RCX, 0

loop:
	MOV	R8B, [RDI + RCX]
	MOV	R9B, [RSI + RCX]
	CMP	R8B, R9B
	JNE	end
	CMP	R9B, 0
	JE	end_null
	INC	RCX
	JMP	loop

end_null:
	MOV	RAX, 0
	RET

end:
	SUB	R8B, R9B
	MOVSX	RAX, R8B
	RET
