RestoreDayScores:					; puts the scores of the day's games already played (SRDayPlayed) back
									; into the day's game records from SRDayScores, marked done
	phb
	lda.l $7E2C42
	sta.b tmp0
	lda.l SRDayPlayed
	sta.b tmp1
	pea.w $7E7F
	plb
	ldy.w #$8EF8
	ldx.w #$0000
.loop:								; loop: tmp1 / 2, if carry clear go to .1, $0000,y = $0000, A - 1, ...
	lsr.b tmp1
	bcc .1
	lda.w #$0000
	sta.w $0000,y
	dec a
	sta.w $0006,y
	lda.l SRDayScores,x
	and.w #$00FF
	sta.w $000A,y
	lda.l SRDayScores+1,x
	and.w #$00FF
	sta.w $0008,y
.1:									; X + 1, X + 1, A = Y, A + $010A, ...
	inx
	inx
	tya
	clc
	adc.w #$010A
	tay
	dec.b tmp0
	bne .loop
	plb
	plb
	rts
