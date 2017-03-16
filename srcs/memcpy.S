	BITS	64
	SECTION	.text
	GLOBAL	memcpy:function

memcpy:
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
	RET
	
end:
	MOV	RAX, RDI
	RET
