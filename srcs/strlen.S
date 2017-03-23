	BITS 	64
	SECTION	.text
	GLOBAL	strlen:function

strlen:
	MOV	RCX, 0

loop:
	CMP	BYTE [RDI], 0
	JE	end_null
	CMP	BYTE [RDI + RCX], 0
	JE	end
	INC	RCX
	JMP	loop

end_null:
	MOV	RAX, 0
	RET
	
end:
	MOV	RAX, RCX
	RET
