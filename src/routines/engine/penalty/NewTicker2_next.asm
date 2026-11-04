NewTicker2_next:					; from Intermission_tick and other segments
	lda.w TickerNum
	bmi .1
	ora.w gamenum
	bne .2
.1:									; call GetShifter, TickerNum = d1, if d1 < 0 go to IntermissionTick_done
	jsl.l GetShifter
	lda.b d1
	sta.w TickerNum
	bmi IntermissionTick_done
.2:									; go to NewTicker2
	jmp.w NewTicker2
