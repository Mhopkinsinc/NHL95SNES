UpdatePA:							; advance the referee animation and penalty message timers
	lda.w RefCnt
	bmi .rtl
	sec
	sbc.b d7
	sta.w RefCnt
	bpl .1
	jsl.l SetPA2
.1:									; A = penmsgtimer, A - d7, penmsgtimer = A, if plus go to .rtl, ...
	lda.w penmsgtimer
	sec
	sbc.b d7
	sta.w penmsgtimer
	bpl .rtl
	lda.w #$7FFF
	sta.w penmsgtimer
.rtl:								; return
	rtl
