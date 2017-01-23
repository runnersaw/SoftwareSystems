	.file	"cards.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Enter the card name: "
.LC1:
	.string	"%2s"
.LC2:
	.string	"Failed to read integer.\n"
	.text
	.p2align 4,,15
	.globl	get_card_name
	.type	get_card_name, @function
get_card_name:
.LFB39:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movl	$.LC0, %edi
	call	puts
	xorl	%eax, %eax
	movq	%rbx, %rsi
	movl	$.LC1, %edi
	call	__isoc99_scanf
	cmpl	$1, %eax
	je	.L1
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	movl	$.LC2, %edi
	jmp	puts
	.p2align 4,,10
	.p2align 3
.L1:
	.cfi_restore_state
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE39:
	.size	get_card_name, .-get_card_name
	.p2align 4,,15
	.globl	get_val
	.type	get_val, @function
get_val:
.LFB40:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movzbl	(%rdi), %eax
	subl	$65, %eax
	cmpb	$23, %al
	ja	.L6
	movzbl	%al, %eax
	jmp	*.L8(,%rax,8)
	.section	.rodata
	.align 8
	.align 4
.L8:
	.quad	.L11
	.quad	.L6
	.quad	.L6
	.quad	.L6
	.quad	.L6
	.quad	.L6
	.quad	.L6
	.quad	.L6
	.quad	.L6
	.quad	.L9
	.quad	.L9
	.quad	.L6
	.quad	.L6
	.quad	.L6
	.quad	.L6
	.quad	.L6
	.quad	.L9
	.quad	.L6
	.quad	.L6
	.quad	.L6
	.quad	.L6
	.quad	.L6
	.quad	.L6
	.quad	.L10
	.text
	.p2align 4,,10
	.p2align 3
.L11:
	movl	$11, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	.cfi_restore_state
	movl	$-2, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	.cfi_restore_state
	movl	$10, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	.cfi_restore_state
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol
	leal	-1(%rax), %ecx
	movq	%rax, %rdx
	movl	$-1, %eax
	cmpl	$10, %ecx
	cmovb	%edx, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE40:
	.size	get_val, .-get_val
	.p2align 4,,15
	.globl	increment_count
	.type	increment_count, @function
increment_count:
.LFB41:
	.cfi_startproc
	subl	$3, %esi
	leal	1(%rdi), %eax
	subl	$1, %edi
	cmpl	$3, %esi
	cmova	%edi, %eax
	ret
	.cfi_endproc
.LFE41:
	.size	increment_count, .-increment_count
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"Couldn't understand that card name!"
	.section	.rodata.str1.1
.LC4:
	.string	"Current count: %i\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB42:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%ebx, %ebx
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L17:
	cmpl	$-2, %eax
	je	.L18
	leal	1(%rbx), %edx
	subl	$3, %eax
	subl	$1, %ebx
	cmpl	$3, %eax
	movl	$.LC4, %esi
	movl	$1, %edi
	cmovbe	%edx, %ebx
	xorl	%eax, %eax
	movl	%ebx, %edx
	call	__printf_chk
.L18:
	cmpb	$88, (%rsp)
	je	.L27
.L22:
	movq	%rsp, %rdi
	call	get_card_name
	movq	%rsp, %rdi
	call	get_val
	cmpl	$-1, %eax
	jne	.L17
	movl	$.LC3, %edi
	call	puts
	cmpb	$88, (%rsp)
	jne	.L22
	.p2align 4,,10
	.p2align 3
.L27:
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE42:
	.size	main, .-main
	.globl	x
	.data
	.align 4
	.type	x, @object
	.size	x, 4
x:
	.long	5
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
