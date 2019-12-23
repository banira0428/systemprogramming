	.file	1 "2-3-3.c"

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
	.asciiz	"ABCDEFG"
	.data
	.align	2
_string_ptr:
	.word	$LC0
	.align	2
_string_ary:
	.asciiz	"ABCDEFG"
	.rdata
	.align	2
$LC1:
	.asciiz	"AB"
	.text
	.align	2
main:
	subu	$sp,$sp,8
	sw	$fp,0($sp)
	move	$fp,$sp
	la	$v0,$LC1
	sw	$v0,_string_ptr
	move	$sp,$fp
	lw	$fp,0($sp)
	addu	$sp,$sp,8
	j	$ra
