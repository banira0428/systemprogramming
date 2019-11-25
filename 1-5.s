    .data
    .align  2
newline:
        .asciiz "\n"

msg_input:
        .asciiz "> "
     
msg_error:
        .asciiz "please input 1 to 100"
    
msg_exit:
        .asciiz "exit"

primes:
        .space 400

    .text
    .align  2

test_prime:

    li  $a3, 2

Lfor:
    slt $v0,$a3,$a1    
    beq $v0,$zero,return1

    div $a1,$a3    
    mfhi    $v0  
    beq $v0,$zero,return0

    addi    $a3, $a3, 1
    j   Lfor

return0:
    li  $v0,0
    j   $ra

return1:
    li  $v0,1
    j   $ra 

main:
    move    $s0, $ra
    la      $t2, 100 
    li      $a1, 2          
    li      $a2, 0          
    j       while

while:
    slt     $v0, $a2, $t2    
    beq     $v0, $zero, find

    jal     test_prime
    li      $t1, 1
    beq     $v0, $t1, then
    j       default

then:
    move    $a3, $a2
    jal     get_address   
    sw      $a1, 0($v0)
    addi    $a2, $a2, 1
    j       default
    
default:
    addi    $a1, $a1, 1
    j       while
    
find:
    la      $a0, msg_input
    jal     print_string
    jal     read_int
    bltz    $v0, error
    bgt     $v0, $t2, error
    beq     $v0, $zero, exit
    move    $a3, $v0
    addi    $a3, $a3, -1 
    jal     get_address
    lw      $a0, 0($v0) 
    jal     print_int
    la      $a0, newline
    jal     print_string
    j       find

error:
    la      $a0, msg_error
    jal     print_string
    la      $a0, newline
    jal     print_string
    j       find

exit:
    la      $a0, msg_exit
    jal     print_string
    j       $s0  
    

get_address:
    la      $t0, primes     
    addu    $a3, $a3, $a3  
    addu    $a3, $a3, $a3  
    addu    $a3, $t0, $a3  
    move    $v0, $a3
    j       $ra

print_string:
    li      $v0, 4
    syscall
    j       $ra

print_int:
    li      $v0, 1
    syscall
    j       $ra

read_int:
    li      $v0, 5
    syscall
    j       $ra
