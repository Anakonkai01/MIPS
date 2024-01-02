.data
str_choose: .asciiz "Choose the opererant: "
str_input1: .asciiz "Input n1: "
str_input2: .asciiz "Input n2: "
chooseCase1: .asciiz "1: Sum of n1 + n2\n"
chooseCase2: .asciiz "2: Substract n1 - n2\n"
chooseCase3: .asciiz "3: Multiply n1 * n2\n"
chooseCase4: .asciiz "4: Divide to take quotient n1/n2\n"
chooseCase5: .asciiz "5: Divide to take Remainder n1%n2\n"
default: .asciiz "Invalid input"
result: .asciiz "Result = "
.text

main:
	#input n1
	li $v0,4
	la $a0,str_input1
	syscall
	
	li $v0,5
	syscall
	move $s0, $v0 
	#input n2
	li $v0, 4
	la $a0,str_input2
	syscall
	
	li $v0,5
	syscall
	move $s1,$v0
	 
	#choose Case
	li $v0,4
	la $a0, str_choose 
	syscall
	
	li $v0,5
	syscall
	move $t0, $v0
	
	# compare case
	beq $t0,1,case1
	beq $t0,2,case2
	beq $t0,3,case3
	beq $t0,4,case4
	beq $t0,5,case5
	
	#default case
	j defaultCase





case1:
	add $s2,$s0,$s1
	li $v0,4
	la $a0, result 
	syscall
	
	li $v0,1
	move $a0,$s2
	syscall
	j end
	
case2:
	sub $s2,$s0,$s1
	li $v0,4
	la $a0, result 
	syscall
	
	li $v0,1
	move $a0,$s2
	syscall
	j end
case3:
	mul $s2,$s0,$s1
	li $v0,4
	la $a0, result 
	syscall
	
	li $v0,1
	move $a0,$s2
	syscall
	j end
case4:
	div $s0,$s1
	li $v0,4
	la $a0, result 
	syscall
	
	li $v0,1
	mflo $s2
	move $a0,$s2
	syscall
	j end
case5:
	div $s0,$s1
	li $v0,4
	la $a0, result 
	syscall
	
	li $v0,1
	mfhi $s2
	move $a0,$s2
	syscall
	j end
defaultCase:
	li $v0,4
	la $a0,default
	syscall
	j end
end:
	#exit program
	li $v0, 10
	syscall

	  
