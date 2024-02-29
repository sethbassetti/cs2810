	.text
.globl main
	
	# f(a, b) = a + b - 3
	# Arguments: $a0 - a, $a1 - b
	# Return: $v0 - Result of calculation
	f:
		add $t0, $a0, $a1	# a + b
		addi $t1, $t0, -3	# (a + b) - 3
		move $v0, $t0		# store return value in v0
		
		jr $ra	# Jump back to address stored in $ra

	main:
	
		li $a0, 5	# Load argument 1
		li $a1, 10	# Load argument 2
		jal f		# Jump to f and store address for next line in $ra
		
		# We can't store in t registers, since function might clobber them
		# So, we store in s registers
		move $s0, $v0
		
		
		li $a0, 20	# load argument 1
		li $a1, 2	# load argument 2
		jal f		# Jump to f and store address for next line in $ra
		
		move $s1, $v0	# Store return value in s1
	
		
	