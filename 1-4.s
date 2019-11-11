    .data
    .align  2

newline:
        .asciiz "\n"
space:
        .asciiz " "

    .text
    .align  2

test_prime:    
    li   $a3,2    

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
    move $s0, $ra
    li   $s1, 1
    la   $a0, 100 
    li   $a1, 2      
    li   $a2, 0      
    j    while

while:
    slt  $v0, $a2, $a0    
    beq  $v0, $zero, exit

    jal  test_prime
    beq  $v0,$s1,then
    j    default

then: 
    move $s2, $a0
    move $a0, $a1
    jal  print_int
    la   $a0, space
    jal  print_string
    move $a0, $s2
    addi $a2, $a2, 1
    j    default

default:
    addi $a1, $a1, 1
    j    while

exit:
    la   $a0, newline
    jal  print_string
    j    $s0

print_string:
    li   $v0, 4
    syscall
    j    $ra

print_int:
    li   $v0, 1
    syscall
    j    $ra
