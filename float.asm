.data
    prompt1: .asciiz "Nh?p s? th?c th? nh?t: "
    prompt2: .asciiz "Nh?p s? th?c th? hai: "
    resultSum: .asciiz "T?ng l�: "
    resultDiff: .asciiz "Hi?u l�: "
.text
    # Nh?p s? th?c th? nh?t
    li $v0, 4
    la $a0, prompt1
    syscall
    
    li $v0, 6
    syscall
    mov.s $f0, $f12  # L?u gi� tr? v�o $f0

    # Nh?p s? th?c th? hai
    li $v0, 4
    la $a0, prompt2
    syscall
    
    li $v0, 6
    syscall
    mov.s $f1, $f12  # L?u gi� tr? v�o $f1

    # T�nh t?ng v� hi?u
    add.s $f2, $f0, $f1  # T?ng
    sub.s $f3, $f0, $f1  # Hi?u

    # Xu?t k?t qu?
    li $v0, 4
    la $a0, resultSum
    syscall
    
    li $v0, 2
    mov.s $f12, $f2
    syscall

    li $v0, 4
    la $a0, resultDiff
    syscall
    
    li $v0, 2
    mov.s $f12, $f3
    syscall
