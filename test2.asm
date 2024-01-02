.data
array: .word 5, 2, 9, 1, 5, 6, 3, 8, 4, 7
array_size: .word 10

.text
main:
    # Load array address
    la $t0, array
    # Load array size
    lw $t1, array_size

    # Outer loop: Repeat until no swaps are made
outer_loop:
    li $t2, 0  # Flag to check if any swaps are made
    # Inner loop: Bubble up the largest element to the end
    li $t3, 0  # Initialize inner loop counter
inner_loop:
    # Calculate the addresses of array elements to be compared
    mul $t4, $t3, 4  # Index * sizeof(int)
    add $t5, $t0, $t4  # Address of the current element
    add $t6, $t0, $t4
    addi $t6, $t6, 4  # Address of the next element

    # Load values to be compared
    lw $t7, 0($t5)
    lw $t8, 0($t6)

    # Compare and swap if needed
    bge $t7, $t8, no_swap
    sw $t8, 0($t5)
    sw $t7, 0($t6)
    li $t2, 1  # Set the swap flag
no_swap:

    # Increment inner loop counter
    addi $t3, $t3, 1
    # Continue inner loop if not at the end of the array
    bne $t3, $t1, inner_loop

    # Check if any swaps were made in the inner loop
    bnez $t2, outer_loop

    # If no swaps were made, the array is sorted
    # Your code to handle the sorted array goes here

    # Exit the program
    li $v0, 10
    syscall
