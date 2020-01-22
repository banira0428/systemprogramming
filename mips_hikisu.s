	.file	1 "mips_hikisu.c"

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
_sum:
	sw	$a0,0($sp)
	sw	$a1,4($sp)
	sw	$a2,8($sp)
	sw	$a3,12($sp)
	subu	$sp,$sp,24
	sw	$fp,16($sp)
	move	$fp,$sp
	sw	$a0,24($fp)
	sw	$zero,0($fp)
	addu	$v0,$fp,28
	sw	$v0,8($fp)
	lw	$v0,24($fp)
	sw	$v0,4($fp)
$L3:
	lw	$v0,4($fp)
	bne	$v0,$zero,$L6
	j	$L4
$L6:
	lw	$v1,0($fp)
	lw	$v0,4($fp)
	addu	$v0,$v1,$v0
	sw	$v0,0($fp)
	lw	$v0,8($fp)
	addu	$v1,$v0,3
	li	$v0,-4			# 0xfffffffc
	and	$v0,$v1,$v0
	sw	$v0,8($fp)
	lw	$v0,8($fp)
	addu	$v0,$v0,0
	move	$v1,$v0
	lw	$v0,8($fp)
	addu	$v0,$v0,4
	sw	$v0,8($fp)
	lw	$v0,0($v1)
	sw	$v0,4($fp)
	j	$L3
$L4:
	lw	$v0,0($fp)
	move	$sp,$fp
	lw	$fp,16($sp)
	addu	$sp,$sp,24
	j	$ra
	.align	2
_call_sum:
	subu	$sp,$sp,48
	sw	$ra,44($sp)
	sw	$fp,40($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	lw	$a0,48($fp)
	lw	$v0,48($fp)
	addu	$a1,$v0,4
	lw	$v0,48($fp)
	addu	$a2,$v0,8
	lw	$v0,48($fp)
	addu	$v1,$v0,12
	lw	$v0,48($fp)
	addu	$v0,$v0,16
	lw	$v0,0($v0)
	sw	$v0,16($sp)
	lw	$v0,48($fp)
	addu	$v0,$v0,20
	lw	$v0,0($v0)
	sw	$v0,20($sp)
	lw	$v0,48($fp)
	addu	$v0,$v0,24
	lw	$v0,0($v0)
	sw	$v0,24($sp)
	lw	$v0,48($fp)
	addu	$v0,$v0,28
	lw	$v0,0($v0)
	sw	$v0,28($sp)
	lw	$v0,48($fp)
	addu	$v0,$v0,32
	lw	$v0,0($v0)
	sw	$v0,32($sp)
	lw	$v0,48($fp)
	addu	$v0,$v0,36
	lw	$v0,0($v0)
	sw	$v0,36($sp)
	lw	$a0,0($a0)
	lw	$a1,0($a1)
	lw	$a2,0($a2)
	lw	$a3,0($v1)
	jal	_sum
	move	$sp,$fp
	lw	$ra,44($sp)
	lw	$fp,40($sp)
	addu	$sp,$sp,48
	j	$ra
