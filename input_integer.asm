.data
	promt: .asciiz "Input an integer: "
	result: .asciiz "Result = "
.text
	#input 
	li $v0, 4
	la $a0, promt
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0 
	
	#output 
	li $t1, 5
	add $t0,$t0,$t1
	
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	move $a0, $t0 
	syscall
