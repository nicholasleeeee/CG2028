 	.syntax unified
 	.cpu cortex-m3
 	.thumb
 	.align 2
 	.global	fir
 	.thumb_func

@ CG2028 Assignment, Sem 2, AY 2018/19
@ (c) CG2028 Teaching Team, ECE NUS, 2019

@Register map
@R0 - N, returns y
@R1 - b
@R2 - x_n
@R3 - y_n
@R4 - b_store
@R5 - j
@R6 - counter
@R7 - x_store

@R3 - <use(s)>
@R4 - <use(s)>
@R5 - <use(s)>
@....
j_value:
		.word 0
fir:

@ PUSH / save (only those) registers which are modified by your function
	PUSH {R1-R10}

@ parameter registers need not be saved.

@ write asm function body here

	LDR R4, [R1], #4 // Loads value of b into R4
	MUL R3, R2, R4
	LDR R5, j_value
	CMP R5, R0

LOOP: //for(j=0; j<N; j++)
	ADDS R5, #1
	MLA R3, R4, R7, R3 //y_n= y_n + b[j+1]*x_store[j];
	BLT LOOP


@ prepare value to return (y_n) to C program in R0

@ POP / restore original register values. DO NOT save or restore R0. Why?

@ return to C program
		BX	LR

@label: .word value
.equ N_MAX, 10
@.lcomm label num_bytes
