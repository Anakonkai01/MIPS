.data
inputSizeArray: .asciiz "input the size of the array\n"
array: .space 400
inputValueArray: .asciiz "input the value for the array\n"
outputArray: .asciiz "Output of the array\n"
afterSort: .asciiz "Array after sorted"
.text

main:
	li $v0, 4
	la $a0, inputSizeArray
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0 
	
	la $s0, array
	li $t0 ,0 
	
	li $v0, 4
	la $a0, inputValueArray
	syscall
	
	

inputValue: 
	beq $t0 , $t1 sort
	
	li $v0, 5
	syscall
	sw $v0, ($s0)

	addi $s0,$s0, 4
	addi $t0 , $t0 ,1 
	j inputValue		

sort: 
	la $s0, array
	li $t0 ,0 
outerLoop: 
	beq $t0, $t1 , printArray
	li $t2, 0
	# addi $t2, $t0 , 0
innerLoop:
	beq $t2, $t1, outerLoop
	
	
	lw $t3, ($s0)
	lw $t4, 4($s0)
	
	bgt $t3, $t4, swap

	addi $t2, $t2 ,1
	addi $s0, $s0, 4
	
	
	
swap:
	sw $t3, 4($s0)
	sw $t4, ($s0)
	addi $t2, $t2 ,1
	addi $s0, $s0, 4
	j innerLoop



addCounter:
	
printArray: