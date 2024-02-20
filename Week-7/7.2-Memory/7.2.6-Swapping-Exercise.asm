.data

	array: .word 5, 10, 15, 20, 25
	
	
.text 
	# Load the first element (with la instruction)
	la $t0, array
	lw $t0, ($t0)
	
	# Load the second element (with lw pseudo-instruction)
	lw $t1, array + 4
	
	# Swap them
	sw $t0, array + 4
	sw $t1, array
	
	
	