        .data
        .align 2
msg:
        .asciiz "Hello!!\n"

        .text
        .align 2      
main:
        
        la      $a1, msg
        
        .text
        .align 2  
putc:
        lb      $a0, 0($a1)             # $a0 に引数 'A' == 65
        lw      $t0, 0xffff0008         # $t0 = *(0xffff0008)
        li      $t1, 1                  # $t1 = 1
        and     $t0, $t0, $t1           # $t0 &= $t1
        beqz    $t0, loop               # if ($t0 == 0) goto putc
        sw      $a0, 0xffff000c         # *(0xffff000c) = $a0

        addi    $a1, $a1, 1
        bnez    $a0, putc
        j       $ra                     # return
