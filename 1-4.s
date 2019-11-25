    .data
    .align  2

newline:
        .asciiz "\n"
space:
        .asciiz " "

    .text
    .align  2

test_prime:    
    li   $a3, 2    

for:
    slt  $v0, $a3, $a1        
    beq  $v0, $zero, return1

    div  $a1, $a3    
    mfhi $v0    
    beq  $v0, $zero, return0

    addi $a3, $a3, 1
    j    for

return0:
    li   $v0, 0
    j    $ra

return1:
    li   $v0, 1
    j    $ra

main:
    subu $sp, $sp, 32
    sw   $ra, 20($sp)
    li   $a1, 2      
    li   $a2, 0      
    j    while

while:
    la   $t2, 100
    slt  $v0, $a2, $t2    
    beq  $v0, $zero, exit

    jal  test_prime
    li   $t0, 1
    beq  $v0,$t0,then
    j    default

then: 
    move $a0, $a1
    jal  print_int
    la   $a0, space
    jal  print_string
    addi $a2, $a2, 1
    li   $t1, 10
    div  $a2, $t1
    mfhi $v0
    beq  $v0, $zero, wrap
    j    default

wrap:
    la   $a0, newline
    jal  print_string
    j    default

default:
    addi $a1, $a1, 1
    j    while

exit:
    la   $a0, newline
    jal  print_string
    lw      $ra, 20($sp) 
    addiu   $sp, $sp, 32
    j       $ra

print_string:
    li   $v0, 4
    syscall
    j    $ra

print_int:
    li   $v0, 1
    syscall
    j    $ra
