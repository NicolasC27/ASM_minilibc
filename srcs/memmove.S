	BITS	64
	SECTION	.text
	GLOBAL	memmove:function
	
memmove:
	PUSH	RBP
	MOV	RBP, RSP
	MOV	RCX, 0

loop:
	

end:
	MOV	RAX, RCX
	LEAVE
	RET
