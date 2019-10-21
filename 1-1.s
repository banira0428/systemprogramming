        .data
        .align 2
msg:
        .byte 'H','e','l','l','o',0

        .text
        .align 2      
main:
        
        li      $v0, 0
        li      $a1, 0
        
        .text
        .align 2  
putc:
        la      $a2, msg
        addu    $a1, $a2, $v0
        lb      $a0, 0($a1)             # $a0 に引数 'A' == 65
        lw      $t0, 0xffff0008         # $t0 = *(0xffff0008)
        li      $t1, 1                  # $t1 = 1
        and     $t0, $t0, $t1           # $t0 &= $t1
        beqz    $t0, putc               # if ($t0 == 0) goto putc
        sw      $a0, 0xffff000c         # *(0xffff000c) = $a0
        addi    $v0, $v0, 1
        blt     $v0, 05, putc
        j       $ra                     # return
