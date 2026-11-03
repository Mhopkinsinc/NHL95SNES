GetShifter:							; called from other segments
	lda.w #$FFF0
	sta.b d2
	lda.w #$0010
	sta.b d1
	lda.w playoffRoundIdx
	tay
.loop:								; loop: A = d2, A + d1, d2 = A, d1 / 2, ...
	lda.b d2
	clc
	adc.b d1
	sta.b d2
	lsr.b d1
	dey
	bpl .loop
	dec.b d1
	rtl
