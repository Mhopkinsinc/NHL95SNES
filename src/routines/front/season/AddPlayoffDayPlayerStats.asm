AddPlayoffDayPlayerStats:			; adds both teams' player goals and assists from each playoff game to save
									; RAM
	lda.w DayGameCount
	sta.b tmp0
	pea.w $7E7F
	plb
	ldy.w #$8EF8
.loop:								; loop: push Y, A = $0004,y, call AddPlayoffTeamPlayerStats, pull Y, ...
	phy
	lda.w $0004,y
	jsr.w AddPlayoffTeamPlayerStats
	ply
	phy
	lda.w $0002,y
	tax
	tya
	clc
	adc.w #$001A
	tay
	txa
	jsr.w AddPlayoffTeamPlayerStats
	ply
	clc
	tya
	adc.w #$010A
	tay
	dec.b tmp0
	bne .loop
	plb
	rts
