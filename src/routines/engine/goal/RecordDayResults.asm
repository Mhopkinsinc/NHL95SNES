RecordDayResults:					; RecordGameResult for each of the day's game records (DayGameCount of
									; them at $7F8EF8) whose bit in SRDayPlayed is clear
	pea.w $7E7F
	lda.w DayGameCount
	sta.b tmp0
	lda.l SRDayPlayed
	sta.b tmp2
	plb
	ldy.w #$8EF8
.loop:								; loop: tmp2 / 2, if carry set go to .1, call RecordGameResult
	lsr.b tmp2
	bcs .1
	jsr.w RecordGameResult
.1:									; A = Y, A + $010A, Y = A, tmp0 - 1, ...
	tya
	clc
	adc.w #$010A
	tay
	dec.b tmp0
	bne .loop
	plb
	rts
