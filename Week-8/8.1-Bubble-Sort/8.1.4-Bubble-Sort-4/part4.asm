# Program that defines an array and prints out each element
.data
	array: .word 25, 10, 6, 15, 22	# Example array to sort
	size: .word 5					# Size of the array
	space: .asciiz " "				# Space so we can print spaces out
	
.text

main:
	# Setup
	lw $t1, size		# Load array size into t1
	addi $t1, $t1, -1	# size -= 1, so that we only go to the second-to-last element
	li $t6, 0			# i = 0
	
	outer_loop:			# Runs n - 1 times
		beq $t6, $t1, outer_loop_end	# If i == n - 1 exit the outer loop
		
		li $t2, 0			# j = 0
		la $t0, array		# Load array address into t0
		
		li $t7, 0		# Register that stores whether a swap has taken place (1 is false)
			
		# Inner j loop
		loop:
			beq $t1, $t2, loop_end 	# if i == size of array, then exit loop
		
			lw $t3, ($t0)	# Load array[i]
			lw $t4, 4($t0)	# Load array[j + 1]
		
			slt $t5, $t4, $t3	# if (array[j + 1] < array[j], t5 = 1), 
		
			beq $t5, $zero, skipSwap
				sw $t3, 4($t0)		# Array[j] = array[j + 1]
				sw $t4, ($t0)		# Array[j + 1] = array[j]
				li $t7, 1			# If a swap has taken place, record it here
			skipSwap:
		
		
			# Increment i and base address
			addi $t0, $t0, 4	# address += 4
			addi $t2, $t2, 1	# j += 1
		
			j loop		# Jump to top of loop
	
		loop_end:
		
		addi $t6, $t6, 1	# i += 1
		
		# Before we jump back, if no swap has taken place, then just end the loop
		beq $t7, $zero, outer_loop_end
		
		j outer_loop
		
	outer_loop_end:
	
	exit:
		li $v0, 10		# Syscode for program termination
		syscall
	
