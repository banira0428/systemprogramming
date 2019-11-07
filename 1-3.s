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
        subu  $sp, $sp, 12
        sw    $ra, 8($sp)
        sw    $a0, 4($sp)

        bgtz  $a0, Lthen
        j     Lelse 

Lthen:
        lw    $v1, 4($sp)
        subu  $a0, $v1, 1
        jal   fact

        lw    $v1, 4($sp)   
        mul   $v0, $v0, $v1
        j     Lreturn
        
Lelse:
        li    $v0, 1
        j     Lreturn

Lreturn:
        lw    $ra, 8($sp) 
        addiu $sp, $sp, 12
        j     $ra

print_string:
        li      $v0, 4
        syscall
        j       $ra

print_int:
        li      $v0, 1
        syscall
        j       $ra
        
