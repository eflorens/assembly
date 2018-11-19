	BITS 64

	SECTION	.text
	GLOBAL	strpbrk
	
strpbrk:
	PUSH	RBP
	MOV	RBP, RSP
	MOV	RCX, 0
	MOV	RDX, 0
	MOV	R8B, 0
	MOV	R9B, 0

strpbrk_loop:
	CMP	BYTE[RDI + RCX], 0
	JE	strpbrk_notfound
	MOV	R8B, [RDI + RCX]
	JMP	strpbrk_cmp

strpbrk_continue:
	MOV	RDX, 0
	INC	RCX
	JMP	strpbrk_loop

strpbrk_cmp:
	MOV	R9B, [RSI + RDX]
	CMP	R9B, 0
	JE	strpbrk_continue
	CMP	R8B, R9B
	JE	strpbrk_found
	INC	RDX
	JMP	strpbrk_cmp

strpbrk_found:
	MOV	RAX, RDI
	ADD	RAX, RCX
	JMP	strpbrk_end
	
strpbrk_notfound:
	MOV	RAX, 0
	
strpbrk_end:
	MOV	RSP, RBP
	POP	RBP
	RET
