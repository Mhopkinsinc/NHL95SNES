SeasonPlayerStatsInput:				; the Season Player Stats screen each frame (screen state 10): up / down
									; scroll, B goalies / players, left / right switch the team, start /
									; select back to the League Menu
	jsr.w ScrollListArrows
	lda.w repeatdelayframes
	beq .1
	cmp.w #$0014
	bcc .rts
	lda.w #$0014
	sta.w repeatdelayframes
.1:									; A = padchangeany, if a $8000 bit set go to .7, ...
	lda.w padchangeany
	bit.w #$8000
	bne .7
	bit.w #$0100
	bne .5
	bit.w #$0200
	bne .9
	bit.w #$0400
	beq .2
	jmp.w ScrollListDown
.2:									; if $0800 bits clear go to .3, go to ScrollListUp
	bit.w #$0800
	beq .3
	jmp.w ScrollListUp
.3:									; if a $3000 bit set go to .4
	bit.w #$3000
	bne .4
.rts:								; return
	rts
.4:									; call FadeOutWait, X = $77, call DeleteSprite, X = $79, ...
	jsl.l FadeOutWait
	ldx.b $77
	jsl.l DeleteSprite
	ldx.b $79
	jsl.l DeleteSprite
	jmp.w SeasonOptions
.5:									; A = HomeTeam, A + 1, if A < $001A go to .6, A = $0000
	lda.w HomeTeam
	inc a
	cmp.w #$001A
	bcc .6
	lda.w #$0000
.6:									; go to .10
	bra .10
.7:									; call PrintPlayerStatsHeadings, if d0 is not 0 go to .8, d0 - 1, ...
	jsr.w PrintPlayerStatsHeadings
	lda.b d0
	bne .8
	dec.b d0
	bra .11
.8:									; d0 = 0, go to .11
	stz.b d0
	bra .11
.9:									; A = HomeTeam, A - 1, if the result >= 0 go to .10, A = $0019
	lda.w HomeTeam
	dec a
	bpl .10
	lda.w #$0019
.10:								; HomeTeam = A
	sta.w HomeTeam
.11:								; X = $77, call DeleteSprite, X = $79, call DeleteSprite, ...
	ldx.b $77
	jsl.l DeleteSprite
	ldx.b $79
	jsl.l DeleteSprite
	lda.b $D3
	clc
	adc.w #$0280
	ldy.w #$0380
	jsl.l ClearRAM7E
	jsl.l SendTextMap
	jsr.w DrawPlayerStatsTeam
	jsr.w LoadGameRosters
	lda.w HomeRoster+2
	sta.b a1
	lda.b d0
	bne .12
	sec
	lda.w HomeRoster
	sbc.w HomeRoster+2
	sta.b a1
.12:								; a1+2 = 0, A = DrawSeasonPlayerRow, X = $000C, Y = $000B, ...
	stz.b a1+2
	lda.w #DrawSeasonPlayerRow
	ldx.w #$000C
	ldy.w #$000B
	jsr.w StartScrollList
	jsl.l SendTextMap
	rts
