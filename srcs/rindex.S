	BITS 64
	global rindex:function
	section .text

rindex:
	MOV rax, 0

loop:
	CMP 	BYTE[RDI], SIL
	JE 	loop_found
	CMP 	BYTE[RDI], 0
	JE 	end
	INC 	RDI
	JMP 	loop

loop_found:
	MOV 	RAX, RDI
	CMP 	BYTE[RDI], 0
	JE 	end
	INC 	RDI
	JMP 	loop

end:
	RET
	
