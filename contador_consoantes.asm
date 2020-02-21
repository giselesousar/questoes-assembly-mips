#Gisele de Sousa Ribeiro
#Lucas Danillo Barros Paz Soares

.data
	string: .asciiz "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
.text

	la $t0, string
	addu $t1, $zero, $zero
	addu $v0, $zero, $zero
	
loop:	addu $t2, $t1, $t0
	lb $a0, 0($t2)
	jal maiusculoInicio
	beq $a0, $zero, end	  
	addiu $t1, $t1, 1
	j loop	  
	
end: 	li $v0, 10
	syscall
	
maiusculoInicio:slti $t4, $a0, 0x42
	bne $t4, 1, maiusculoFim
	jr $ra


maiusculoFim:
	slti $t4, $a0, 0x5b
	beq $t4, 1, testaE
	j minusculoInicio
	
minusculoInicio:
	slti $t4, $a0, 0x62
	bne $t4, 1, minusculoFim
	jr $ra
minusculoFim:
	
	slti $t4, $a0, 0x7b
	beq $t4, 1, testae
	jr $ra
	
	
	
testaE: bne $a0, 0x45, testaI
	jr $ra
testaI: bne $a0, 0x49, testaO
	jr $ra
testaO: bne $a0, 0x4f, testaU
	jr $ra
testaU: bne $a0, 0x55, incrementaV1
	jr $ra
	
testae: bne $a0, 0x65, testai
	jr $ra
testai: bne $a0, 0x69, testao
	jr $ra
testao: bne $a0, 0x6f, testau
	jr $ra
testau: bne $a0, 0x75, incrementaV1
	jr $ra

incrementaV1:
	addiu $v1, $v1, 1
	jr $ra