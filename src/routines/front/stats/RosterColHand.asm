RosterColHand:						; TeamRoster's shooting hand column: Left or Right by bit 0 of the
									; attribute (CalcRosterAttrib)
	jsr.w CalcRosterAttrib
	and.w #$0001
	asl a
	tax
	lda.l RosterStatusTexts+8,x
	tax
	ldy.b a2+2
	jsl.l PrintBoldCentred
	rts
