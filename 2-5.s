	.file	1 "2-5.c"

 # -G value = 0, Arch = r2000, ISA = 1
 # GNU C version 2.96 20000731 (Red Hat Linux 7.3 2.96-113.2) (mipsel-linux) compiled by GNU C version 2.96 20000731 (Red Hat Linux 7.3 2.96-113.2).
 # options passed:  -mno-abicalls -mrnames -mmips-as
 # -mno-check-zero-division -march=r2000 -O0 -fleading-underscore
 # -finhibit-size-directive -fverbose-asm
 # options enabled:  -fpeephole -ffunction-cse -fkeep-static-consts
 # -fpcc-struct-return -fsched-interblock -fsched-spec -fbranch-count-reg
 # -fnew-exceptions -fcommon -finhibit-size-directive -fverbose-asm
 # -fgnu-linker -fargument-alias -fleading-underscore -fident -fmath-errno
 # -mrnames -mno-check-zero-division -march=r2000


	.rdata
	.align	2
$LC0:
	.asciiz	"%s"
	.align	2
$LC1:
	.asciiz	"aa"
	.text
	.align	2
main:
	subu	$sp,$sp,24
	sw	$ra,20($sp)
	sw	$fp,16($sp)
	move	$fp,$sp
	la	$a0,$LC0
	la	$a1,$LC1
	jal	_myprintf
	li	$v0,1			# 0x1
	move	$sp,$fp
	lw	$ra,20($sp)
	lw	$fp,16($sp)
	addu	$sp,$sp,24
	j	$ra
	.align	2
_max:
	subu	$sp,$sp,8
	sw	$fp,0($sp)
	move	$fp,$sp
	sw	$a0,8($fp)
	sw	$a1,12($fp)
	lw	$v0,8($fp)
	lw	$v1,12($fp)
	slt	$v0,$v1,$v0
	beq	$v0,$zero,$L4
	lw	$v0,8($fp)
	j	$L3
$L4:
	lw	$v0,12($fp)
$L3:
	move	$sp,$fp
	lw	$fp,0($sp)
	addu	$sp,$sp,8
	j	$ra
	.align	2
_min:
	subu	$sp,$sp,8
	sw	$fp,0($sp)
	move	$fp,$sp
	sw	$a0,8($fp)
	sw	$a1,12($fp)
	lw	$v0,8($fp)
	lw	$v1,12($fp)
	slt	$v0,$v0,$v1
	beq	$v0,$zero,$L7
	lw	$v0,8($fp)
	j	$L6
$L7:
	lw	$v0,12($fp)
$L6:
	move	$sp,$fp
	lw	$fp,0($sp)
	addu	$sp,$sp,8
	j	$ra
	.align	2
_get_digit:
	subu	$sp,$sp,16
	sw	$fp,8($sp)
	move	$fp,$sp
	sw	$a0,16($fp)
	sw	$zero,0($fp)
	lw	$v0,16($fp)
	bne	$v0,$zero,$L10
	move	$v0,$zero
	j	$L9
$L10:
$L12:
	lw	$v0,16($fp)
	bne	$v0,$zero,$L14
	j	$L13
$L14:
	lw	$a0,16($fp)
	li	$v0,1717960704			# 0x66660000
	ori	$v0,$v0,0x6667
	mult	$a0,$v0
	mfhi	$v0
	sra	$v1,$v0,2
	sra	$v0,$a0,31
	subu	$v0,$v1,$v0
	sw	$v0,16($fp)
	lw	$v0,0($fp)
	addu	$v0,$v0,1
	sw	$v0,0($fp)
	j	$L12
$L13:
	lw	$v0,0($fp)
$L9:
	move	$sp,$fp
	lw	$fp,8($sp)
	addu	$sp,$sp,16
	j	$ra
	.align	2
_get_range:
	subu	$sp,$sp,16
	sw	$fp,8($sp)
	move	$fp,$sp
	sw	$a0,16($fp)
	sw	$zero,0($fp)
$L16:
	lw	$v0,16($fp)
	lb	$v0,0($v0)
	slt	$v0,$v0,48
	bne	$v0,$zero,$L17
	lw	$v0,16($fp)
	lb	$v0,0($v0)
	slt	$v0,$v0,58
	bne	$v0,$zero,$L18
	j	$L17
$L18:
	lw	$v1,0($fp)
	move	$v0,$v1
	sll	$v0,$v0,2
	addu	$v0,$v0,$v1
	sll	$v1,$v0,1
	lw	$v0,16($fp)
	lb	$v0,0($v0)
	addu	$v0,$v1,$v0
	addu	$v0,$v0,-48
	sw	$v0,0($fp)
	lw	$v0,16($fp)
	addu	$v0,$v0,1
	sw	$v0,16($fp)
	j	$L16
$L17:
	lw	$v0,0($fp)
	move	$sp,$fp
	lw	$fp,8($sp)
	addu	$sp,$sp,16
	j	$ra
	.align	2
_get_char_for_fill:
	subu	$sp,$sp,8
	sw	$fp,0($sp)
	move	$fp,$sp
	sw	$a0,8($fp)
	lw	$v0,8($fp)
	beq	$v0,$zero,$L21
	li	$v0,48			# 0x30
	j	$L20
$L21:
	li	$v0,32			# 0x20
$L20:
	move	$sp,$fp
	lw	$fp,0($sp)
	addu	$sp,$sp,8
	j	$ra
	.align	2
_print_plus:
	subu	$sp,$sp,24
	sw	$ra,20($sp)
	sw	$fp,16($sp)
	move	$fp,$sp
	sw	$a0,24($fp)
	lw	$v0,24($fp)
	beq	$v0,$zero,$L24
	li	$a0,43			# 0x2b
	jal	_print_char
$L24:
	move	$sp,$fp
	lw	$ra,20($sp)
	lw	$fp,16($sp)
	addu	$sp,$sp,24
	j	$ra
	.align	2
_print_fill:
	subu	$sp,$sp,32
	sw	$ra,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	sw	$a0,32($fp)
	sw	$a1,36($fp)
	sw	$zero,16($fp)
$L26:
	lw	$v0,16($fp)
	lw	$v1,32($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L29
	j	$L27
$L29:
	lw	$a0,36($fp)
	jal	_get_char_for_fill
	move	$a0,$v0
	jal	_print_char
	lw	$v0,16($fp)
	addu	$v0,$v0,1
	sw	$v0,16($fp)
	j	$L26
$L27:
	move	$sp,$fp
	lw	$ra,28($sp)
	lw	$fp,24($sp)
	addu	$sp,$sp,32
	j	$ra
	.align	2
_print_limited_string:
	subu	$sp,$sp,32
	sw	$ra,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	sw	$a0,32($fp)
	sw	$a1,36($fp)
	sw	$zero,16($fp)
$L31:
	lw	$v0,16($fp)
	lw	$v1,32($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L34
	j	$L32
$L34:
	lw	$v0,36($fp)
	lb	$v0,0($v0)
	bne	$v0,$zero,$L35
	j	$L32
$L35:
	lw	$v0,36($fp)
	lb	$v0,0($v0)
	move	$a0,$v0
	jal	_print_char
	lw	$v0,16($fp)
	addu	$v0,$v0,1
	sw	$v0,16($fp)
	j	$L31
$L32:
	move	$sp,$fp
	lw	$ra,28($sp)
	lw	$fp,24($sp)
	addu	$sp,$sp,32
	j	$ra
	.align	2
_print_base:
	subu	$sp,$sp,32
	sw	$ra,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	sw	$a0,32($fp)
	sw	$a1,36($fp)
	lw	$v1,32($fp)
	lw	$v0,36($fp)
	div	$0,$v1,$v0
	mfhi	$v0
	sw	$v0,16($fp)
	lw	$v1,32($fp)
	lw	$v0,36($fp)
	div	$0,$v1,$v0
	mflo	$v0
	sw	$v0,20($fp)
	lw	$v0,20($fp)
	beq	$v0,$zero,$L37
	lw	$a0,20($fp)
	lw	$a1,36($fp)
	jal	_print_base
$L37:
	lw	$v0,16($fp)
	slt	$v0,$v0,10
	bne	$v0,$zero,$L38
	lw	$v0,16($fp)
	addu	$v0,$v0,87
	move	$a0,$v0
	jal	_print_char
	j	$L36
$L38:
	lw	$a0,16($fp)
	jal	_print_int
$L36:
	move	$sp,$fp
	lw	$ra,28($sp)
	lw	$fp,24($sp)
	addu	$sp,$sp,32
	j	$ra
	.align	2
_myprintf:
	sw	$a0,0($sp)
	sw	$a1,4($sp)
	sw	$a2,8($sp)
	sw	$a3,12($sp)
	subu	$sp,$sp,56
	sw	$ra,52($sp)
	sw	$fp,48($sp)
	move	$fp,$sp
	sw	$a0,56($fp)
	sw	$zero,16($fp)
	sw	$zero,20($fp)
	sw	$zero,24($fp)
	sw	$zero,28($fp)
	sw	$zero,32($fp)
	addu	$v0,$fp,60
	sw	$v0,36($fp)
$L41:
	lw	$v0,56($fp)
	lb	$v0,0($v0)
	bne	$v0,$zero,$L43
	j	$L42
$L43:
	lw	$v0,56($fp)
	lb	$v1,0($v0)
	li	$v0,37			# 0x25
	bne	$v1,$v0,$L44
	lw	$v0,56($fp)
	addu	$v0,$v0,1
	sw	$v0,56($fp)
	sw	$zero,16($fp)
	sw	$zero,20($fp)
	sw	$zero,24($fp)
	sw	$zero,28($fp)
	sw	$zero,32($fp)
$L45:
	lw	$v0,56($fp)
	lb	$v1,0($v0)
	li	$v0,48			# 0x30
	beq	$v1,$v0,$L47
	lw	$v0,56($fp)
	lb	$v1,0($v0)
	li	$v0,45			# 0x2d
	beq	$v1,$v0,$L47
	lw	$v0,56($fp)
	lb	$v1,0($v0)
	li	$v0,43			# 0x2b
	beq	$v1,$v0,$L47
	j	$L46
$L47:
	lw	$v0,56($fp)
	lb	$v0,0($v0)
	sw	$v0,40($fp)
	li	$v0,45			# 0x2d
	lw	$v1,40($fp)
	beq	$v1,$v0,$L50
	lw	$v1,40($fp)
	slt	$v0,$v1,46
	beq	$v0,$zero,$L54
	li	$v0,43			# 0x2b
	lw	$v1,40($fp)
	beq	$v1,$v0,$L51
	j	$L48
$L54:
	li	$v0,48			# 0x30
	lw	$v1,40($fp)
	beq	$v1,$v0,$L49
	j	$L48
$L49:
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
	j	$L48
$L50:
	li	$v0,1			# 0x1
	sw	$v0,28($fp)
	j	$L48
$L51:
	li	$v0,1			# 0x1
	sw	$v0,32($fp)
$L48:
	lw	$v0,56($fp)
	addu	$v0,$v0,1
	sw	$v0,56($fp)
	j	$L45
$L46:
	lw	$a0,56($fp)
	jal	_get_range
	sw	$v0,16($fp)
	lw	$a0,16($fp)
	jal	_get_digit
	move	$v1,$v0
	lw	$v0,56($fp)
	addu	$v0,$v0,$v1
	sw	$v0,56($fp)
	lw	$v0,56($fp)
	lb	$v1,0($v0)
	li	$v0,46			# 0x2e
	bne	$v1,$v0,$L55
	lw	$v0,56($fp)
	addu	$v0,$v0,1
	sw	$v0,56($fp)
	move	$a0,$v0
	jal	_get_range
	sw	$v0,20($fp)
	lw	$a0,20($fp)
	jal	_get_digit
	move	$v1,$v0
	lw	$v0,56($fp)
	addu	$v0,$v0,$v1
	sw	$v0,56($fp)
$L55:
	lw	$v0,56($fp)
	lb	$v0,0($v0)
	sw	$v0,44($fp)
	li	$v0,111			# 0x6f
	lw	$v1,44($fp)
	beq	$v1,$v0,$L68
	lw	$v1,44($fp)
	slt	$v0,$v1,112
	beq	$v0,$zero,$L75
	li	$v0,99			# 0x63
	lw	$v1,44($fp)
	beq	$v1,$v0,$L57
	lw	$v1,44($fp)
	slt	$v0,$v1,100
	beq	$v0,$zero,$L76
	li	$v0,37			# 0x25
	lw	$v1,44($fp)
	beq	$v1,$v0,$L72
	j	$L78
$L76:
	li	$v0,100			# 0x64
	lw	$v1,44($fp)
	beq	$v1,$v0,$L62
	j	$L78
$L75:
	li	$v0,116			# 0x74
	lw	$v1,44($fp)
	beq	$v1,$v0,$L65
	lw	$v1,44($fp)
	slt	$v0,$v1,117
	beq	$v0,$zero,$L77
	li	$v0,115			# 0x73
	lw	$v1,44($fp)
	beq	$v1,$v0,$L58
	j	$L78
$L77:
	li	$v0,120			# 0x78
	lw	$v1,44($fp)
	beq	$v1,$v0,$L71
	j	$L78
$L57:
	lw	$v0,36($fp)
	lb	$v0,0($v0)
	move	$a0,$v0
	jal	_print_char
	lw	$v0,36($fp)
	addu	$v0,$v0,4
	sw	$v0,36($fp)
	j	$L78
$L58:
	lw	$v0,20($fp)
	bne	$v0,$zero,$L59
	lw	$v0,36($fp)
	lw	$a0,0($v0)
	jal	_strlen
	sw	$v0,20($fp)
$L59:
	lw	$v1,28($fp)
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L60
	lw	$v0,36($fp)
	lw	$a0,20($fp)
	lw	$a1,0($v0)
	jal	_print_limited_string
	lw	$v0,36($fp)
	lw	$a0,0($v0)
	jal	_strlen
	move	$v1,$v0
	lw	$v0,16($fp)
	subu	$v0,$v0,$v1
	move	$a0,$v0
	move	$a1,$zero
	jal	_max
	move	$a0,$v0
	move	$a1,$zero
	jal	_print_fill
	j	$L61
$L60:
	lw	$v0,36($fp)
	lw	$a0,0($v0)
	jal	_strlen
	move	$v1,$v0
	lw	$v0,16($fp)
	subu	$v0,$v0,$v1
	move	$a0,$v0
	move	$a1,$zero
	jal	_max
	move	$a0,$v0
	move	$a1,$zero
	jal	_print_fill
	lw	$v0,36($fp)
	lw	$a0,20($fp)
	lw	$a1,0($v0)
	jal	_print_limited_string
$L61:
	lw	$v0,36($fp)
	addu	$v0,$v0,4
	sw	$v0,36($fp)
	j	$L78
$L62:
	lw	$v1,28($fp)
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L63
	lw	$a0,32($fp)
	jal	_print_plus
	lw	$v0,36($fp)
	lw	$a0,0($v0)
	jal	_print_int
	lw	$v0,36($fp)
	lw	$a0,0($v0)
	jal	_get_digit
	move	$v1,$v0
	lw	$v0,16($fp)
	subu	$v1,$v0,$v1
	lw	$v0,32($fp)
	subu	$v0,$v1,$v0
	move	$a0,$v0
	move	$a1,$zero
	jal	_max
	move	$a0,$v0
	move	$a1,$zero
	jal	_print_fill
	j	$L64
$L63:
	lw	$v0,36($fp)
	lw	$a0,0($v0)
	jal	_get_digit
	move	$v1,$v0
	lw	$v0,16($fp)
	subu	$v1,$v0,$v1
	lw	$v0,32($fp)
	subu	$v0,$v1,$v0
	move	$a0,$v0
	move	$a1,$zero
	jal	_max
	move	$v1,$v0
	lw	$v0,24($fp)
	xori	$v0,$v0,0x1
	sltu	$v0,$v0,1
	move	$a0,$v1
	move	$a1,$v0
	jal	_print_fill
	lw	$a0,32($fp)
	jal	_print_plus
	lw	$v0,36($fp)
	lw	$a0,0($v0)
	jal	_print_int
$L64:
	lw	$v0,36($fp)
	addu	$v0,$v0,4
	sw	$v0,36($fp)
	j	$L78
$L65:
	lw	$v1,28($fp)
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L66
	lw	$a0,32($fp)
	jal	_print_plus
	lw	$v0,36($fp)
	l.s	$f2,0($v0)
	cvt.d.w	$f2,$f2
	li.d	$f0,1.10000000000000008882e0
	mul.d	$f0,$f2,$f0
	mov.d	$f12,$f0
	jal	_print_int
	lw	$v0,36($fp)
	l.s	$f2,0($v0)
	cvt.d.w	$f2,$f2
	li.d	$f0,1.10000000000000008882e0
	mul.d	$f0,$f2,$f0
	trunc.w.d $f2,$f0,$v1
	mfc1	$v0,$f2
	move	$a0,$v0
	jal	_get_digit
	move	$v1,$v0
	lw	$v0,16($fp)
	subu	$v1,$v0,$v1
	lw	$v0,32($fp)
	subu	$v0,$v1,$v0
	move	$a0,$v0
	move	$a1,$zero
	jal	_max
	move	$a0,$v0
	move	$a1,$zero
	jal	_print_fill
	j	$L67
$L66:
	lw	$v0,36($fp)
	l.s	$f2,0($v0)
	cvt.d.w	$f2,$f2
	li.d	$f0,1.10000000000000008882e0
	mul.d	$f0,$f2,$f0
	trunc.w.d $f2,$f0,$v1
	mfc1	$v0,$f2
	move	$a0,$v0
	jal	_get_digit
	move	$v1,$v0
	lw	$v0,16($fp)
	subu	$v1,$v0,$v1
	lw	$v0,32($fp)
	subu	$v0,$v1,$v0
	move	$a0,$v0
	move	$a1,$zero
	jal	_max
	move	$v1,$v0
	lw	$v0,24($fp)
	xori	$v0,$v0,0x1
	sltu	$v0,$v0,1
	move	$a0,$v1
	move	$a1,$v0
	jal	_print_fill
	lw	$a0,32($fp)
	jal	_print_plus
	lw	$v0,36($fp)
	l.s	$f2,0($v0)
	cvt.d.w	$f2,$f2
	li.d	$f0,1.10000000000000008882e0
	mul.d	$f0,$f2,$f0
	mov.d	$f12,$f0
	jal	_print_int
$L67:
	lw	$v0,36($fp)
	addu	$v0,$v0,4
	sw	$v0,36($fp)
	j	$L78
$L68:
	lw	$v1,28($fp)
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L69
	lw	$a0,32($fp)
	jal	_print_plus
	lw	$v0,36($fp)
	lw	$a0,0($v0)
	li	$a1,8			# 0x8
	jal	_print_base
	lw	$v0,36($fp)
	lw	$a0,0($v0)
	jal	_get_digit
	move	$v1,$v0
	lw	$v0,16($fp)
	subu	$v1,$v0,$v1
	lw	$v0,32($fp)
	subu	$v0,$v1,$v0
	move	$a0,$v0
	move	$a1,$zero
	jal	_max
	move	$a0,$v0
	move	$a1,$zero
	jal	_print_fill
	j	$L70
$L69:
	lw	$v0,36($fp)
	lw	$a0,0($v0)
	jal	_get_digit
	move	$v1,$v0
	lw	$v0,16($fp)
	subu	$v1,$v0,$v1
	lw	$v0,32($fp)
	subu	$v0,$v1,$v0
	move	$a0,$v0
	move	$a1,$zero
	jal	_max
	move	$v1,$v0
	lw	$v0,24($fp)
	xori	$v0,$v0,0x1
	sltu	$v0,$v0,1
	move	$a0,$v1
	move	$a1,$v0
	jal	_print_fill
	lw	$a0,32($fp)
	jal	_print_plus
	lw	$v0,36($fp)
	lw	$a0,0($v0)
	li	$a1,8			# 0x8
	jal	_print_base
$L70:
	lw	$v0,36($fp)
	addu	$v0,$v0,4
	sw	$v0,36($fp)
	j	$L78
$L71:
	lw	$v0,36($fp)
	lw	$a0,0($v0)
	li	$a1,16			# 0x10
	jal	_print_base
	lw	$v0,36($fp)
	addu	$v0,$v0,4
	sw	$v0,36($fp)
	j	$L78
$L72:
	li	$a0,37			# 0x25
	jal	_print_char
	j	$L78
$L44:
	lw	$v0,56($fp)
	lb	$v0,0($v0)
	move	$a0,$v0
	jal	_print_char
$L78:
	lw	$v0,56($fp)
	addu	$v0,$v0,1
	sw	$v0,56($fp)
	j	$L41
$L42:
	li	$a0,10			# 0xa
	jal	_print_char
	move	$sp,$fp
	lw	$ra,52($sp)
	lw	$fp,48($sp)
	addu	$sp,$sp,56
	j	$ra
