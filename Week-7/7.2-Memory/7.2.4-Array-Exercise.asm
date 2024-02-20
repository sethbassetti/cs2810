.data

	array: .word 5, 10, 20, 30, 50
	
	c: .space 4
	
	
.text
	# Load the first and last elements
	lw $t0, ($zero)
	lw $t1, 16($zero)
	
	# Add them together
	add $t0, $t0, $t1
	
	# Store the result into c
	sw $t0, 20($zero)