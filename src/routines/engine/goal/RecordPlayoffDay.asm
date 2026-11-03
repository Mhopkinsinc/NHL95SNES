RecordPlayoffDay:					; adds each of the day's playoff results to its series wins at SRPOWins
									; (+1 home, +$10 away; a series starts at 3-3 when SRBestOfSeven is 0) and
									; moves a team that reaches 4 wins on a round, then the playoff day + 1
	lda.w DayGameCount
	sta.b tmp0
	pea.w $7E7F
	plb
	ldy.w #$8EF8
.1:									; X = $0038,y, A 8-bit, ...
	ldx.w $0038,y
	sep #$20
	lda.l SRBestOfSeven
	bne .2
	lda.b #$33
	sta.l SRPOWins,x
.2:									; A 16-bit, if carry clear go to .3, A = $0001
	rep #$20
	lda.w $000A,y
	cmp.w $0008,y
	lda.w #$0010
	bcc .3
	lda.w #$0001
	clc
.3:									; A 8-bit, A + SRPOWins,x, SRPOWins,x = A, if A < $0040 go to .4, ...
	sep #$20
	adc.l SRPOWins,x
	sta.l SRPOWins,x
	rep #$21
	cmp.w #$0040
	bcc .4
	lda.w $0002,y
	jsr.w AdvancePlayoffTeam
	bra .5
.4:									; A and $000F, if A < $0004 go to .5, A = $0004,y, call AdvancePlayoffTeam
	and.w #$000F
	cmp.w #$0004
	bcc .5
	lda.w $0004,y
	jsr.w AdvancePlayoffTeam
.5:									; A = Y, A + $010A, Y = A, tmp0 - 1, ...
	tya
	adc.w #$010A
	tay
	dec.b tmp0
	bne .1
	plb
	jsr.w AddPlayoffDayPlayerStats
	lda.l SRPODay
	inc a
	sta.l SRPODay
	jml.l ReturnToLeagueMenu
