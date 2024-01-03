.data
array: .word 5, 2, 9, 1, 5, 6, 3, 8, 4, 7
array_size: .word 10
newline: .asciiz "\n"
comma: .asciiz ", "

.text
main:
    # Load array address
    la $t1, array
    # Load array size
    lw $t2, array_size

    # Print original array
    li $v0, 4
    la $a0, array
    syscall

    # Print elements of the array with commas
    li $t0, 0  # Loop counter
print_loop:
    bge $t0, $t2, exit_print  # Exit if counter reaches array size

    lw $a0, 0($t1)  # Load the current element to be printed

    li $v0, 1
    syscall

    # Print a comma and space unless it's the last element
    bge $t0, $t2, skip_comma  # Check if it's the last element
    li $v0, 4
    la $a0, comma
    syscall
skip_comma:

    addi $t1, $t1, 4  # Move to the next element in the array
    addi $t0, $t0, 1  # Increment the counter
    j print_loop

exit_print:
    # Print a newline character at the end
    li $v0, 4
    la $a0, newline
    syscall

    # Exit the program
    li $v0, 10
    syscall
