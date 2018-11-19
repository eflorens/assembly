	BITS 64	

	SECTION .text
	GLOBAL	strcasecmp

strcasecmp:
	XOR	RCX, RCX
	JMP	strcasecmp_loop_s1

uppercase_r8b:
	SUB	R8B, 32
	JMP	strcasecmp_loop_s2

uppercase_r9b:
	SUB	R9B, 32
	JMP	strcasecmp_check
	
strcasecmp_loop_s1:
	MOV	R8B, [RDI + RCX]
	MOV	R9B, [RSI + RCX]
	CMP	R8B, 97
	JL	strcasecmp_loop_s2
	CMP	R8B, 122
	JLE	uppercase_r8b

strcasecmp_loop_s2:
	CMP	R9B, 97
	JL	strcasecmp_check
	CMP	R9B, 122
	JLE	uppercase_r9b

strcasecmp_check:
	CMP	R8B, R9B
	JNE	strcasecmp_return
	CMP	R8B, 0
	JE	strcasecmp_return
	CMP	R9B, 0
	JE	strcasecmp_return
	INC	RCX
	JMP	strcasecmp_loop_s1

strcasecmp_return:
	SUB	R8B, R9B
	MOVSX	RAX, R8B
	RET
