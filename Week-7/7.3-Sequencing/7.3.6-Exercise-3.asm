.data

	array: .word 5, 10, 15, 20
	arrayLen: .word 4
	
	evenMsg: .asciiz "The sum of all even elements is: "
	oddMsg: .asciiz "The sum of all odd elements is: "
	newline: .asciiz "\n"
	
.text
	
	la $t0, array
	lw $t1, arrayLen
	li $t2, 0			# Current index
	li $t3, 0			# Sum of all even numbers
	li $t7, 0			# Sum of all odd numbers
	
	loop:
		beq $t2, $t1, loopEnd	# Check our loop condition
		
		# Load the current element and add it
		lw $t4, ($t0)
		
		# AND with 1 of an even number gives you
		andi $t5, $t4, 1
		
		# If the number is even, add it to even register
		bne $t5, $zero, else
			add $t3, $t3, $t4
			j skipElse	# Skip over the else
		else:
			add $t7, $t7, $t4
		
		skipElse:
		
		
		# Increment the index and address
		addi $t2, $t2, 1
		addi $t0, $t0, 4
		
		j loop	# Jump back to the top of the loop

	loopEnd:
	
	# Print the string out
	la $a0, evenMsg	# Load the address of the string into a0
	li $v0, 4
	syscall
	
	# Print the message out
	move $a0, $t3	# Copies t3 into a0
	li $v0, 1
	syscall
	
	# Print a newline in between
	la $a0, newline
	li $v0, 4
	syscall
	
	# Print the odd numbers
	la $a0, oddMsg
	li $v0, 4
	syscall
	
	move $a0, $t7
	li $v0, 1
	syscall

	exit:
	li $v0, 10
	syscall
	