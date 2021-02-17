.globl main 
#Beaverly Cuasi S15

.macro NEWLINE
li a0, 10
li a7, 11
ecall
.end_macro

.data
string: .asciz "Summation Final: "
term: .asciz "Term "
space: .asciz ": "
n: .byte 5
num: .float -1.0
num2: .float -1.0
denom1: .float 1.0
denom2: .float 2.0
x: .float 5 #radian

.text

###############################################################

main:

la t1, x
la t2, denom2
la t3, n
la t4, num
la t5, num2
la t6, denom1

###############################################################
	
flw f1, (t1) #x 
flw f4, (t4) #numerator
flw f5, (t5) #numerator2
flw f6, (t6) ##denom1 = 1.0
flw f2, (t2) #denom2 = 2.0

###############################################################
	
	fmv.s f30, f1
	lbu a1, (t3)  #n
	
	#LOOP1
	li s1, 0
	li s2, 1
	li s5, 1
	li s7, 0
	fcvt.s.wu f20, s7
	
	#n=+1
	addi a1,a1,1
	
###############################################################	

NUMERATOR:
	beq a1, s1, EXIT
	fmul.s f5, f5, f4 #numerator 
	fcvt.s.wu f3, s1 
	fmadd.s f0, f2, f3, f6 #2n+1
	fcvt.wu.s x10, f0 
	mv a2, x10 
	mv s3, x10 
	mv s4, x10 
	j FACTORIAL 

###############################################################

FACTORIAL: 
	beq s3, s2, DIVISION
	sub s4, s4, s2 
	mul a2, a2, s4 #factorial
	sub s3, s3, s2
	j FACTORIAL 
	
###############################################################

DIVISION:
	fcvt.s.wu f28, a2 
	fdiv.s f28, f5, f28 #num/denom
	fmadd.s f18,f2,f3,f6 #exponent multiply
	fcvt.wu.s s6, f18 
	j MULTIPLY

###############################################################

MULTIPLY:	
	beq s5, s6, PRINT 
	fmul.s f1, f30, f1
	addi s5, s5, 1
	j MULTIPLY

###############################################################

PRINT: 	
	fmul.s f19, f28, f1 
	
	li a7, 4
	la a0, term
	ecall
	
	
	li a7, 1
	mv a0, s1
	ecall
	
	
	li a7, 4
	la a0, space
	ecall
	
	
	li a7, 2
	fmv.s fa0, f19
	ecall
	
	
	fadd.s f20, f19,f20
	NEWLINE
	
	
	addi s1,s1,1
	j NUMERATOR
	
###############################################################	
	
EXIT:
	
	li a7, 4
	la a0, string
	ecall 
	
	
	li a7, 2
	fmv.s fa0, f20
	ecall
	
	
	li a7, 10
    	ecall
	
		
