.data
str: .space 256
nl: .asciiz "\n"
start2: .asciiz "Enter a string:\n"
finish: .asciiz "Reversed string:"
str2: .space 256
.text
main:
#printf("Enter a string: ");
li $v0, 4
la $a0 , start2
syscall
#getting String
li $v0, 8
li $a1, 256
la $a0, str
syscall

addi $s1, $zero, 0
addi $s2, $zero, 0
jal length
addi $s1, $zero, 0
addi $s4, $zero, 0
move $s2, $v0
move $s3, $a0
move $a0, $v0


#stop
#li $v0, 10
#syscall

#function
loop:
add $s4, $s3, $s1
lb $s5, 0($s4)

beq $s5, $zero, exit
addi $s1, $s1, 1
sb $s5, str2($s2)
addi $s2, $s2, -1
j loop

exit:
li $v0, 4
la $a0 , finish
syscall
la $a0, str2
li $v0, 4
syscall

li $v0, 10
syscall


#strlen
length:
add $s3, $a0, $s1
lb $s2, 0($s3)
beq $s2,$zero, exit_l
addi $s1, $s1, 1

j length

exit_l:
addi $s1, $s1, -1
move $v0, $s1
move $s1, $zero
jr $ra
