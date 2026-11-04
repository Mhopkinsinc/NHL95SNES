Intermission_tick:					; no caller found (not traced)
	lda.w demoflag
	beq IntermissionTick_done
	lda.b Vcount
	sec
	sbc.w tickervc
	cmp.w #$0150
	bcc IntermissionTick_done
	jsl.l NewTicker2_next
	lda.w tickerstart
	cmp.w TickerNum
	bne Intermission_tick
	jsl.l DoHiLights
	lda.w #$0008
	trb.w sflags3
IntermissionTick_done:				; A = 0, return: the end of Intermission_tick
	lda.w #$0000
	rtl
