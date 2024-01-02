.data 
	prompt_str: .asciiz "Input string: "
	result_str: .asciiz "Your input string: "
	buffer: .space 100
.text
	#out the prompt
	li $v0, 4
	la $a0, prompt_str
	syscall
	
	li $v0, 8
	la $a0, buffer
	li $a1, 100
	syscall
	
	#output the string
	li $v0, 4
	la $a0, result_str
	syscall
	
	li $v0,4
	la $a0, buffer
	syscall