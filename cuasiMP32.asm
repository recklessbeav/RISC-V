.globl main
#Beaverly Cuasi S15
   
   		
.data
final: .asciz "Final answer: "
numerator: .word -1
denom1: .word 2
denom2: .word 1
xrad: .float 5
exp1: .word 2
exp2: .word 1
n: .word 1

.text

###############################################################

main:

li t0, -1 #base_numerator
li t1, 2  #denom1
li t2, 1
li t3, 22
li t4, 7
li t5, 180
li t6, 2 #exp1
li s0, 1 #exp2
li s1, 1 #exponent_n ;kung nagpalit to 
li a3, 1
li a4, 0 #checker loop
li a5, 1 #for subtraction
#li a6, 4 #for checking
li a7, 1 #for i
li s10, 1 #exponent sa x
li s4, 1 #final x_radian

###############################################################

#flw f0, 0(t3)
#flw f1, 0(t4)
#flw f2, 0(t5)

###############################################################


LOOP1:
	
	# while(exp != 0)
	# result *= base;
	# --exp
	#sub s1, s1, a5 #s1 is yung exponent 
	bne s1, a4, NumPower
	j END
	
NumPower:
	mul a3, t0, a3 #answer dito si a3 #(-1^n)
	
DenomFac:
	mul a6, t1, s1 #2n
	addi a6, a6, 1 #answer dito si a6 (2n+1)
	
	
Pre_Fac:
        ble a7, a6, Factorial
        j PreRadianPower
	
Factorial:
	
	# for (i = 1; i <= n; ++i) { N IS UR A6 #a7 is yung i
        # fact *= i;
        
        mul t2, t2, a7 #answer dito is t2
        addi a7, a7, 1 
        j Pre_Fac

PreRadianPower:
	
	mul s8, t6, s1 #2n 
	addi s10, s8, 1 #exponent is s10
	
	div a2, t3, t4 #pi is ft5
	div s3, t5, a2 #fa1 yung x
	
LOOP2:

	# while(exp != 0)
	# result *= base;
	# --exp
	
	bne s10, a4, RadianPower
	j Multiply_All
	
RadianPower:

	#fcvt.wu.s s3, fa1
	mul s4, s3, s4 #s4 yung final x 
	sub s10, s10, a5
	j LOOP2
	
Multiply_All:
	
	# (a3/t2)*s4
	
	div s7, a3, t2
	mul a0, s7, s4

###############################################################
END:
	ecall
	
