        .data
        .align 2
msg:
        .asciiz "Hello World"

        .text
        .align 2
main:
        la      $a0, msg
        li      $v0, 4
        syscall
        j       $ra
        
