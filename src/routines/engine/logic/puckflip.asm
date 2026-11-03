puckflip:							; called from other segments
	lda.b d0
	and.w #$0001
	sta.b d0
	eor.w facedir+28
	and.w #$0003
	sta.w facedir+28
	lda.w #$FFFF
	sta.w SPAcnt+28
	phx
	ldx.w #$001C
	lda.w #SPApflip&$FFFF
	jsl.l SetSPAFromA
	plx
	rtl
