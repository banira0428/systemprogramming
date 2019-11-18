        .data
        .align 2
msg:
        .asciiz "Hello World"

        .text
        .align 2      
main:
        
        la      $a1, msg
        
        .text
        .align 2  
putc:
        lb      $a0, 0($a1)             
        lw      $t0, 0xffff0008         
        li      $t1, 1                  
        and     $t0, $t0, $t1           
        beqz    $t0, putc               
        sw      $a0, 0xffff000c         
        addi    $a1, $a1, 1
        bnez    $a0, putc
        j       $ra                     
