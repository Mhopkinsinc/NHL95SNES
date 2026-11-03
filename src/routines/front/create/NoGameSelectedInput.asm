NoGameSelectedInput:				; the A game must be selected warning each frame (screen state 12): start
									; / select back to the League Menu
	lda.w repeatdelayframes
	beq .1
.rts:								; return
	rts
.1:									; A = padchangeany, if $3000 bits clear go to .rts, go to SeasonOptions
	lda.w padchangeany
	bit.w #$3000
	beq .rts
	jmp.w SeasonOptions
