ProcessInputWithRepeat:				; called from other segments
	lda.b d3
	beq .rtl
	lda.b d2
	bne .1
	dec.w repeatdelayframes
	bpl .rtl
	lda.w #$0006
	sta.w repeatdelayframes
	lda.b d3
	sta.b d1
.rtl:								; return
	rtl
.1:									; repeatdelayframes = $0014, return
	lda.w #$0014
	sta.w repeatdelayframes
	rtl
