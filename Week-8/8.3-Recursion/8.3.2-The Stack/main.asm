
.text
.globl main

# Function: f
# Purpose: f(a, b) = a + g(b, g(a, b))
# Arguments: $a0 - a $a1 - b
# Returns: $v0: The result of the calculation
f:
	# Calculate g(a, b)
	# We need to provide g with two arguments
	# but if we load values into a0 and a1, we lose the original a and b
	
	addi $sp, $sp, -12	# Make 4 bytes of room in the stack
	sw $ra, 0($sp)		# Store the return address on the stack
	sw $a0, 4($sp)		# Store the first argument (a)
	sw $a1, 8($sp)		# Store the second argument (b)
		
	# Calculate g(a, b)
	jal g
	
	#v0 stores g(a, b)
	# so we need to calculate g(b, v0)
	lw $a0, 8($sp)
	move $a1, $v0

	jal g
	
	# Now v0 holds the second part of the equation
	# so we need to compute a + v0 and return that
	lw $a0, 4($sp)
	add $v0, $v0, $a0
	
	
	
	lw $ra, 0($sp)		# Load the return address from the stack
	addi $sp, $sp, 12	# Restore the stack space (free the stack)
	
	jr $ra
	
	
	

# Function: g
# Purpose: Adds two numbers
# Arguments: $a0 - first number $a1 - second number
# Returns: $v0: a + b
g:
	add $t0, $a0, $a1
	move $v0, $t0
	jr $ra

# Call the function f
main:
	li $a0, 5
	li $a1, 10
	
	jal f
	
	# Save the result in s0
	move $s0, $v0
	
	# f = a + g(b, g(a, b))
	# f = 5 + 10 + (5 + 10)



