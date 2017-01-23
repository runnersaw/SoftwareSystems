	.file	"cards.c"
	.section	.rodata
.LC0:
	.string	"Enter the card name: "
.LC1:
	.string	"%2s"
.LC2:
	.string	"Failed to read integer.\n"
	.text
	.globl	get_card_name
	.type	get_card_name, @function
get_card_name:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	$.LC0, %edi
	call	puts
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	%eax, -4(%rbp)
	cmpl	$1, -4(%rbp)
	je	.L1
	movl	$.LC2, %edi
	call	puts
.L1:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	get_card_name, .-get_card_name
	.globl	get_val
	.type	get_val, @function
get_val:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	subl	$65, %eax
	cmpl	$23, %eax
	ja	.L4
	movl	%eax, %eax
	movq	.L6(,%rax,8), %rax
	jmp	*%rax
	.section	.rodata
	.align 8
	.align 4
.L6:
	.quad	.L5
	.quad	.L4
	.quad	.L4
	.quad	.L4
	.quad	.L4
	.quad	.L4
	.quad	.L4
	.quad	.L4
	.quad	.L4
	.quad	.L7
	.quad	.L7
	.quad	.L4
	.quad	.L4
	.quad	.L4
	.quad	.L4
	.quad	.L4
	.quad	.L7
	.quad	.L4
	.quad	.L4
	.quad	.L4
	.quad	.L4
	.quad	.L4
	.quad	.L4
	.quad	.L8
	.text
.L7:
	movl	$10, %eax
	jmp	.L9
.L5:
	movl	$11, %eax
	jmp	.L9
.L8:
	movl	$-2, %eax
	jmp	.L9
.L4:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	atoi
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	jle	.L10
	cmpl	$10, -4(%rbp)
	jle	.L11
.L10:
	movl	$-1, %eax
	jmp	.L9
.L11:
	movl	-4(%rbp), %eax
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	get_val, .-get_val
	.globl	increment_count
	.type	increment_count, @function
increment_count:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	cmpl	$2, -8(%rbp)
	jle	.L13
	cmpl	$6, -8(%rbp)
	jg	.L13
	movl	-4(%rbp), %eax
	addl	$1, %eax
	jmp	.L14
.L13:
	movl	-4(%rbp), %eax
	subl	$1, %eax
.L14:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	increment_count, .-increment_count
	.section	.rodata
.LC3:
	.string	"y: %i\n"
	.align 8
.LC4:
	.string	"Couldn't understand that card name!"
.LC5:
	.string	"Current count: %i\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	$5, -12(%rbp)
	movl	-12(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	printf
	movl	$0, -16(%rbp)
.L19:
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	get_card_name
	leaq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	get_val
	movl	%eax, -4(%rbp)
	cmpl	$-1, -4(%rbp)
	jne	.L16
	movl	$.LC4, %edi
	call	puts
	jmp	.L17
.L16:
	cmpl	$-2, -4(%rbp)
	jne	.L18
	jmp	.L17
.L18:
	movl	-4(%rbp), %edx
	movl	-16(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	increment_count
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
.L17:
	movzbl	-32(%rbp), %eax
	cmpb	$88, %al
	jne	.L19
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
