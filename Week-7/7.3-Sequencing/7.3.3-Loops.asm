# Replicates the following code in assemvly
# for (j=0; j<10; j++){
#    b = b + j
# }
# t5 = j; t6 = b

li $t5, 0		# t5 <- 0  (j)
li $t1, 10		# t1 <- 10 (to compare j < 10)
li $t6, 0		# t6 <- 0  (i)

# Start of loop
Loop:
	beq $t5, $t1, Exit	# If j == 10, exit
	add $t6, $t6, $t5	# b = b + j
	addi $t5, $t5, 1	# j += 1
	j Loop				# goto Loop

Exit: