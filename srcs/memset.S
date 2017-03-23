	BITS	64
	SECTION	.text
	GLOBAL	memset:function

memset:
	MOV	RCX, 0

loop:
	CMP	RDX, RCX
	JE	end
	MOV	BYTE [RDI + RCX], SIL
	INC	RCX
	JMP	loop

end_null:
	MOV	RAX, 0
	LEAVE
	RET
	
end:
	MOV	RAX, RDI
	RET
