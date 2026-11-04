StandingsInput:						; the NHL Standings screen each frame (screen state 11): up / down / left
									; / right change the division or the stat (DrawStandings), start / select
									; back to the League Menu
	jsr.w ScrollListArrows
	lda.w repeatdelayframes
	beq .1
	cmp.w #$0014
	bcc .rts
	lda.w #$0014
	sta.w repeatdelayframes
.1:									; A = padchangeany, if a $0400 bit set go to .2, ...
	lda.w padchangeany
	bit.w #$0400
	bne .2
	bit.w #$0800
	bne .4
	bit.w #$0200
	bne .6
	bit.w #$0100
	bne .7
	bit.w #$3000
	bne .5
.rts:								; return
	rts
.2:									; A = d1, A + 1, if A < $0004 go to .3, A = $0000
	lda.b d1
	inc a
	cmp.w #$0004
	bcc .3
	lda.w #$0000
.3:									; d1 = A, Y = $03F0, A = $0200, call ClearTextMapAt, ...
	sta.b d1
	ldy.w #$03F0
	lda.w #$0200
	jsr.w ClearTextMapAt
	bra .10
.4:									; A = d1, A - 1, if the result >= 0 go to .3, A = $0003, ...
	lda.b d1
	dec a
	bpl .3
	lda.w #$0003
	bra .3
.5:									; call FadeOutWait, X = $77, call DeleteSprite, X = $79, ...
	jsl.l FadeOutWait
	ldx.b $77
	jsl.l DeleteSprite
	ldx.b $79
	jsl.l DeleteSprite
	jmp.w SeasonOptions
.6:									; d0 - 1, if the result >= 0 go to .9, A = $0007, go to .8
	dec.b d0
	bpl .9
	lda.w #$0007
	bra .8
.7:									; A = d0, A + 1, if A < $0008 go to .8, A = $0000
	lda.b d0
	inc a
	cmp.w #$0008
	bcc .8
	lda.w #$0000
.8:									; d0 = A
	sta.b d0
.9:									; Y = $0270, call ClearStandingsRows
	ldy.w #$0270
	jsr.w ClearStandingsRows
.10:								; X = $77, call DeleteSprite, X = $79, call DeleteSprite, ...
	ldx.b $77
	jsl.l DeleteSprite
	ldx.b $79
	jsl.l DeleteSprite
	jsl.l SendTextMap
	jsl.l WaitTransfers
	jmp.w DrawStandings
