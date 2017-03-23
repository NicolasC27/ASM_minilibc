	BITS	64
	SECTION	.text
	GLOBAL	memmove:function
	
memmove:
	MOV	RCX, 0

loop:
	MOV	R8B, BYTE [RDX + RCX]
	MOV	R9B, BYTE [RDI + RCX]
	MOV	R10, RDI
	CMP	RCX, RDX
	JE	end
	INC	RCX
	JMP	loop

end_null:
	MOV	RAX, 0
	RET
	
end:
	MOV	RAX, RDI
	RET
