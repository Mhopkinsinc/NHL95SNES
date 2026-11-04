Intermission_ticker:				; the intermission's ticker (Intermission calls it where 94S calls
									; Intermission_ticker)
	lda.w TickerNum
	bmi .1
	ora.w gamenum
	bne .2
.1:									; call GetShifter, TickerNum = d1, if d1 < 0 go to Intermission_rtl
	jsl.l GetShifter
	lda.b d1
	sta.w TickerNum
	bmi Intermission_rtl
.2:									; go to NewTicker2
	jmp.w NewTicker2
