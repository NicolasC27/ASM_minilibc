	BITS	64
	SECTION	.text
	GLOBAL	memmove:function
	
memmove:
	MOV	RCX, 0

loop:	
	CMP	RCX, RDX
	JE	end
	MOV	R8B, BYTE [RSI + RCX]
	MOV	BYTE [RDI + RCX], R8B
	INC	RCX
	JMP	loop

end:
	MOV	RAX, RDI
	RET
