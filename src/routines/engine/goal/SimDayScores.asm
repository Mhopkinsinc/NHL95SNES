SimDayScores:						; simulates the score of each of the day's computer games not yet done:
									; goals added at random below each team's rating, the game marked done (+6
									; = $FFFF); in play mode 3 a tie goes to the away team
	lda.w DayGameCount
	sta.b tmp0
	ldx.w #$8EF8
.loop:								; loop: if $7F0000,x is not 0 go to .3, if $7F0006,x < 0 go to .3, ...
	lda.l $7F0000,x
	bne .3
	lda.l $7F0006,x
	bmi .3
	lda.l $7F0002,x
	txy
	jsr.w SimGoalLimit
	sec
	sbc.l $7F0008,x
	bcc .1
	beq .1
	jsl.l RandomBelowA
	clc
	adc.l $7F0008,x
	sta.l $7F0008,x
.1:									; A = $7F0004,x, call SimGoalLimit, A + 1, A - $7F000A,x, ...
	lda.l $7F0004,x
	jsr.w SimGoalLimit
	inc a
	sec
	sbc.l $7F000A,x
	bcc .2
	beq .2
	jsl.l RandomBelowA
	clc
	adc.l $7F000A,x
	sta.l $7F000A,x
.2:									; $7F0006,x = $FFFF, if OptPlayMode is not $0003 go to .3, ...
	lda.w #$FFFF
	sta.l $7F0006,x
	lda.w OptPlayMode
	cmp.w #$0003
	bne .3
	lda.l $7F000A,x
	cmp.l $7F0008,x
	bne .3
	inc a
	sta.l $7F000A,x
.3:									; A = X, A + $010A, X = A, tmp0 - 1, ...
	clc
	txa
	adc.w #$010A
	tax
	dec.b tmp0
	bne .loop
	rts
