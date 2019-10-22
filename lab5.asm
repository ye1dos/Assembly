.data 
	array: .word 0 1
.text
main:
	la $s0, array
	lw $zero, 0($s0)
	lw $s1, 4($s0)
	
	add $t1, $zero, $s1
	sw $t1, 8($s0)
	
	add $t0, $s1 , $t1
	sw $t0, 12($s0)
	
	add $t1, $t0, $s1
	sw $t1, 16($s0)
	
	add $t3, $t0, $t1
	sw $t3, 20($s0)
	
	add $t5, $t1, $t3
	sw $t5, 24($s0)