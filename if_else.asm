.data 
    str1: .asciiz "Input n1: "
    str2: .asciiz "Input n2: "
    str3: .asciiz "n1 not equal to n2\n"
    str4: .asciiz "n1 == n2\n"
.text
    # Input n1
    li $v0, 4
    la $a0, str1
    syscall
    
    li $v0, 5
    syscall
    move $s0, $v0
    
    # Input n2
    li $v0, 4
    la $a0, str2
    syscall
    
    li $v0, 5
    syscall
    move $s1, $v0
    
    # Compare
    beq $s0, $s1, true
    la $a0, str3
    j print_result
    
    
true:
    la $a0, str4
print_result:
    # Print result message
    li $v0, 4
    syscall

    # Exit
    li $v0, 10
    syscall
