ShowPenaltyBoxes:					; the pause screen's penalty boxes from text row 13: the home team's list
									; (tmboxlist) at column 23, the away team's at column 1 (ShowPenaltyBox)
	lda.w #$0017
	sta.b tmp1
	lda.w #$01A0
	sta.b tmp2
	lda.w #$0000
	jsr.w ShowPenaltyBox
	lda.w #$0001
	sta.b tmp1
	lda.w #$01A0
	sta.b tmp2
	lda.w #$001A
	jsr.w ShowPenaltyBox
	jsl.l WaitTransfers
	rts
