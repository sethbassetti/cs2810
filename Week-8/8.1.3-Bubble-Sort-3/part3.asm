# Program that implements bubble sort properly

.data
	array: .word 10, 25, 6, 15, 22
	arrayLen: .word 5
	
.text
	
	# Counter variable for outer loop
	li $t7, -1 # counter loop to run the inner loop
	outer_loop:
		# Check whether we have ran this swap n - 1 times
		beq $t7, $t2, outer_loop_end
		
		# Load the base address and i and arrayLen into registers
		la $t0, array
		li $t1, 0
		lw $t2, arrayLen
	
		# Only loop up to the last element so subtract 1 from the length
		addi $t2, $t2, -1
	
	
		loop:
			# First, check the loop condition
			beq $t1, $t2, loop_end
		
			# Load i + 1
			addi $t3, $t0, 4
			
			# Load array[i] and array[i + 1]
			lw $t4, ($t0)
			lw $t5, ($t3)
		
			# Compare the elements with ble
			slt $t6, $t5, $t4
			beq $t6, $zero, SkipSwap
				# Swap the elements if they are out of order
				sw $t4, ($t3)
				sw $t5, ($t0)
		
			SkipSwap:
		
		
			# Increment the loop
			addi $t0, $t0, 4
			addi $t1, $t1, 1
		
		
			j loop
	
		
		loop_end:
		
		# Increment the outer loop counter
		addi $t7, $t7, 1
		j outer_loop
		
	outer_loop_end:
	