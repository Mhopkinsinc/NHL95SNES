PrintPlayerStatsHeadings:			; Season Player Stats: the column headings (row 9) and the B hint (row
									; $18) for the list d0 is switching to: goalies when d0 is 0, else players
	pea.w $559D
	pea.w $55BD
	lda.b d0
	bne .1
	pla
	pla
	pea.w $55AD
	pea.w $55D7
.1:									; A = $0240, A + $D3, Y = $0040, call ClearRAM7E, ...
	clc
	lda.w #$0240
	adc.b $D3
	ldy.w #$0040
	jsl.l ClearRAM7E
	clc
	lda.w #$0600
	adc.b $D3
	ldy.w #$0040
	jsl.l ClearRAM7E
	lda.w #$0018
	sta.b $CF
	ldy.w #$0009
	plx
	jsl.l PrintBoldLeft
	ldy.w #$0018
	plx
	jsl.l PrintBoldLeft
	jsl.l WaitTransfers
	rts
