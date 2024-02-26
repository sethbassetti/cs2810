.data
	a: .word 28
	b: .word 50
	c: .word 16
	

.text 
	main:
	
		# We want to calc sum of numbers from 0 - 5
		li $a0, 5
		
		jal sum
		move $s0, $v0
		
		li $a0, 10
		jal sum
		move $s1, $v0
		
		j exit
		
	
	sum:
		move $t0, $a0
		
		li $t1, 0	# i = 0
		
		li $t2, 0	# sum = 0
		# Initialize loop variables
		loop:
			beq $t1, $t0, loop_end	# Check loop condition
			
			add $t2, $t2, $t1		# sum = sum + i
			
			addi $t1, $t1, 1		# i += 1
			
			j loop					# Go to top of loop
			
		
		loop_end:
		move $v0, $t2
		jr $ra


	exit:
		li $v0, 10
		syscall