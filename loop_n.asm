.data
newline: .asciiz "\n"
str1: .asciiz "Input n: "
.text


main:
	li $v0, 4
	la $a0, str1
	syscall
	
	li $v0,5
	syscall
	move $t2,$v0
	 
	li $t0,1
	add $t1,$t2,$zero
	
loop:
	
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	add $t0,$t0,1
	beq $t0,$t1,exit
	j loop
	
exit:
	li $v0,10
	syscall