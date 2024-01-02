.data
promt_SizeArray: .asciiz "Input the number for the size of the array:\n"
promt_array: .asciiz "Input for array:\n"
promt_output_array: .asciiz "Output array:\n"
newline: .asciiz "\n"
array: .space 100   
.text


main:
    li $v0 , 4
    la $a0, promt_SizeArray
    syscall

    li $v0 ,5 
    syscall
    move $t1, $v0

    la $s0 , array 
    li $t0, 0

    li $v0 , 4
    la $a0 , promt_array
    syscall

loopInput:
    beq $t0 , $t1 , printArray

    li $v0, 5
    syscall
    sw $v0, ($s0)

    addi $t0, $t0 , 1
    addi $s0 , $s0 , 4

    j loopInput



printArray:
    la $s0 , array
    li $t0, 0

    li $v0 ,4
    la $a0, promt_output_array
    syscall
loopOutput:
    beq $t0 , $t1 , exit

    li $v0, 1
    lw $a0, ($s0)
    syscall
    
    li $v0 ,4 
    la $a0, newline
    syscall

    addi $t0, $t0 , 1
    addi $s0 , $s0 , 4

    j loopOutput


exit: 
    li $v0, 10
    syscall