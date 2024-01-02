.data
input: .asciiz "Input the number (stop when you enter 0): "
result: .asciiz "Result of the sum = "
.text
main:
	li $s0,0
loop:
	li $v0, 4
	la $a0, input
	syscall
	
	li $v0, 5
	syscall
	move $t0,$v0
	
	beqz $t0,exit
	add $s0,$s0,$t0
	j loop
exit:
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0,1
	move $a0,$s0
	syscall
	
	li $v0,10
	syscall