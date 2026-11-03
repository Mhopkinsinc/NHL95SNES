StatColPenMin:						; PlayerStatColumn's penalty minutes column (ppenmin)
	plx
	lda.w ppenmin,x
	and.w #$00FF
	rts
