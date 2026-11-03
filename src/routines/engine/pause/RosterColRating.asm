RosterColRating:					; TeamRosterScreen's rating column: the attribute value (CalcRosterAttrib)
	jsr.w CalcRosterAttrib
	jsr.w BinToBCD
	jsr.w BCDText
	ldy.b a2+2
	ldx.w #mesarea
	jsl.l PrintBoldCentredStr
	rts
