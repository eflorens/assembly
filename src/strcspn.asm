	BITS 64

	SECTION	.text
	GLOBAL	strcspn
	
strcspn:
	PUSH	RBP
	MOV	RBP, RSP
	MOV	RCX, 0
	MOV	RDX, 0
	MOV	R8B, 0
	MOV	R9B, 0

strcspn_loop:
	CMP	BYTE[RDI + RCX], 0
	JE	strcspn_end
	MOV	R8B, [RDI + RCX]
	JMP	strcspn_cmp

strcspn_continue:
	MOV	RDX, 0
	INC	RCX
	JMP	strcspn_loop

strcspn_cmp:
	MOV	R9B, [RSI + RDX]
	CMP	R9B, 0
	JE	strcspn_continue
	CMP	R8B, R9B
	JE	strcspn_end
	INC	RDX
	JMP	strcspn_cmp
	
strcspn_end:
	MOV	RAX, RCX
	MOV	RSP, RBP
	POP	RBP
	RET
