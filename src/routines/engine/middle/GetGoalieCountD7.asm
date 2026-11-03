GetGoalieCountD7:					; A = the goalie count of the team record at X (A = X on entry): the used
									; nibbles of the word its +8 offset points at
	clc
	adc.l $C30008,x
	tax
	lda.l $C30000,x
	xba
	ldx.w #$0000
.loop:								; loop: X + 1, A * 2, A * 2, A * 2, ...
	inx
	asl a
	asl a
	asl a
	asl a
	bne .loop
	txa
	rts
