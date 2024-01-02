.data 
    newline: .asciiz "\n"
.text

main:
    # Declare the counter and the condition to exit loop
    li $t0, 0
    li $t1, 10

loop:
    add $t0, $t0, 1
    blt $t0, $t1, loop

# Print result outside the loop
print_result:
    li $v0, 4
    move $a0, $t0
    syscall

    # Print a newline character
    li $v0, 4
    la $a0, newline
    syscall

    # Exit program
    li $v0, 10
    syscall
