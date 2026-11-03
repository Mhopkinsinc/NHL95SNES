updatepentime:						; called from other segments
	lda.w #$0020
	trb.w sflags3
	lda.w gmclock
	beq .1
	jmp.w PenaltyTimeReturn
.1:									; if PenShotActive = 0 go to .2, go to PenaltyTimeReturn
	lda.w PenShotActive
	beq .2
	jmp.w PenaltyTimeReturn
.2:									; A = Penaltytimer, Y = d7, Y - 1, if the result = 0 go to .3, ...
	lda.w Penaltytimer
	ldy.b d7
	dey
	beq .3
	dec a
.3:									; A - 1, Penaltytimer = A, if plus go to PenaltyTimeReturn, A + $0018, ...
	dec a
	sta.w Penaltytimer
	bpl PenaltyTimeReturn
	clc
	adc.w #$0018
	sta.w Penaltytimer
	lda.w #$0020
	tsb.w sflags3
	jsl.l chkatop
	jsl.l CountPowerPlayTime
	stz.b a2
	jsl.l UpdateTeamPenaltyTimes
	lda.w #$0002
	sta.b a2
UpdateTeamPenaltyTimes:				; start the penalty clock update for team a2
	lda.b a2
	beq .1
	lda.w #$001A
.1:									; a0 = A, a1+2 = 0, a1 = mesarea, d1 = $0002, ...
	sta.b a0
	stz.b a1+2
	lda.w #mesarea
	sta.b a1
	lda.w #$0002
	sta.b d1
	sta.b d3
UpdatePenaltyListEntry:				; tick the next active penalty in the team box list
	ldy.b a0
	lda.w tmboxlist,y
	inc.b a0
	and.w #$00FF
	sta.b d0
	bit.w #$0080
	bne CheckTimedPenaltyReleases
	lda.b a2
	beq .1
	lda.w #$0034
.1:									; A + d0, Y = A, A = tmpdst,y, if a $4000 bit set go to
									; UpdateCoincidentalPenalty, ...
	clc
	adc.b d0
	tay
	lda.w tmpdst,y
	bit.w #$4000
	bne UpdateCoincidentalPenalty
	dec.b d1
	bmi UpdatePenaltyListEntry
	lda.b d0
	sta.b [a1]
	inc.b a1
	inc.b a1
	lda.w tmpdst,y
	dec a
	sta.w tmpdst,y
	bne .2
	jsl.l RemovePlayerFromList
.2:									; go to UpdatePenaltyListEntry
	bra UpdatePenaltyListEntry
