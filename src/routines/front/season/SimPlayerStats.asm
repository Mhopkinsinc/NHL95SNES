SimPlayerStats:						; spreads a simulated team's game totals over its players: the shots
									; shared out, each goal to a random skater (+$3A goals, +$A2 shots), then
									; the assists
	lda.w $000C,y
	sta.b tmp3
	lda.w $0020,y
	sta.b $0A
	lda.w $001E,y
	sta.b $0C
	stx.b $0E
	lda.b $09
	and.w #$FF00
	ldx.w #$0099
	jsl.l Mul16U
	sec
	lda.b $0A
	sbc.b r2+2
	sta.b $0A
	pei ($36)
	ldy.w #$0002
	lda.b [p0],y
	jsr.w RandomBelowA7E
	inc a
	sta.b r1
	lda.b $0A
	sta.b r2
	jsl.l Div16x8U
	sta.w SimTable+$6
	sta.w SimTable+$4
	sta.w SimTable+$2
	clc
	adc.l RDMPYL
	adc.b $01,s
	sta.w SimTable
	pla
	ldy.b $0E
	ldx.w #$0000
.loop:								; loop: $00A2,y = SimTable,x, X + 1, X + 1, Y + 1, ...
	lda.w SimTable,x
	sta.w $00A2,y
	inx
	inx
	iny
	dec.b r1
	bne .loop
	ldy.w #$0002
.loop2:								; loop: $0C - 1, if the result < 0 go to .1, if zero go to .1, ...
	dec.b $0C
	bmi .1
	beq .1
	lda.b [p0],y
	jsr.w RandomBelowA7E
	clc
	adc.b $0E
	tax
	inc.w $003A,x
	inc.w $00A2,x
	bra .loop2
.1:									; if tmp3 is not 0 go to .2, go to SimPlayerStatsReturn
	lda.b tmp3
	bne .2
	jmp.w SimPlayerStatsReturn
.2:									; Y = $0002, SimGroupStart = [p0],y, SimPickFirst = A, Y + 1, ...
	ldy.w #$0002
	lda.b [p0],y
	sta.w SimGroupStart
	sta.w SimPickFirst
	iny
	iny
	clc
	adc.b [p0],y
	sta.w SimGroupStart+$2
	sta.w SimPickEnd
	iny
	iny
	adc.b [p0],y
	sta.w SimGroupStart+$4
	stz.w SimGiveLater
	lda.b $A4
	and.w #$FF00
	cmp.w #$0100
	bne .3
	xba
	bra .4
.3:									; X = $00C0, call Mul16U, A = tmp3, A - r2+2, ...
	ldx.w #$00C0
	jsl.l Mul16U
	lda.b tmp3
	sec
	sbc.b r2+2
	sta.w SimGiveLater
	lda.b r2+2
.4:									; SimGiveCount = A, call SimGiveGoals, ...
	sta.w SimGiveCount
	jsr.w SimGiveGoals
	lda.w SimGroupStart+$2
	sta.w SimPickFirst
	lda.w SimGroupStart+$4
	sta.w SimPickEnd
	lda.w SimGiveLater
	sta.w SimGiveCount
	jsr.w SimGiveGoals
	stz.w SimGiveLater
	lda.b tmp3
	lsr a
	beq SimPlayerStatsReturn
	sta.b tmp3
	xba
	and.w #$FF00
	cmp.w #$0100
	bne .5
	xba
	bra .6
.5:									; X = $00C0, call Mul16U, A = tmp3, A - r2+2, ...
	ldx.w #$00C0
	jsl.l Mul16U
	lda.b tmp3
	sec
	sbc.b r2+2
	sta.w SimGiveLater
	lda.b r2+2
.6:									; SimGiveCount = A, SimPickFirst = SimGroupStart, ...
	sta.w SimGiveCount
	lda.w SimGroupStart
	sta.w SimPickFirst
	lda.w SimGroupStart+$2
	sta.w SimPickEnd
	jsr.w SimGiveAssists
	lda.w SimGroupStart+$2
	sta.w SimPickFirst
	lda.w SimGroupStart+$4
	sta.w SimPickEnd
	lda.w SimGiveLater
	sta.w SimGiveCount
SimGiveAssists:						; gives SimGiveCount assists one at a time to random players of the pick
									; table (BuildSimPickTable): + 1 at + $6E
	lda.w SimGiveCount
	beq SimPlayerStatsReturn
	jsr.w BuildSimPickTable
.1:									; A = SimPickTotal, call RandomBelowA7E, X = $0000
	lda.w SimPickTotal
	jsr.w RandomBelowA7E
	ldx.w #$0000
.loop:								; loop: if A < SimTable,x go to .2, if zero go to .2, X + 1, X + 1, ...
	cmp.w SimTable,x
	bcc .2
	beq .2
	inx
	inx
	inx
	inx
	bra .loop
.2:									; A = SimTable+$2,x, A + $0E, X = A, $006E,x + 1, ...
	lda.w SimTable+$2,x
	clc
	adc.b $0E
	tax
	inc.w $006E,x
	dec.w SimGiveCount
	bne .1
SimPlayerStatsReturn:				; the rts SimPlayerStats and SimGiveAssists share
	rts
