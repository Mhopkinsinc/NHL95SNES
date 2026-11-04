GetPeriodTime:						; d0 = the period length in seconds for the period length option
									; (Optperlen), tmp0 the same as BCD minutes and seconds
	phx
	lda.w Optperlen
	asl a
	tax
	lda.l PeriodTimesBCD,x
	sta.b tmp0
	lda.l GetPeriodTime_timetab,x
	sta.b d0
	plx
	rtl
