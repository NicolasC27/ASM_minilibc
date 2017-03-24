	BITS	64
	SECTION	.text
	GLOBAL	strncmp:function

strncmp:

	MOV	RCX, 0
	MOV	RAX, 0

loop:

	CMP	RCX, RDX
	JE	end
	MOV	R8B, [RDI]
	MOV	R9B, [RSI]
	CMP	R8B, 0
       	JE	strncmp_not_match
       	CMP	R9B, 0
       	JE	strncmp_not_match
	CMP	R8B, R9B
	JE	strncmp_match
	JMP	strncmp_not_match

strncmp_match:

	INC	RDI
	INC	RSI
	INC	RCX
	JMP	loop

strncmp_not_match:

	SUB	R8B, R9B
	MOVSX	RAX, R8B

end:

	RET
