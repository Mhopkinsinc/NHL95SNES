UpdateDayPlayed:					; SRDayPlayed again: a game's bit is set when it was or its record says it
									; is over (+0 = 0)
	pea.w $7E7F
	lda.w DayGameCount
	sta.b tmp0
	lda.l SRDayPlayed
	sta.b $0A
	stz.b $0C
	plb
	ldy.w #$8EF8
.loop:								; loop: $0A / 2, if carry set go to .1, if $0000,y is not 0 go to .1
	lsr.b $0A
	bcs .1
	lda.w $0000,y
	bne .1
	sec
.1:									; A = Y, A + $010A, Y = A, tmp0 - 1, ...
	ror.b $0C
	tya
	adc.w #$010A
	tay
	dec.b tmp0
	bne .loop
	plb
	lda.w #$0010
	sbc.w DayGameCount
.loop2:								; loop: $0C / 2, A - 1, if the result >= 0 go to .loop2, ...
	lsr.b $0C
	dec a
	bpl .loop2
	lda.b $0C
	sta.l SRDayPlayed
	rts
