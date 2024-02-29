
.text
.globl main	# Make sure Settings> Initialize program counter to main if defined is checked

# Function: f
# Purpose: f(a, b) = g(b, 2) - a + b
# Arguments: $a0 - a $a1 - b
# Returns: $v0: The result of the calculation
f:
	# Allocate space for stack pointer
	addi $sp, $sp, -12
	sw $ra, 0($sp)	# return address
	sw $a0, 4($sp)	# a
	sw $a1, 8($sp)	# b
	
	# Calculate g(b, 2)
	lw $a0, 8($sp)	# Load b into a0
	li $a1, 2		# Load 2 into a1
	
	jal g			# g(b, 2)
	
	# Rest of the equation
	lw $t0, 4($sp)		# Load a into t0
	sub $v0, $v0, $t0	# g(b,2) - a
	
	lw $t0, 8($sp)		# Load b into t0
	add $v0, $v0, $t0	# (g(b, 2) - a) + b
	
	# Return and free stack
	lw $ra, 0($sp)		# Load the saved return address into ra
	
	addi $sp, $sp, 12	# Restore the stack pointer
	jr $ra				# Return to the return address
	
	

# Function: g
# Purpose: Subtracts two numbers
# Arguments: $a0 - first number $a1 - second number
# Returns: $v0: a - b
g:
	sub $v0, $a0, $a1	# a0 - a1 is stored in v0
	jr $ra				# jump to the return address register


# Call the function f
main:
	li $a0, 20
	li $a1, 15
	
	jal f
	
	# When done correctly v0 should store 8
	
	



