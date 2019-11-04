.data
	str: .space 100
.text
main:
	la $a0, str
	li $a1, 100
	li $v0, 8
	syscall

	li $t0, 0
	li $t1, 2
	li $t4, 0
	
loop:
	lb $t5, str($t0)
	beq $t5, $t4, exit

	rem $t2, $t0, $t1
	
	beq $t2, $t4, skip_print
	
	lb $a0, str($t0)
	li $v0, 11
	syscall

skip_print:
	addi $t0, $t0, 1	
	j loop

exit:
	li $v0, 10
	syscall
