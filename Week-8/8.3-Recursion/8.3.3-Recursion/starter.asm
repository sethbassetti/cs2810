.text
.globl main


# Function: factorial
# Purpose: Calculates the factorial of a given number n recursively
# Arguments: a0 - n (the number to calculate the factorial of)
# Returns: $v0 - Factorial of n. If n == 1, returns 1; otherwise returns n * factorial(n - 1)
factorial:

	# Base Case: if a0 == 1, return 1.
	# To do this, load 1 into v0 and return to the caller with $ra
	
	# Recursive case: Calculate factorial for n > 1
	# Before the recursive call, save the current state to the stack
	# Save the return address ($ra) and current value of n ($a0) on the stack
	
	# Prepare for the recursive call by decrementing $a0 for factorial(n - 1)
	# Make the recursive call to calculate factorial(n - 1)
	
	# After returning from the recursive call, restore the saved state
	# Restore $a0 and $r0 from the stack
	# Calculate the factorial for the current n by multiplying n with the result from the recursive call
	# Use the instruction `mul $dest, $src1, $src2` to multiply two numbers
	
	# Finally, return the result and remember to restore the stack pointer


main:
	li $a0, 5		# Load 5 into a0
	jal factorial	# Calls factorial(5)
	
	# Prints out the result of the function
	move $a0, $v0
	li $v0, 1
	syscall