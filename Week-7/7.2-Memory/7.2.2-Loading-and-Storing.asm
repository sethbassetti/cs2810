.data
	# Assume the address for myVar is zero
	myVar: .word 437
	
	# Assume the address for myOtherVar is 4 (since it is 4 bytes away)
	myOtherVar: .word 512
	
	# Declaring an empty two-element array
	# Assume the address here is 8
	array: .space 8
	
.text
	# Load the value of myVar into t0
	lw $t0, 0($zero)
	
	# Load the value of myOtherVar into t1 (using a 4-byte offset from address 0)
	lw $t1, 4($zero)
	
	# Load the address into a register
	li $t2, 8
	
	# Store the first element (no offset)
	sw $t0, 0($t2)
	
	# Store the second element (12 offsetted from 0)
	sw $t1, 12($zero)
	
	