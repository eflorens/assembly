	bits 64	

	section .text
	global	strcasecmp

strcasecmp:
	xor	rcx, rcx
	jmp	strcasecmp_loop_s1

uppercase_r8b:
	sub	r8b, 32
	jmp	strcasecmp_loop_s2

uppercase_r9b:
	sub	r9b, 32
	jmp	strcasecmp_check
	
strcasecmp_loop_s1:
	mov	r8b, [rdi + rcx]
	mov	r9b, [rsi + rcx]
	cmp	r8b, 97
	jl	strcasecmp_loop_s2
	cmp	r8b, 122
	jle	uppercase_r8b

strcasecmp_loop_s2:
	cmp	r9b, 97
	jl	strcasecmp_check
	cmp	r9b, 122
	jle	uppercase_r9b

strcasecmp_check:
	cmp	r8b, r9b
	jne	strcasecmp_return
	cmp	r8b, 0
	je	strcasecmp_return
	cmp	r9b, 0
	je	strcasecmp_return
	inc	rcx
	jmp	strcasecmp_loop_s1

strcasecmp_return:
	sub	r8b, r9b
	movsx	rax, r8b
	ret
