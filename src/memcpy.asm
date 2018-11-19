	BITS 64

	SECTION	.text
	GLOBAL	memcpy

memcpy:
	PUSH	RBP
	MOV	RBP, RSP
	MOV	RCX, 0

memcpy_loop:
	CMP	RCX, RDX
	JE	memcpy_end
	MOV	R8B, [RSI + RCX]
	CMP	R8B, 0
	JE	memcpy_end
	MOV	[RDI + RCX], R8B
	INC	RCX
	JMP	memcpy_loop

memcpy_end:
	MOV	RAX, RDI
	MOV	RSP, RBP
	POP	RBP
	RET
	
