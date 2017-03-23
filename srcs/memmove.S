	BITS	64
	SECTION	.text
	GLOBAL	memmove:function
	
memmove:
	MOV	RCX, 0

loop_inc:
	CMP	RCX, RDX
	JE	loop_dec
	MOV	R8B, BYTE [RSI + RCX]
	PUSH	R8
	INC	RCX
	JMP	loop_inc

loop_dec:
	CMP	RCX, 0
	JE	end
	POP	R8
	MOV	BYTE [RDI + RCX - 1], R8B
	DEC	RCX
	JMP	loop_dec

end:
	MOV	RAX, RDI
	RET
