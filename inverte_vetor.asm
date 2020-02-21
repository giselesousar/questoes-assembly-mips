.data
	A: .word 0,1,2,3,4,5,6,7,8,9
	B: .space 10
	newLine: .asciiz "\n"
.text
.globl main
main:
	la $t0, A
	la $t1, B
	
	addiu $t2, $zero, 0
	addiu $t4, $zero, 36 
	
loop:
	beq $t2, 40, end
	addu $t3, $t2, $t0
	lw $s0, 0($t3)
	addu $t5, $t4, $t1
	sw $s0, 0($t5)
	lw $s1, 0($t5) #verificando se escreveu em B
	
	li $v0, 1
	move $a0, $s1
	syscall
	
	li $v0, 4
	la $a0, newLine
	syscall
	
	addiu $t4, $t4, -4
	addiu $t2, $t2, 4
	
	j loop
end:
	li $v0, 10
	syscall