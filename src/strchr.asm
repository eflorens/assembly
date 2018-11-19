	BITS 64

	SECTION	.text
	GLOBAL	strchr

strchr:
	PUSH	RBP
	MOV	RBP, RSP
	MOV	RCX, 0
	
strchr_loop:
	CMP	BYTE [RDI + RCX], SIL
	JE	strchr_found
	CMP	BYTE [RDI + RCX], 0
	JE	strchr_nfound
	INC	RCX
	JMP	strchr_loop

strchr_nfound:
	MOV	RAX, 0
	JMP	strchr_end

strchr_found:
	MOV	RAX, RDI
	ADD	RAX, RCX
	JMP	strchr_end
	
strchr_end:
	MOV	RSP, RBP
	POP	RBP
	RET
