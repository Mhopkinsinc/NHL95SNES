AddPlayoffTeamPlayerStats:			; adds a team's game player goals and assists to the packed playoff totals
	ldx.w #$000F
	sep #$20
.loop:								; loop: if A = SRPOTeams,x go to .1, X - 1, ...
	cmp.l SRPOTeams,x
	beq .1
	dex
	bpl .loop
	inx
.1:									; A 16-bit, A = X, A * 2, X = A, ...
	rep #$20
	txa
	asl a
	tax
	lda.l PlayoffStatBitOffsets,x
	sta.b tmp2
	lda.w #$0018
	sta.b tmp1
.loop2:								; loop: A = $003A,y, A and $00FF, tmp3 = A, A = $006E,y, ...
	lda.w $003A,y
	and.w #$00FF
	sta.b tmp3
	lda.w $006E,y
	and.w #$00FF
	sta.b $0A
	lda.w #$FF80
	sta.b $0C
	eor.w #$FFFF
	sta.b $10
	lda.b tmp2
	lsr a
	lsr a
	lsr a
	tax
	lda.b tmp2
	and.w #$0007
	sta.b $0E
	dec.b $0E
	bmi .2
.loop3:								; loop: tmp3 * 2, $0A * 2, $10 * 2, $0E - 1, ...
	asl.b tmp3
	asl.b $0A
	sec
	rol.b $0C
	asl.b $10
	dec.b $0E
	bpl .loop3
.2:									; A = SRPOGoals,x, A and $10, A + tmp3, tmp3 = A, ...
	lda.l SRPOGoals,x
	and.b $10
	clc
	adc.b tmp3
	sta.b tmp3
	lda.l SRPOGoals,x
	and.b $0C
	ora.b tmp3
	sta.l SRPOGoals,x
	lda.l SRPOAssists,x
	and.b $10
	clc
	adc.b $0A
	sta.b $0A
	lda.l SRPOAssists,x
	and.b $0C
	ora.b $0A
	sta.l SRPOAssists,x
	clc
	lda.b tmp2
	adc.w #$0007
	sta.b tmp2
	iny
	dec.b tmp1
	bpl .loop2
	rts
