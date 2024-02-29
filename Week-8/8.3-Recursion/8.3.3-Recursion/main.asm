.text
.globl main


# Function: factorial
# Purpose: Calculates the factorial of a given number n recursively
# Arguments: a0 - n (the number to calculate the factorial of)
# Returns: $v0 - Factorial of n. If n == 1, returns 1; otherwise returns n * factorial(n - 1)
factorial:

	# Base Case: if a0 == 1, return 1.
	# To do this, load 1 into v0 and return to the caller with $ra
	li $t0, 1
	bne $a0, $t0, recursiveCase
		li $v0, 1
		jr $ra
	recursiveCase:
	
	# Recursive case: Calculate factorial for n > 1
	# Before the recursive call, save the current state to the stack
	# Save the return address ($ra) and current value of n ($a0) on the stack
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	
	# Prepare for the recursive call by decrementing $a0 for factorial(n - 1)
	# Make the recursive call to calculate factorial(n - 1)
	addi $a0, $a0, -1
	jal factorial
	
	# After returning from the recursive call, restore the saved state
	# Restore $a0 and $r0 from the stack
	# Calculate the factorial for the current n by multiplying n with the result from the recursive call
	# Use the instruction `mul $dest, $src1, $src2` to multiply two numbers
	lw $a0, 4($sp)
	lw $ra, 0($sp)
	mul $v0, $a0, $v0
	
	# Finally, return the result and remember to restore the stack pointer
	addi $sp, $sp, 8
	jr $ra


main:
	li $a0, 5		# Load 5 into a0
	jal factorial	# Calls factorial(5)
	
	# Prints out the result of the function (should print 120)
	move $a0, $v0
	li $v0, 1
	syscall