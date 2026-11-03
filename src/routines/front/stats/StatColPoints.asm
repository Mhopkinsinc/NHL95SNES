StatColPoints:						; PlayerStatColumn's points column (tmgoals + tmassists)
	plx
	lda.w tmassists,x
	and.w #$00FF
	pha
	lda.w tmgoals,x
	and.w #$00FF
	clc
	adc.b $01,s
	plx
	rts
