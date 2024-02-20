.data

	a: .word 5
	b: .word 10
	c: .space 4
	
.text
	
	# Load a and b into registers
	lw $t0, ($zero)
	lw $t1, 4($zero)
	 
	# Add them and store in t0
	add $t0, $t0, $t1
	
	# Store back in c
	sw $t0, 8($zero)