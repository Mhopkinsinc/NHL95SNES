SaveOptHomePracPlayers:				; stores homepracplayers in save RAM; with both teams at 0 players, gives
									; the visitors 1 and redraws the Visitor Players line (the next line)
	lda.w homepracplayers
	sta.l SRhomepracplayers
	bne .rts
	lda.w awaypracplayers
	bne .rts
	inc a
	sta.w awaypracplayers
	pei ($97)
	lda.w SetupLineRow
	pha
	inc a
	inc a
	sta.w SetupLineRow
	inc.b d6
	jsr.w DrawSetupLine
	jsr.w SetupLinePalette3
	pla
	sta.w SetupLineRow
	pla
	sta.b d6
.rts:								; return
	rts
