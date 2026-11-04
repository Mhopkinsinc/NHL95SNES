CopyBracketTeamBar:					; copies a team's two-row name bar into the bracket map
	phb
	sta.b tmp0
	asl a
	adc.b tmp0
	asl a
	asl a
	asl a
	asl a
	adc.w #unpackbuf&$FFFF
	tax
	tya
	adc.w #rinkmapbuf&$FFFF
	tay
	lda.w #$0017
	mvn $7F,$7E
	tya
	adc.w #$00B0
	tay
	lda.w #$0017
	mvn $7F,$7E
	plb
	rts
