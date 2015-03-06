	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 14, 1
	.globl	_main
	.align	4, 0x90
_main:
	.cfi_startproc
	pushq	%rbp
Ltmp0:
	.cfi_def_cfa_offset 16
Ltmp1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp2:
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$40, %rsp
Ltmp3:
	.cfi_offset %rbx, -56
Ltmp4:
	.cfi_offset %r12, -48
Ltmp5:
	.cfi_offset %r13, -40
Ltmp6:
	.cfi_offset %r14, -32
Ltmp7:
	.cfi_offset %r15, -24
	movq	%rsi, %r14
	movl	%edi, %ebx
	movq	_globalinit_33_1BDF70FFC18749BAB495A73B459ED2F0_token4@GOTPCREL(%rip), %rdi
	movq	_globalinit_33_1BDF70FFC18749BAB495A73B459ED2F0_func4@GOTPCREL(%rip), %rsi
	xorl	%edx, %edx
	callq	_swift_once
	movq	__TZvOSs7Process5_argcVSs5Int32@GOTPCREL(%rip), %rax
	movl	%ebx, (%rax)
	movq	_globalinit_33_1BDF70FFC18749BAB495A73B459ED2F0_token5@GOTPCREL(%rip), %rdi
	movq	_globalinit_33_1BDF70FFC18749BAB495A73B459ED2F0_func5@GOTPCREL(%rip), %rsi
	xorl	%edx, %edx
	callq	_swift_once
	movq	__TZvOSs7Process11_unsafeArgvGVSs20UnsafeMutablePointerGS0_VSs4Int8__@GOTPCREL(%rip), %rax
	movq	%r14, (%rax)
	movl	$40, %edi
	callq	__TTSf4s___TF4main3fibFSiSi
	movq	%rax, %rbx
	movl	$39, %edi
	callq	__TTSf4s___TF4main3fibFSiSi
	movq	%rax, %r14
	movq	%r14, -64(%rbp)
	movl	$38, %edi
	callq	__TTSf4s___TF4main3fibFSiSi
	movq	%rax, %r15
	movl	$37, %edi
	callq	__TTSf4s___TF4main3fibFSiSi
	movq	%rax, %r12
	leaq	(%r12,%r15), %r13
	leaq	(%r15,%r14), %r15
	movl	$36, %edi
	callq	__TTSf4s___TF4main3fibFSiSi
	movq	%rax, %r14
	addq	%r14, %r12
	leaq	(%r12,%r13), %rax
	movq	%rax, -72(%rbp)
	leaq	(%r13,%r15), %r13
	leaq	(%rax,%r13), %rcx
	movq	%rcx, -56(%rbp)
	movl	$35, %edi
	callq	__TTSf4s___TF4main3fibFSiSi
	addq	-64(%rbp), %rbx
	addq	%r15, %rbx
	addq	%r14, %rbx
	addq	%r13, %rbx
	addq	%rax, %rbx
	addq	%r12, %rbx
	addq	-72(%rbp), %rbx
	movq	-56(%rbp), %rax
	leaq	(%rbx,%rax,2), %rax
	movq	%rax, -48(%rbp)
	movq	__TMdSi@GOTPCREL(%rip), %rsi
	addq	$8, %rsi
	leaq	-48(%rbp), %rdi
	callq	__TFSs7printlnU__FQ_T_
	xorl	%eax, %eax
	addq	$40, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc

	.private_extern	__TF4main3fibFSiSi
	.globl	__TF4main3fibFSiSi
	.align	4, 0x90
__TF4main3fibFSiSi:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rdi, %rbx
	movl	$1, %eax
	cmpq	$1, %rbx
	jle	LBB1_2
	leaq	-1(%rbx), %rdi
	callq	__TTSf4s___TF4main3fibFSiSi
	movq	%rax, %r14
	addq	$-2, %rbx
	movq	%rbx, %rdi
	callq	__TTSf4s___TF4main3fibFSiSi
	addq	%r14, %rax
LBB1_2:
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq

	.private_extern	__TTSf4s___TF4main3fibFSiSi
	.globl	__TTSf4s___TF4main3fibFSiSi
	.align	4, 0x90
__TTSf4s___TF4main3fibFSiSi:
	pushq	%rbp
	movq	%rsp, %rbp
	pushq	%r14
	pushq	%rbx
	movq	%rdi, %rbx
	movl	$1, %r14d
	cmpq	$2, %rbx
	jl	LBB4_2
	.align	4, 0x90
LBB4_1:
	leaq	-1(%rbx), %rdi
	callq	__TTSf4s___TF4main3fibFSiSi
	addq	$-2, %rbx
	addq	%rax, %r14
	cmpq	$1, %rbx
	jg	LBB4_1
LBB4_2:
	movq	%r14, %rax
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq

	.linker_option "-lswiftCore"
	.section	__DATA,__objc_imageinfo,regular,no_dead_strip
L_OBJC_IMAGE_INFO:
	.long	0
	.long	512


.subsections_via_symbols
