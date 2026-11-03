pucknothing:						; from pucknorm_move and other segments
	lda.w SPAnum+28
	cmp.w #$0008
	bcc .1
	cmp.w #$0018
	bcs .1
	lda.w facedir+28
	eor.w #$0002
	sta.w facedir+28
.1:									; A = $0004, SPAnum+28 = 0, SPAcnt+28 = $FFFF, return
	lda.w #$0004
	tsb.w facedir+28
	stz.w SPAnum+28
	lda.w #$FFFF
	sta.w SPAcnt+28
	rtl
