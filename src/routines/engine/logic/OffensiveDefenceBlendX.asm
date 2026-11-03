OffensiveDefenceBlendX:				; blend the puck X position into the defender lateral target
	lda.w puckx
	pha
	asl a
	pla
	ror a
	clc
	adc.b d0
OffensiveDefenceTargetY:			; choose the offensive defender depth and skate to the target
	sta.b d0
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0010
	bne .6
	lda.w pucky
	sta.b d2
	lda.w pfgoal,x
	bne .1
	lda.w #$0000
	sec
	sbc.b d2
	sta.b d2
.1:									; if d2 - $FFA4 < 0 go to .3, if d2 - $005C < 0 go to .2, d1 = $0066, ...
	lda.b d2
	cmp.w #$FFA4
	bmi .3
	cmp.w #$005C
	bmi .2
	lda.w #$0066
	sta.b d1
	bra .4
.2:									; d1 = $FFAE, go to .4
	lda.w #$FFAE
	sta.b d1
	bra .4
.3:									; d1 = $FF24
	lda.w #$FF24
	sta.b d1
.4:									; if pfgoal,x is not 0 go to .5, A = $0000, A - d1, d1 = A
	lda.w pfgoal,x
	bne .5
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
.5:									; go to skateto
	jmp.w skateto
.6:									; Y = $0066, if pfgoal,x = 0 go to .7, Y = $FF9A
	ldy.w #$0066
	lda.w pfgoal,x
	beq .7
	ldy.w #$FF9A
.7:									; d1 = Y, go to .5
	sty.b d1
	bra .5
