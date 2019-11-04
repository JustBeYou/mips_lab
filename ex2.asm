.data
	n: .word 0
.text
suma_gauss:
	subu $sp, 4
	sw $fp, 0($sp)
	addi $fp, $sp, 4

	li $t0, 1
	lw $t1, 0($fp)
	li $v0, 0

loop:
	bge $t0, $t1, ret
	add $v0, $v0, $t0
	add $t0, $t0, 1
	j loop

ret:
	lw $fp, 0($sp)
	addu $sp, 4
	jr $ra

main:
	li $v0, 5
	syscall
	move $t0, $v0

	subu $sp, 4
	sw $t0, 0($sp)	
	jal suma_gauss
	addu $sp, 4

	move $a0, $v0
	li $v0, 1
	syscall

	li $v0, 10
	syscall
