	BITS 64

	SECTION	.text
	GLOBAL	memset

memset:
	PUSH	RBP
	MOV	RBP, RSP
	MOV	RCX, 0

memset_loop:
	CMP	RCX, RDX
	JE	memset_end
	MOV	[RDI + RCX], SIL
	INC	RCX
	JMP	memset_loop

memset_end:
	MOV	RAX, RDI
	MOV	RSP, RBP
	POP	RBP
	RET
