TeamPointsText:						; mesarea = team record Y's points (+$A)
	lda.w $000A,y
	jsr.w BinToBCD
	jmp.w BCDText
