# Replicates the following code in assembly
# if (i == j):
#    h = i + j
# else:
#    h = i - j

# t1 = i, t2 = j, t3 = h

# If they are not equal, go to the else statement
bne $t1, $t2, DoElse
	add $t3, $t2, $t1
	# Make sure to skip the else statement after adding
	j SkipElse
DoElse:
	sub $t3, $t1, $t2
SkipElse: