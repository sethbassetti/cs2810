# Where all variables are defined
.data
	# Stores the value 52 over 4-bytes
	myVar: .word 52
	
	# Stores 6 bytes (5 characters and a null character) for Hello
	myString: .asciiz "Hello"
	
	# Reserves 8-words (64 bytes) worth of space
	emptyArray: .space 64
	
	# Stores 4 words contiguously in memory
	array: .word 5, 10, 15, 20
	

# Where all of the code goes
.text
	
	# Printing out 10
	li $v0, 1
	li $a0, 10
	syscall
	
	
	