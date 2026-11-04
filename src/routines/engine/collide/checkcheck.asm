checkcheck:							; called from other segments
	pei ($8F)
	pei ($6B)
	pei ($6F)
	jsl.l CCStart
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
	jsl.l CCStart
	pla
	sta.b a3
	pla
	sta.b a2
	pla
	sta.b d4
	ldx.b a3
CheckContactReturn:					; return from the player contact check
	rtl
