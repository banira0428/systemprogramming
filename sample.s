# わりとシンプルな(うまくいかない)例 :

        .text
        .align 2

main:
        move    $s0, $ra
        li      $a0, 72                 # $a0 に引数 'H' == 72
        jal     putc
        li      $a0, 101                # $a0 に引数 'e' == 101
        jal     putc
        li      $a0, 108                # $a0 に引数 'l' == 108
        jal     putc
        li      $a0, 108                # $a0 に引数 'l' == 108
        jal     putc
        li      $a0, 111                # $a0 に引数 'o' == 111
        jal     putc                    # この後無限ループ
        jr      $s0   
putc:
        lw      $t0, 0xffff0008         # $t0 = *(0xffff0008)
        li      $t1, 1                  # $t1 = 1
        and     $t0, $t0, $t1           # $t0 &= $t1
        beqz    $t0, putc               # if ($t0 == 0) goto putc
        sw      $a0, 0xffff000c         # *(0xffff000c) = $a0
        j       $ra
    
