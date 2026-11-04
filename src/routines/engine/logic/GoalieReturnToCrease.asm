GoalieReturnToCrease:				; skate the goalie back toward the crease
	lda.w #rtss>>16
	sta.b a0+2
	lda.w #rtss
	sta.b a0
	ldy.w #$0004
	lda.w Xpos,x
	bpl .1
	ldy.w #$FFFC
.1:									; d0 = Y, d1 = $00FF, if pfgoal,x = 0 go to .2, d1 = $FF01
	sty.b d0
	lda.w #$00FF
	sta.b d1
	lda.w pfgoal,x
	beq .2
	lda.w #$FF01
	sta.b d1
.2:									; temp2,x = 0, go to skateto
	stz.w temp2,x
	jml.l skateto
