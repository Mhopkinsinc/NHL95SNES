LeagueLeadersInput:					; the League Leaders screen each frame (screen state 8): up / down scroll,
									; left / right / B redraw it with another category, start / select back to
									; the League Menu
	jsr.w ScrollListArrows
	lda.w repeatdelayframes
	beq .1
	cmp.w #$0014
	bcc .rts
	lda.w #$0013
	sta.w repeatdelayframes
.1:									; A = padchangeany, if a $3000 bit set go to .4, ...
	lda.w padchangeany
	bit.w #$3000
	bne .4
	bit.w #$0800
	beq .2
	jmp.w ScrollListUp
.2:									; if $0400 bits clear go to .3, go to ScrollListDown
	bit.w #$0400
	beq .3
	jmp.w ScrollListDown
.3:									; if a $0200 bit set go to .5, if a $0100 bit set go to .6, ...
	bit.w #$0200
	bne .5
	bit.w #$0100
	bne .6
	bit.w #$8000
	bne .8
.rts:								; return
	rts
.4:									; call FadeOutWait, X = $77, call DeleteSprite, X = $79, ...
	jsl.l FadeOutWait
	ldx.b $77
	jsl.l DeleteSprite
	ldx.b $79
	jsl.l DeleteSprite
	jmp.w SeasonOptions
.5:									; A = d1, A - 1, if the result >= 0 go to .7, A = $0002, ...
	lda.b d1
	dec a
	bpl .7
	lda.w #$0002
	bra .7
.6:									; A = d1, A + 1, if A < $0003 go to .7, A = $0000
	lda.b d1
	inc a
	cmp.w #$0003
	bcc .7
	lda.w #$0000
.7:									; push A, go to DrawLeagueLeaders
	pha
	jmp.w DrawLeagueLeaders
.8:									; A = d1+2, A xor $0001, d1+2 = A, go to DrawLeagueLeaders
	pei ($83)
	lda.b d1+2
	eor.w #$0001
	sta.b d1+2
	jmp.w DrawLeagueLeaders
