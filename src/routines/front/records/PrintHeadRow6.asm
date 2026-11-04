PrintHeadRow6:						; prints text X bold, centred between $CF and $D1 on row 6, then $CF = $D1
	ldy.w #$0006
	jsl.l PrintBoldCentred
	lda.b $D1
	sta.b $CF
	rts
