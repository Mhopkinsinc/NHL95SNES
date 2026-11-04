SaveOptAwayPracPlayers:				; stores awaypracplayers in save RAM; with both teams at 0 players, gives
									; the home team 1 and redraws the Home Players line (the line above)
	lda.w awaypracplayers
	sta.l SRawaypracplayers
	bne .rts
	lda.w homepracplayers
	bne .rts
	inc a
	sta.w homepracplayers
	pei ($97)
	lda.w SetupLineRow
	pha
	dec a
	dec a
	sta.w SetupLineRow
	dec.b d6
	jsr.w DrawSetupLine
	jsr.w SetupLinePalette3
	pla
	sta.w SetupLineRow
	pla
	sta.b d6
.rts:								; return
	rts
