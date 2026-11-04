SimGoalLimit:						; a simulated game's goal limit for team A: a random number below a byte
									; of its team data, divided by 10, plus 4
	asl a
	tax
	lda.l $C30000,x
	tax
	adc.l $C30006,x
	tax
	lda.l $C30004,x
	and.w #$00FF
	jsl.l RandomBelowA
	sta.l WRDIVL
	lda.w #$000A
	sta.l WRDIVB
	inx
	inx
	inx
	inx
	clc
	tyx
	lda.l RDDIVL
	adc.w #$0004
	rts
