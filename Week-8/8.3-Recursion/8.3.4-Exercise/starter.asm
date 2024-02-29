
.text
.globl main # Make sure Settings> Initialize program counter to main if defined is checked

# Function: f
# Purpose: f(a, b) = g(b, 2) - a + b
# Arguments: $a0 - a $a1 - b
# Returns: $v0: The result of the calculation
f:
	

# Function: g
# Purpose: Subtracts two numbers
# Arguments: $a0 - first number $a1 - second number
# Returns: $v0: a - b
g:


# Call the function f
main:
	li $a0, 20
	li $a1, 15
	
	jal f
	
	# When done correctly v0 should store 8
	
	



