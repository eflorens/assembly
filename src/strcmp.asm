
	BITS 64

	SECTION	.text
	GLOBAL	strcmp

strcmp:
	PUSH	RBP
	MOV	RBP, RSP
	
strcmp_loop:
	MOV	R8B, [RDI]
	MOV	R9B, [RSI]
	CMP	R8B, 0
	JE	strcmp_end
	CMP	R9B, 0
	JE	strcmp_end
	CMP	R8B, R9B
	JNE	strcmp_end
	INC	RDI
	INC	RSI
	JMP	strcmp_loop

strcmp_end:
	SUB	R8B, R9B
	MOVSX	RAX, R8B
	MOV	RSP, RBP
	POP	RBP
	RET
	
