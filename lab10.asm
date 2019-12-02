#Number of blocks: 1
#Cache block size: 32
#YOUR METRIC SCORE: 4646
#The reasons for my optimization
#In Assembly code: performance improvement and reducing time consuming
#In the configurations of cache parameters: program used miinimum bloack and block size, thus, cache size is 128
.data
array: .space 1024
.text
main: 
la $a0, array
addi $a1, $zero, 1024 #size is 1024
addi $a2, $zero, 4

jal upd
#exit
li $v0, 10
syscall

upd:
add $s0, $zero, 0

beq $a2, 1, for
beq $a2, 4, for2

for2:
beq $s0, $a1, exit

add $t1, $s0, $a0
lw $t2, 0($t1)
add $t2, $t2, 16843009
sw  $t2, 0($t1)
addi $s0, $s0, 4

j for2

for: 
beq $s0, $a1, exit
add $t1, $s0, $a0
lb $t2, 0($t1)

add $t2, $t2, $a2
sb $t2, 0($t1)
addi $s0, $s0, 1

j for

exit:
jr $ra
