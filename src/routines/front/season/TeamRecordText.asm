TeamRecordText:						; mesarea = team record Y's wins, losses and ties (+4, +6, +8), $3E
									; between them
	phy
	lda.w $0004,y
	jsr.w BinToBCD
	jsr.w BCDText
	lda.w #$003E
	sta.w mesarea,x
	inx
	lda.w $0006,y
	phx
	jsr.w BinToBCD
	plx
	jsr.w BCDTextAt
	lda.w #$003E
	sta.w mesarea,x
	inx
	lda.w $0008,y
	phx
	jsr.w BinToBCD
	plx
	jsr.w BCDTextAt
	ply
	rts
