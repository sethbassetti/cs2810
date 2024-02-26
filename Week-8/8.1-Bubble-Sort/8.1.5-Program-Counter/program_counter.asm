.data
	a: .word 10
	b: .word 28
	c: .word 57
	
	hello: .asciiz "Hello World"
	
	
.text
	exit:
		li $v0, 10
		syscall
		
	print_hello:
		li $v0, 4
		la $a0, hello
		syscall
		