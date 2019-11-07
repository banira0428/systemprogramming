    .text
    .align  2
_print_message:
    la      $a0, msg
    li      $v0, 4
    .data
    .align 2
msg:
    .asciiz "Hello!!\n"
    .text
    .align 2
    syscall
    j       $ra
main:
    subu    $sp, $sp, 24
    sw      $ra, 16($sp)
    jal     _print_message
    lw      $ra, 16($sp)
    addu    $sp, $sp, 24
    j       $ra