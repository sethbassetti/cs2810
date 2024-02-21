.data
	array: .word 5, 10, 6, 20, 30
	arrayLen: .word 5
	newline: .asciiz "\n"
	threshold: .word 10
	
.text
	# Load the address of the array into t0
	la $t0, array
	
	lw $t1, arrayLen
	lw $t2, threshold
	li $t3, 0 # This will be our loop variable
	
	Loop:
		# Check for our loop condition
		beq $t3, $t1, Exit
		
		# Load the current array value
		lw $t5, ($t0)
		
		# If the array value is greater than the threshold, print
		ble $t5, $t2, Skip
		
			# First print the integer
			li $v0, 1
			move $a0, $t5
			syscall
			
			# Then print the newline
			la $a0, newline
			li $v0, 4
			syscall
			
		Skip:
		addi $t3, $t3, 1	# i -> i + 1
		addi $t0, $t0, 4	# Increment the address of our array
		j Loop
		
		
	Exit:
	