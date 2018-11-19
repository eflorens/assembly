	BITS 64

	SECTION	.text
	GLOBAL	rindex
	
rindex:
	PUSH	RBP
	MOV	RBP, RSP
	MOV	RCX, 0

rindex_loop:
	CMP	BYTE[RDI + RCX], 0
	JE	rindex_loop_back
	INC	RCX
	JMP	rindex_loop

rindex_loop_back:
	CMP	BYTE[RDI + RCX], SIL
	JE	rindex_found
	CMP	RCX, 0
	JE	rindex_nfound
	DEC	RCX
	JMP	rindex_loop_back

rindex_found:
	MOV	RAX, RDI
	ADD	RAX, RCX
	JMP	rindex_end

rindex_nfound:
	MOV	RAX, 0
	JMP	rindex_end

rindex_end:
	MOV	RSP, RBP
	POP	RBP
	RET
