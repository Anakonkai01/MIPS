.data
space: .asciiz " "
inputText: .asciiz "Input k: "
.text

main:
    # Initial count
    li $t0, 0
    
    # Input k
    li $v0, 4
    la $a0, inputText
    syscall
    li $v0, 5
    syscall 
    move $t1, $v0
    
    # Condition
    li $t2, 100

loop:
    bgt $t0, $t2, exit
    
    # Counter
    add $t0, $t0, 1
    
    div $t0, $t1
    mfhi $t3
    beq $t3,0, loop  # Jump to loop if the remainder is not 0 (i.e., if $t0 is divisible by $t1)
    
    # Print the current number
    li $v0, 1
    move $a0, $t0
    syscall
    
    # Print a space
    li $v0, 4
    la $a0, space
    syscall
    
    j loop  # Jump unconditionally to loop
    
exit:
    # Exit program
    li $v0, 10
    syscall
