.data

	array: .word 5, 10, 15, 20
	arrayLen: .word 4
	
	arrayMsg: .asciiz "The sum of all elements is: "
	
.text
	
	la $t0, array
	lw $t1, arrayLen
	li $t2, 0			# Current index
	li $t3, 0			# Sum of all numbers
	
	loop:
		beq $t2, $t1, loopEnd	# Check our loop condition
		
		# Load the current element and add it
		lw $t4, ($t0)
		add $t3, $t3, $t4
		
		# Increment the index and address
		addi $t2, $t2, 1
		addi $t0, $t0, 4
		
		j loop	# Jump back to the top of the loop

	loopEnd:
	
	# Print the string out
	la $a0, arrayMsg	# Load the address of the string into a0
	li $v0, 4
	syscall
	
	# Print the message out
	move $a0, $t3	# Copies t3 into a0
	li $v0, 1
	syscall
	