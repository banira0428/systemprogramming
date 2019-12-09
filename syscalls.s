.text
.align 2

print_int:
 subu    $sp,$sp,24
 sw      $ra,20($sp)

 li      $v0, 1
 syscall

 lw      $ra,20($sp)
 addu    $sp,$sp,24
 j       $ra 

print_string:
 subu    $sp,$sp,24
 sw      $ra,20($sp)

 li      $v0, 4
 syscall

 lw      $ra,20($sp)
 addu    $sp,$sp,24
 j       $ra 