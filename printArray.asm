.data
array: .word 1,2,3,4,5,6,7,8,9,10
arraySize: .word 10
.text
main:
	lw $t2, arraySize
	la $t1,array
	li $t0, 0
	
loop:
	beq $t0,$t2,exit
	lw $a0,($t1)
	
	li $v0,1
	syscall
	addi $t1,$t1,4
	addi $t0,$t0,1
	j loop


exit:
	li $v0,10
	syscall