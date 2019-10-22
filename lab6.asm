.data
first: .asciiz "Enter the first number: "
second: .asciiz "Enter the second  number: "
error: .asciiz "Try Again!\n"
sum: .asciiz "Sum of integers: "
.text
main:
#first number
li $v0, 4
la $a0, first
syscall

li $v0, 5
syscall
move $t0, $v0

#second number
li $v0, 4
la $a0, second
syscall

li $v0, 5
syscall
move $t1, $v0

li $t2, 2147483647
li $t3, -2147483648
bgt $t0, $t2, tryagain
blt $t0, $t3, tryagain
bgt $t1, $t2, tryagain
blt $t1, $t3, tryagain

#multiplying
add $t4, $t1, $t0
bgt $t4, $t2, tryagain
blt $t4, $t3, tryagain


#printing
li $v0, 4
la $a0, sum
syscall

li $v0, 1
move $a0, $t4
syscall

.ktext 0x80000180
la $k0, main
li $v0, 4
la $a0, error
syscall
mtc0 $k0, $14
eret
.kdata

tryagain:
li $v0, 4
la $a0, error
syscall
j main


