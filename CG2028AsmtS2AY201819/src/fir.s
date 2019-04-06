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
@R3 - <use(s)>
@R4 - <use(s)>
@R5 - <use(s)>
@....

fir:
@ PUSH / save (only those) registers which are modified by your function
@ parameter registers need not be saved.

@ write asm function body here

@ prepare value to return (y_n) to C program in R0

@ POP / restore original register values. DO NOT save or restore R0. Why?

@ return to C program
		BX	LR

@label: .word value
.equ N_MAX, 10
@.lcomm label num_bytes
