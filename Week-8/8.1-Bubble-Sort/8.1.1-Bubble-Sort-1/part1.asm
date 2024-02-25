# Program that defines an array and prints out each element
.data
	array: .word 25, 10, 6, 15, 22	# Example array to sort
	size: .word 5					# Size of the array
	space: .asciiz " "				# Space so we can print spaces out
	
.text

main:
	# Setup
	la $t0, array		# Load array address into t0
	lw $t1, size		# Load array size into t1
	li $t2, 0			# i = 0
	
	loop:
		beq $t1, $t2, loop_end 	# if i == size of array, then exit loop
		
		# print(array[i])
		li $v0, 1		# Syscall opcode for printing integer
		lw $a0, ($t0)	# Load array[i] into a0
		syscall	
		
		li $v0, 4		# Syscall opcode for printing a string
		la $a0, space	# Load address of space into a0
		syscall
		
		
		# Increment i and base address
		addi $t0, $t0, 4	# address += 4
		addi $t2, $t2, 1	# i += 1
		
		j loop		# Jump to top of loop
	
	loop_end:
	
	exit:
		li $v0, 10		# Syscode for program termination
		syscall
	