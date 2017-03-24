	BITS	64
	SECTION	.text
	GLOBAL	memcpy:function

memcpy:
	MOV	RCX, 0

loop:	
	CMP	RCX, RDX
	JE	end
	MOV	R10B, BYTE [RSI + RCX]
	MOV	BYTE [RDI + RCX], R10B
	INC	RCX
	JMP	loop

end:
	MOV	RAX, RDI
	RET
