# Replicates the following code in assembly
# if (i == j):
#    h = i + j


# t1 = i, t2 = j, t3 = h

# If they are not equal, jump to the Skip label
bne $t1, $t2, Skip
	add $t3, $t2, $t1
Skip: