TeamGoalieRange:					; team record A: tmp3 = the PlayerList index of its first player, $0A =
									; the
									; index after its goalies (GetGoalieCountD7)
	tax
	lda.l $C30000,x
	and.w #$07FF
	lsr a
	sec
	sbc.w #$001C
	sta.b tmp3
	txa
	jsr.w GetGoalieCountD7
	clc
	adc.b tmp3
	sta.b $0A
	rts
