.data
	DISPLAY: .space 16384 
	DISPLAYWIDTH: .word 64
	DISPLAYHEIGHT: .word 64
	COLOURS: .word 0xff0000, 0x0000ff, 0x00ff00, 0xffff4c, 0xbf3eff, 0xffb62f,0x00ffff,0x9400D3
        RAD: .word 15
        
.text
j main

set_pixel_color: 
	lw $t0, DISPLAYWIDTH
	mul $t0, $t0, $a1 	
	add $t0,$t0, $a0	
	sll $t0, $t0, 2 	
	la $t1, DISPLAY 	
	add $t1, $t1, $t0	
	sw $a2, ($t1) 		
	jr $ra 			

main:
	li $a0, 32        
	li $s2, 32    
	
	lw $s6, RAD
	
	sub $s5, $a0, $s6  
	add $s7, $a0, $s6  
		
	li $s3, 1  
	move $s4, $s5 

	for:
	   add $s4, $s4, $s3
	   beq $s4, $s5, exit
	   move $a0, $s4
	   
	   mul $t8, $s6, $s6
	   
	   bgt $s2, $s4, for1
	   sub $t9,  $s4, $s2
	   j for2
	   
	   for1:
	   sub $t9,  $s2, $s4
	   
	   for2:
	   mul $t9, $t9, $t9
	   
	   sub $t8,$t8,$t9
	  
	   mtc1 $t8, $f1
	   cvt.s.w $f1,$f1
	   sqrt.s $f1,$f1
	   round.w.s $f1, $f1
	   mfc1 $a1, $f1
	   
	   beq $s3, -1, for3
	   sub $a1, $s2, $a1
	   j for4
	   for3:
	    	add $a1, $s2, $a1
	   for4:
	   add $s4, $s4, $s3
	   lw $a2, COLOURS
	   
	   jal set_pixel_color
	   j for
	   
	exit:
	li $v0,10
	syscall  
	
	
	    
	
