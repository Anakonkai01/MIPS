.data
prompt_SizeArray: .asciiz "Enter the size of the array: "
prompt_array: .asciiz "Enter elements for the array: "
prompt_output_array: .asciiz "Output array:\n"
newline: .asciiz "\n"
array: .space 400  # Reserve 400 bytes for the array

.text
main:
    # Input the size of the array
    li $v0, 4
    la $a0, prompt_SizeArray
    syscall

    li $v0, 5
    syscall
    move $t1, $v0  # Store the size of the array in $t1

    # Load the base address of the array
    la $s0, array

    # Input values for the array
    li $v0, 4
    la $a0, prompt_array
    syscall

    li $t0, 0  # Counter for the loop
input_loop:
    beq $t0, $t1, next_step  # If counter equals the size, proceed
    li $v0, 5
    syscall
    sw $v0, ($s0)  # Store the input value in the array

    # Increment counter and move to the next element in the array
    addi $t0, $t0, 1
    addi $s0, $s0, 4

    j input_loop  # Jump back to input_loop

next_step:
    # Output the array
    li $v0, 4
    la $a0, prompt_output_array
    syscall

    li $t0, 0  # Reset the counter for the loop
    la $s0, array  # Load the base address of the array
output_loop:
    beq $t0, $t1, exit  # If counter equals the size, exit the program
    li $v0, 1
    lw $t2, ($s0)
    move $a0, $t2
    syscall

    # Output a newline character
    li $v0, 4
    la $a0, newline
    syscall

    # Increment counter and move to the next element in the array
    addi $t0, $t0, 1
    addi $s0, $s0, 4

    j output_loop  # Jump back to output_loop

exit:
    li $v0, 10
    syscall
