    .data
    .align  2

newline:
        .asciiz "\n"
space:
        .asciiz " "

	.text
	.align	2

main:
    move    $s0, $ra
    li      $s1, 1
    la		$a0, 100 
    li      $a1, 2      # 
    li      $t0, 0      # match
    la		$a2, is_match		# 
    jal     loop
    la      $a0, newline
    jal     print_string
    j	    $s0				# jump to $s0


loop:
    slt	$v0,$t0,$a0		# if !(i < n)
	beq	$v0,$zero,return1	#   return 1

    move $s4, $ra
    jalr $a2
    move $ra, $s4

    addi	$a1, $a1, 1			# $a1 = $a1 + 0
	j	loop			# goto loop

is_match:
    move    $s3, $ra
    jal     test_prime
    beq     $v0,$s1,match
    j       $s3

# while:
# 	slt	$v0,$t0,$a0		# if !(i < n)
# 	beq	$v0,$zero,return1	#   return 1

#     jal test_prime
#     beq $v0,$s1,match

#     addi	$a1, $a1, 1			# $a1 = $a1 + 0
# 	j	while			# goto loop

match: 
    move    $s2, $a0
    move    $a0, $a1
    jal     print_int
    la      $a0, space
    jal     print_string
    move    $a0, $s2

    addi	$a1, $a1, 1			# $a1 = $a1 + 0
    addi	$t0, $t0, 1			# $a1 = $a1 + 0
    j       $s3

test_prime:				# int test_prime(int n = $a0)

	li	$a3,2			# i = 2
    la  $a2,divide
    j	loop				# jump toloop

divide:
    div	$a0,$t0			# $a0 = 
	mfhi	$v0			# $v0 = n % i
	beq	$v0,$zero,break0	# if ($v0 == 0) return 0
    j   $ra
    					# jump to

# for:
#     slt	$v0,$a3,$a1	# if !(i < n)
# 	beq	$v0,$zero,return1	#   return 1

#     div	$a1,$a3			# $a0 = 
# 	mfhi	$v0			# $v0 = n % i
# 	beq	$v0,$zero,return0	# if ($v0 == 0) return 0

#     addi	$a3, $a3, 1			# $a1 = $a1 + 0
#     j   for
break0:
	move	$ra, $s4
	j	    return0

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


#  main()
#  {
#    int match = 0, n = 2;
#    while (match < 100){
#      if (test_prime(n) == 1){
#        print_int(n);
#        print_string(" ");
#        match++;
#        if (match % 10 == 0)
#          print_string("\n")
#      }
#      n++;
#    }
#    print_string("\n");
#    return;
#  }