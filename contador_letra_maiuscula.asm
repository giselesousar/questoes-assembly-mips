.data
	A: .ascii "GISELe"
.text
.globl main
main:
	la $t0, A
	addiu $t1, $zero, 5
	add $t2, $zero, $zero
	add $v1, $zero, $zero
loop: 
	add $t3, $t2, $t0
	lb $t4, 0($t3)
	addiu $s1, $t4, -65
	bgez $s1, menornoventa
	beq $t2, $t1, fim
	addiu $t2, $t2, 1
	j loop
	
menornoventa:
	addiu $s1, $t4, -90
	blez $s1, soma
	beq $t2, $t1, fim
	addiu $t2, $t2, 1
	j loop
soma:
	addiu $v1, $v1, 1
	beq $t2, $t1, fim
	addiu $t2, $t2, 1
	j loop
	
fim:	li $v0, 10
	syscall
	
