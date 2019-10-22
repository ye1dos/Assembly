.data
Arr: .word 21,20,51,83,20,20
x: .word 20
y: .word 5
length: .word 6
index: .word 0
index2: .word 0
msg1: .asciiz "x="
msg2: .asciiz "y="
nl: .asciiz "\n"
space: .asciiz " "

.text
main:

la $s0, Arr
lw $s1, length
lw $s2, x
lw $s3, y
lw $s4, index
lw $s5 , index2

jal loop

li $v0, 4
la $a0, nl
syscall

li $s4, 0
li $s5, 0

jal begin_loop

li $s4, 0
li $s5, 0
jal loop

li $v0, 4
la $a0, nl
syscall
li $v0, 10
syscall

loop:
beq $s4	, $s1, exit_loop
sll $t3, $s4, 2

add $t3, $t3, $s0
lw $t6, 0($t3)
li $v0, 1
move $a0, $t6
syscall

li $v0, 4
la $a0, space
syscall
addi $s4, $s4, 1
j loop

begin_loop:
beq $s4, $s1 , exit_loop
sll $t3 , $s4 , 2
add $t3 , $t3 , $s0
lw $t6, 0($t3)

beq $t6, $s2, replace
addi $s4, $s4, 1
j begin_loop

exit_loop:
jr $ra

replace:
sw $s3, 0($t3)
addi $s4, $s4, 1
j begin_loop
