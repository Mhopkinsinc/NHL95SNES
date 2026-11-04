PracticePadGoalie:					; the first pad on side d4 (padside) controlling no player (c1playernum
									; minus) takes the goalie
	ldy.w #$0008
.loop:								; loop: if padside,y < 0 go to .1, if padside,y = d4 go to .2
	lda.w padside,y
	bmi .1
	cmp.b d4
	beq .2
.1:									; Y - 1, Y - 1, if the result >= 0 go to .loop, go to .rts
	dey
	dey
	bpl .loop
	bra .rts
.2:									; if c1playernum,y >= 0 go to .1, d4 = Y, call PadTakeGoalie
	lda.w c1playernum,y
	bpl .1
	sty.b d4
	jsl.l PadTakeGoalie
.rts:								; return
	rts
