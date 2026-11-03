PauseScoresClock:					; the pause screen's big digits: the home score (tmscore) at map tile $D7
									; and the away score at $C3 (three digits, PushNumberWrap), then the game
									; clock (clockbcd) from tile $8B
	lda.w #$0003
	sta.b d1
	lda.w tmscore
	sta.b d0
	jsl.l PushNumberWrap
	ldy.w #$00D7
	jsr.w PutPauseScore
	lda.w tmscore+2
	sta.b d0
	jsl.l PushNumberWrap
	ldy.w #$00C3
	jsr.w PutPauseScore
	ldy.w #$008B
	lda.w clockbcd+1
	lsr a
	lsr a
	lsr a
	lsr a
	jsr.w PutClockDigit
	iny
	iny
	lda.w clockbcd+1
	jsr.w PutClockDigit
	iny
	iny
	iny
	iny
	lda.w clockbcd
	lsr a
	lsr a
	lsr a
	lsr a
	jsr.w PutClockDigit
	iny
	iny
	lda.w clockbcd
	jmp.w PutClockDigit
