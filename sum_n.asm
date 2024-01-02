.data
inputN: .asciiz "Input :"
result: .asciiz "sum = "
.text

main: 
	li $t0,1
	li $v0,4
	la $a0,inputN
	syscall
	li $v0, 5
	syscall
	move $t1,$v0
	
	li $s0,0

loop:
	bgt $t0,$t1,exit
	add $s0,$s0,$t0 
	add $t0,$t0,1
	j loop
exit:
	li $v0,1
	move $a0,$s0
	syscall
	li $v0, 10
	syscall
	 
