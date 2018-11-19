	BITS 64

	SECTION .text
	GLOBAL	strlen

strlen:
	PUSH	RBP
	MOV	RBP, RSP
	MOV	RCX, 0

strlen_loop:
	CMP	BYTE[RDI + RCX], 0
	JE	strlen_end
	INC	RCX
	JMP	strlen_loop

strlen_end:
	MOV	RAX, RCX
	MOV	RSP, RBP
	POP	RBP
	RET
