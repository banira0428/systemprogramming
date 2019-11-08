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
        jal     print_string
        li      $a0, 10
        jal     fact
        move    $a0, $v0
        jal     print_int
        la      $a0, newline
        jal     print_string
        j       $s0

fact:
        subu  $sp, $sp, 32
        sw    $fp, 16($sp)
        sw    $ra, 20($sp)

        addu  $fp, $sp, 28
        sw    $a0, 0($fp)

        bgtz  $a0, Lthen
        j     Lelse 

Lthen:
        subu  $a0, $a0, 1
        jal   fact

        lw    $v1, 0($fp)   
        mul   $v0, $v0, $v1
        j     Lreturn
        
Lelse:
        li    $v0, 1
        j     Lreturn

Lreturn:
        lw    $fp, 16($sp)
        lw    $ra, 20($sp) 
        addiu $sp, $sp, 32
        j     $ra

print_string:
        li      $v0, 4
        syscall
        j       $ra

print_int:
        li      $v0, 1
        syscall
        j       $ra
        
