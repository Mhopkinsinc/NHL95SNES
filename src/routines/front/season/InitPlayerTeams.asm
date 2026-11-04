InitPlayerTeams:					; SRPlayerTeams from the team data: each player of teams $19 down to 0
									; gets his team (5 bits) and sweater number (7 bits)
	ldx.w #$0032
.1:									; tmp0 = X, A = $C30000,x, X = A, A = $C30000,x, ...
	stx.b tmp0
	lda.l $C30000,x
	tax
	lda.l $C30000,x
	tay
	xba
	and.w #$00F8
	lsr a
	lsr a
	lsr a
	sta.b tmp1
	tya
	and.w #$07FF
	tax
.2:									; tmp2 = X, A = X, A - $0038, tmp3 = A, ...
	stx.b tmp2
	txa
	sec
	sbc.w #$0038
	sta.b tmp3
	asl a
	adc.b tmp3
	lsr a
	lsr a
	tay
	lda.l $C30000,x
	and.w #$3FFF
	tax
	bcc .3
	lda.b tmp0
	asl a
	asl a
	asl a
	sta.b tmp3
	lda.l $C2FFFF,x
	and.w #$7F00
	asl a
	tsb.b tmp3
	lda.w SRPlayerTeams&$FFFF,y
	and.w #$000F
	bra .4
.3:									; A = tmp0, A / 2, tmp3 = A, A = $C2FFFF,x, ...
	lda.b tmp0
	lsr a
	sta.b tmp3
	lda.l $C2FFFF,x
	and.w #$7F00
	lsr a
	lsr a
	lsr a
	tsb.b tmp3
	lda.w SRPlayerTeams&$FFFF,y
	and.w #$F000
.4:									; A or tmp3, SRPlayerTeams&$FFFF,y = A, X = tmp2, X + 1, ...
	ora.b tmp3
	sta.w SRPlayerTeams&$FFFF,y
	ldx.b tmp2
	inx
	inx
	dec.b tmp1
	bne .2
	ldx.b tmp0
	dex
	dex
	bpl .1
	rts
