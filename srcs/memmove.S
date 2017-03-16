	BITS	64
	SECTION	.text
	GLOBAL	memmove:function
	
memmove:
	MOV	RCX, 0
	MOV	RSI, RDX

loop:
	MOV	BYTE [RDX + RCX], R10B
	CMP	RCX, RDX
	JE	end
	MOV	BYTE [RDI + RCX], R10B
	INC	RCX
	JMP	loop

end:
	MOV	RAX, RDI
	RET
