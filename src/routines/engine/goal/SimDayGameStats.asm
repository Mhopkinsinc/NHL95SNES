SimDayGameStats:					; fills the stats of each of the day's computer games: both teams' totals
									; from their goals (SimTeamTotals), then the players' stats
	pea.w $7E7F
	lda.w DayGameCount
	sta.b tmp0
	lda.l SRDayPlayed
	sta.b tmp2
	plb
	ldy.w #$8EF8
.1:									; tmp2 / 2, if carry clear go to .2, go to .4
	lsr.b tmp2
	bcc .2
	jmp.w .4
.2:									; if $0000,y = 0 go to .3, go to .4
	lda.w $0000,y
	beq .3
	jmp.w .4
.3:									; X = Y, $0034,y = $0008,y, call SimTeamTotals, A = Y, ...
	tyx
	lda.w $0008,y
	sta.w $0034,y
	jsr.w SimTeamTotals
	tya
	clc
	adc.w #$0016
	tax
	lda.w $000A,y
	sta.w $001E,y
	jsr.w SimTeamTotals
	lda.w $0024,y
	sta.w $0020,y
	lda.w $000E,y
	sta.w $0036,y
	phy
	lda.w $0002,y
	sta.l VisTeam
	lda.w $0004,y
	sta.l HomeTeam
	pei ($9F)
	pei ($A1)
	pei ($A3)
	pea.w $7F7E
	plb
	jsl.l RestoreWorkBuf
	jsr.w LoadGameRosters
	ldy.w #HomeRoster
	jsl.l BuildTeamLinesPreserveTemps
	ldy.w #VisRoster
	jsl.l BuildTeamLinesPreserveTemps
	plb
	pla
	sta.b tmp2
	pla
	sta.b tmp1
	pla
	sta.b tmp0
	lda.b $01,s
	clc
	adc.w #$003A
	tax
	inc a
	tay
	stz.w $0000,x
	lda.w #$00CE
	mvn $7F,$7F
	lda.w #VisRoster
	sta.b p0
	lda.w #$007E
	sta.b p0+2
	lda.b $01,s
	tay
	adc.w #$001A
	tax
	jsr.w SimPlayerStats
	lda.w #HomeRoster
	sta.b p0
	lda.b $01,s
	clc
	tax
	adc.w #$0016
	tay
	jsr.w SimPlayerStats
	ply
.4:									; A = Y, A + $010A, Y = A, tmp0 - 1, ...
	clc
	tya
	adc.w #$010A
	tay
	dec.b tmp0
	beq .5
	jmp.w .1
.5:									; return
	plb
	rts
