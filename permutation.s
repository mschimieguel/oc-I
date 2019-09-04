.data 
	vetor1:.word 5,2,1,4,3
	vetor2:.word 1,2,5,3,3
	n:.word 5
.text
	la x10,vetor1
	#lw x11,vetor2
	lw,x11,n
	#slli x5,x12,2 #x5 guarda o tamanho do vetor
	jal x1,sort
	mv x29,x10
	lw x30,0(x29)
	lw x31,8(x29)
	ecall
	jal zero,end


swap:
	#vetor e x10
	#pos k e x11
	#varivel temp e x5
	slli x6, x11, 2
	add x6,x10,x6
	lw 	x5,0(x6)
	lw x7,4(x6)
	sw x7,0(x6)
	sw x5,4(x6)
	jalr x0,0(x1)

sort:
	addi sp,sp, -20
	sw x1,16(sp)
	sw x22,12(sp)
	sw x21,8(sp)
	sw x20,4(sp)
	sw x19 ,0(sp)
	#vetor e x10 
	#tamanho n e x11
	#x19 e i
	#x20 e j 
	mv x21, x10
	mv x22, x11
	li x19, 0
for1tst:bge x19,x22,exit1
	addi x20,x19,-1
for2tst:blt x20,x0,exit2
	slli x5,x20,2
	add x5,x21,x5
	lw x6,0(x5)
	lw x7,4(x5)
	ble x6,x7,exit2
	mv x10,x21
	mv x11,x20
	jal x1,swap
	addi x20,x20,-1
	j for2tst
exit2:
	addi x19,x19,1
	j for1tst

exit1:
	lw x19,0(sp)
	lw x20,4(sp)
	lw x21,8(sp)
	lw x22,12(sp)
	lw x1,16(sp)
	addi sp,sp,20

	jalr x0,0(x1)


end:


