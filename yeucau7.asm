.data
array: .word 1,2,3,4,12,13,15
input: .asciiz "input 5 number: "
result: .asciiz "The largest number in the array: "
.text


main:
	li $t0, 0 # counter
	li $t1, 7 # size array
	
	#input text
	li $v0, 4
	la $a0, input
	syscall
	
	#load mang
	la $s0, array 
	
	#khai bao max = phan tu dau tien trong mang
	lw $t2 , 0($s0)
	
loop:
	beq $t0, $t1, exit
	bgt $s0, $t2, changeMaxValue
	addi $t0,$t0,1
	addi $s0,$s0,4
	j loop
	
	
changeMaxValue:
	lw $t2, ($s0) # change the value
	addi $t0,$t0,1
	addi $s0,$s0,4
	j loop
	
exit: 
	#print the result
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	