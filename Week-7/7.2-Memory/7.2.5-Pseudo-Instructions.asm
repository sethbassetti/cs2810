.data

	myVar: .word 128
	array: .word 5, 10, 15, 20, 25
	
.text

	# Core Instructions
	lw $t0, ($zero)		# load myVar into t0
	addi $t1, $zero, 8
	lw $t1, ($t1)		# load array[1] into t1
	
	# Pseudo-Instructions
	lw $t0, myVar 		# load myVar into t0
	la $t1, array		# load the address of array[0] into t1
	lw $t2, array+4		# load array[1] into t2
	