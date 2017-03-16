	BITS	64
	SECTION	.text
	GLOBAL	strchr:function

strchr:
	CMP	BYTE[RDI], SIL
	JE	end
	CMP	BYTE[RDI], 0
	JE	end_null
	INC	RDI
	JMP	strchr

end_null:
	MOV	RAX, 0
	RET

end:
	MOV	RAX, RDI
	RET
