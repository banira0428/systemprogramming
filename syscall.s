        .data
        .align 2
msg:
        .asciiz "Hello World"
newline:
        .asciiz "\n"

        .text
        .align 2
main:
        move    $s0, $ra
        la      $a0, msg
        jal     print
        la      $a0, newline
        jal     print
        j       $s0

print:
        li      $v0, 4
        syscall
        j       $ra
        
