TeamShotsAvgText:					; mesarea = team record Y's shots a game (+$1A, in hundredths) as a
									; decimal
	lda.w $001A,y
	jsr.w BinToBCD
	sta.b r2
	xba
	and.w #$00FF
	jsr.w BCDText
	lda.w #$003D
	sta.w mesarea,x
	inx
	lda.b r2
	and.w #$00F0
	lsr a
	lsr a
	lsr a
	lsr a
	jsr.w BCDTextAt
	lda.b r2
	and.w #$000F
	jmp.w BCDTextAt
