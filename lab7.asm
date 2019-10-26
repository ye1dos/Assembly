.data
start: .asciiz "Enter the base: \n"
start2: .asciiz "Enter the exponent: \n"
num1: .word 0
num2: .word 0
finish: .asciiz "Result: \n"
num3: .word 0

.text
main:
#base input
li $v0, 4
la $a0, start
syscall

li $v0, 5
syscall
sw $v0, num1

#exponent input
li $v0, 4
la $a0, start2
syscall

li $v0, 5
syscall
sw $v0, num2

lw $a1, num2
add $a1, $a1, -1
lw $a0, num1

# function call
jal pow

sw $v0, num3
#printing result 
li $v0, 4
la $a0, finish
syscall
li $v0, 1
lw $a0, num3
syscall
li $v0, 10
syscall


pow:
addi $sp, $sp, -4
sw $ra, 0($sp)
bne $a1, $zero, loop
li $t0, 1
move $v0, $t0
jr $ra
loop:
addi $a1, $a1, -1
jal pow
lw $ra,0($sp)
mul $v0, $v0, $a0
addi $sp, $sp, 4
jr $ra







