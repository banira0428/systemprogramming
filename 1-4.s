    .data
    .align  2

newline:
        .asciiz "\n"
space:
        .asciiz " "

	.text
	.align	2

test_prime:				    # int test_prime(int n = $a0)

	li	$a3,2			    # forのループ数カウンタ

for:
    slt	$v0,$a3,$a1	        # if !(i < n)
	beq	$v0,$zero,return1	#   return 1

    div	$a1,$a3			    # $a0 = 
	mfhi	$v0			    # $v0 = n % i
	beq	$v0,$zero,return0	# if ($v0 == 0) return 0

    addi	$a3, $a3, 1		# $a1 = $a1 + 0
    j   for

while:
	slt	$v0,$a2,$a0		    # if !(i < n)
	beq	$v0,$zero,return1	#   return 1

    move $s3, $ra
    jal test_prime
    move $ra, $s3
    beq $v0,$s1,match

    addi	$a1, $a1, 1		# $a1 = $a1 + 1
	j	while			    # goto while

match: 
    move    $s2, $a0
    move    $a0, $a1
    jal     print_int
    la      $a0, space
    jal     print_string
    move    $a0, $s2

    addi	$a1, $a1, 1			# $a1 = $a1 + 0
    addi	$a2, $a2, 1			# $a1 = $a1 + 0
    j       while

main:
    move    $s0, $ra
    li      $s1, 1
    la		$a0, 100 
    li      $a1, 2      # whileのループ数カウンタ
    li      $a2, 0      # match数
    jal     while
    la      $a0, newline
    jal     print_string
    j	$s0				# jump to $s0


return0:
	li	$v0,0
	j	$ra

return1:
	li	$v0,1
	j	$ra

print_string:
    li      $v0, 4
    syscall
    j       $ra

print_int:
    li      $v0, 1
    syscall
    j       $ra
