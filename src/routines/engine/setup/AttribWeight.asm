AttribWeight:						; TeamRosterScreen's weight column: the attribute (CalcRosterAttrib) * 8 +
									; 140
	jsr.w CalcRosterAttrib
	asl a
	asl a
	asl a
	adc.w #$008C
	jsr.w BinToBCD
	jsr.w BCDText
	ldy.b a2+2
	ldx.w #mesarea
	jsl.l PrintBoldCentredStr
	rts
