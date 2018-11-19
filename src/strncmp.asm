	BITS 64

	SECTION	.text
	GLOBAL	strncmp

strncmp:
	PUSH	RBP
	MOV	RBP, RSP
	MOV	RCX, 0

strncmp_loop:
	CMP	RDX, 0
	JE	strncmp_zsize
	CMP	RCX, RDX
	JE	strncmp_sub
	MOV	R8B, [RDI]
	MOV	R9B, [RSI]
	CMP	R8B, 0
	JE	strncmp_sub
	CMP	R9B, 0
	JE	strncmp_sub
	CMP	R8B, R9B
	JNE	strncmp_sub
	INC	RDI
	INC	RSI
	INC	RCX
	JMP	strncmp_loop

strncmp_sub:
	SUB	R8B, R9B
	MOVSX	RAX, R8B
	JMP	strncmp_end

strncmp_zsize:
	MOV	RAX, 0

strncmp_end:
	MOV	RSP, RBP
	POP	RBP
	RET
