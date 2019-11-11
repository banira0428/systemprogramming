    .data
    .align  2
newline:
        .asciiz "\n"
    .data
    .align  2
input:
        .asciiz "> "
    .data
    .align  2    
primes:
        .space 400

	.text
	.align	2

test_prime:				    
	li	$a3, 2			    # forのループ数カウンタ

for:
    slt	$v0,$a3,$a1	        
	beq	$v0,$zero,return1	

    div	$a1,$a3			    
	mfhi	$v0			    
	beq	$v0,$zero,return0	

    addi	$a3, $a3, 1
    j   for

while:
	slt	$v0,$a2,$a0		    
	beq	$v0,$zero,return1	

    move $s3, $ra
    jal test_prime
    move $ra, $s3
    beq $v0,$s1,match

    addi	$a1, $a1, 1		
	j	while			    

match: 

    move    $s3, $ra
    move    $a3, $a2
    jal     get_address   
    move    $ra, $s3
    sw      $a1, 0($v0)
    
    addi	$a1, $a1, 1			
    addi	$a2, $a2, 1			
    j       while

main:
    move    $s0, $ra
    li      $s1, 1
    la		$a0, 100 
    li      $a1, 2          # whileのループ数カウンタ
    li      $a2, 0          # match数
    la      $t1, primes     # 配列の先頭アドレス
    jal     while
    j		find			
    
find:     
    la      $a0, input
    jal     print_string
    jal     read_int
    move    $a3, $v0
    addi    $a3, $a3, -1   # $a3 を一つ減算
    jal		get_address	
    lw		$a0, 0($v0) 
    jal     print_int
    la      $a0, newline
    jal     print_string
    j       find

get_address:
    addu    $a3, $a3, $a3  # $a0 (match) を倍に
    addu    $a3, $a3, $a3  # $a0 を更に倍に ($a0 = match * 4)
    addu    $a3, $t1, $a3  # $a0 = $t1 + $a0
    move    $v0, $a3
    j		$ra				# jump to $ra
    
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

read_int:
    li		$v0, 5
    syscall
    j       $ra
