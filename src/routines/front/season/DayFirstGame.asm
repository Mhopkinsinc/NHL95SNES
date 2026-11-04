DayFirstGame:						; d4 = the number of games on the days before d0 (SeasonSchedule), the
									; season index of day d0's first game
	stz.b d4
	lda.b d0
	asl a
	tax
	bra .1
.loop:								; loop: Y = X, A = SeasonSchedule,x, X = A, A = $C30000,x, ...
	txy
	lda.l SeasonSchedule,x
	tax
	lda.l $C30000,x
	and.w #$00FF
	tyx
	adc.b d4
	sta.b d4
.1:									; X - 1, X - 1, if the result >= 0 go to .loop, return
	dex
	dex
	bpl .loop
	rts
