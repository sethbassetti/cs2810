.data
	a: .word 28
	b: .word 50
	c: .word 16
	

.text 
	main:
	
		# We want to calc sum of numbers from 0 - 5
		li $t0, 5
		
		
	sum:
		li $t1, 0	# i = 0
		
		li $t2, 0	# sum = 0
		# Initialize loop variables
		loop:
			beq $t1, $t0, loop_end	# Check loop condition
			
			add $t2, $t2, $t1		# sum = sum + i
			
			addi $t1, $t1, 1		# i += 1
			
			j loop					# Go to top of loop
			
		
		loop_end:
		
		
		

