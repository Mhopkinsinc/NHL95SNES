PrintPenaltyHead:					; prints column title X bold, centred between $CF and $D1 on row 15, then
									; $CF = $D1
	ldy.w #$000F
	jsl.l PrintBoldCentred
	lda.b $D1
	sta.b $CF
	rts
