.data
	A: .word 5,6,2,8,-1,7,2,0,4,1
	B: .space 10

.text
.globl main
main:	
	la $t0, A
	la $t1, B

	addiu $s5, $zero, 9
	addiu $t2, $zero, 0

parte1:  sll $t3, $t2, 2
	addu $t4, $t0, $t3
	lw $a0, 0($t4)
	jal parte2
	beq $t2, $s5, end
	addiu $t2, $t2, 1
	lw $v1, 0($t1)
	j parte1


parte2: 
	addiu $a1, $t1, 0
	beq $t3, $zero, first
	addiu $t6,$zero, 0
loop:	sll $t7, $t6, 2
	addu $a1, $t1, $t7
	beq $t6, $t2, i
	lw $t7, 0($a1)
	slt $t8, $t7, $a0 
	beq $t8, $zero, parte3
	addiu $t6, $t6, 1
j loop

i:      sll $t3, $t2, 2
	addu $a1, $t3, $t1
	j first  

parte3: 

	addiu $s1,$t2, -1
loop2:	sll $s2, $s1, 2
	addu $s3, $s2, $t1

	lw $s4, 0($s3)
	sw $s4, 4($s3)

	beq $s1, $t6, first
	addiu $s1, $s1, -1
	j loop2


first: sw $a0, 0($a1)
	jr $ra 

end:	jal imprime
	li $v0, 10
	syscall

imprime:
	la $t1, B
	addu $t2, $zero, $zero
loop3:
	sll $t3, $t2, 2
	addu $t4, $t3, $t1
	lw $s0, 0($t4)
	li $v0, 1
        move $a0, $s0
        syscall
	addiu $t2, $t2, 1
	bne $t2, 10, loop3

	jr $ra
