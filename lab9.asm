.data
	START: .asciiz "Degree: "
	DEGREE: .double 180.0
	PI: .double 3.14159265359
	zero: .double 0
	negative: .double -1.0
	pos: .double 1.0
.text
main:
	li $v0, 4
	la $a0, START
	syscall
	li $v0, 7
	syscall
	
	j cos
cos:
	l.s $f8, negative
	jal deginrad
	j out
deginrad:
	l.s $f28,PI
	l.s $f30,DEGREE

	jr $ra
fact:
	l.s $f4, pos
	li $a1,1
	addi $a0,$a0,1
	jr $ra
	
out:
	li $v0,3
	l.s $f1, zero

	l.s $f2 ,pos

	syscall
	
	li $v0, 10
	syscall
