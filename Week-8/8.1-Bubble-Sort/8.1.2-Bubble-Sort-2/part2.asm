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
	addi $t1, $t1, -1	# size -= 1, so that we only go to the second-to-last element
	li $t2, 0			# i = 0
	
	
	loop:
		beq $t1, $t2, loop_end 	# if i == size of array, then exit loop
		
		lw $t3, ($t0)	# Load array[i]
		lw $t4, 4($t0)	# Load array[i + 1]
		
		slt $t5, $t4, $t3	# if (array[i + 1] < array[i], t5 = 1), 
		
		beq $t5, $zero, skipSwap
			sw $t3, 4($t0)		# Array[i] = array[i + 1]
			sw $t4, ($t0)		# Array[i + 1] = array[i]
		skipSwap:
		
		
		# Increment i and base address
		addi $t0, $t0, 4	# address += 4
		addi $t2, $t2, 1	# i += 1
		
		j loop		# Jump to top of loop
	
	loop_end:
	
	exit:
		li $v0, 10		# Syscode for program termination
		syscall
	
