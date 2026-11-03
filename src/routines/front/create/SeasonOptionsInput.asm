SeasonOptionsInput:					; the League Menu each frame (screen state 6): up / down move, B / start /
									; select run the item (SeasonMenuJumps), X leaves
	lda.w repeatdelayframes
	beq .1
	cmp.w #$0014
	bcc .rts
	lda.w #$000C
	sta.w repeatdelayframes
.1:									; A = padchangeany, if a $0800 bit set go to .4, ...
	lda.w padchangeany
	bit.w #$0800
	bne .4
	bit.w #$0400
	bne .6
	bit.w #$B000
	bne .2
	bit.w #$0040
	bne .3
.rts:								; return
	rts
.2:									; A = d6, A * 2, X = A, jump through SeasonMenuJumps,x
	lda.b d6
	asl a
	tax
	jmp (SeasonMenuJumps,x)
.3:									; call FadeOutWait, OptPlayMode = $0002, go to Restart
	jsl.l FadeOutWait
	lda.w #$0002
	sta.w OptPlayMode
	jmp.w Restart
.4:									; call LeagueItemPalette3, d6 - 1, if the result >= 0 go to .5, d6 = $0005
	jsr.w LeagueItemPalette3
	dec.b d6
	bpl .5
	lda.w #$0005
	sta.b d6
.5:									; call LeagueItemPalette0, call SendTextMap, go to PlaceLeagueCursor
	jsr.w LeagueItemPalette0
	jsl.l SendTextMap
	jmp.w PlaceLeagueCursor
.6:									; call LeagueItemPalette3, A = d6, A + 1, if A < $0006 go to .7, ...
	jsr.w LeagueItemPalette3
	lda.b d6
	inc a
	cmp.w #$0006
	bcc .7
	lda.w #$0000
.7:									; d6 = A, call LeagueItemPalette0, call SendTextMap, ...
	sta.b d6
	jsr.w LeagueItemPalette0
	jsl.l SendTextMap
	jmp.w PlaceLeagueCursor
