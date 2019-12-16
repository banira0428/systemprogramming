	.file	1 "2-3-2.c"

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


	.text
	.align	2
main:
	subu	$sp,$sp,72
	sw	$ra,68($sp)
	sw	$fp,64($sp)
	move	$fp,$sp
	.set	noreorder
	nop
	.set	reorder
	sw	$zero,56($fp)
$L3:
	lw	$v0,56($fp)
	slt	$v0,$v0,10
	bne	$v0,$zero,$L6
	j	$L4
$L6:
	lw	$v0,56($fp)
	sll	$v1,$v0,2
	addu	$v0,$fp,16
	addu	$v1,$v0,$v1
	lw	$v0,56($fp)
	sw	$v0,0($v1)
	lw	$v0,56($fp)
	sll	$v1,$v0,2
	addu	$v0,$fp,16
	addu	$v0,$v0,$v1
	lw	$a0,0($v0)
	jal	_print_int
	lw	$v0,56($fp)
	addu	$v0,$v0,1
	sw	$v0,56($fp)
	j	$L3
$L4:
	move	$sp,$fp
	lw	$ra,68($sp)
	lw	$fp,64($sp)
	addu	$sp,$sp,72
	j	$ra
