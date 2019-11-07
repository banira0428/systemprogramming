        .data
        .align 2
msg:
        .asciiz "The factorial of 10 is "
newline:
        .asciiz "\n"

        .text
        .align 2
main:
        move    $s0, $ra
        li      $s1, 1
        la      $a0, msg
        jal     print
        li      $a0, 10
        jal     fact
        move    $a0, $v0
        li      $v0, 1
        syscall
        la      $a0, newline
        jal     print
        j       $s0

fact:
        subu  $sp, $sp, 32
        sw    $ra, 20($sp)
        sw    $a0, 16($sp)

        lw    $v0, 16($sp)
        bgtz  $v0, Lcalc

        li    $v0, 1
        j     Lexit

Lcalc:
        lw    $v1, 16($sp)
        subu  $v0, $v1, 1
        move  $a0, $v0
        jal   fact

        lw    $v1, 16($sp)   
        mul   $v0, $v0, $v1

Lexit:
        lw    $ra, 20($sp) 
        addiu $sp, $sp, 32  
        j     $ra

print:
        li      $v0, 4
        syscall
        j       $ra
        
