GoalieRatingsInput:					; the goalie ratings page's keys: up / down among the 8 ratings, left /
									; right EditRatingLeft / EditRatingRight, start SaveCreatedPlayer, X
									; cancels
	lda.w repeatdelayframes
	beq .1
	cmp.w #$0014
	bcc GoalieRatingsInputReturn
	lda.w #$0010
	sta.w repeatdelayframes
.1:									; A = padchangeany, if $0040 bits clear go to .2, go to ExitCreatePlayer3
	lda.w padchangeany
	bit.w #$0040
	beq .2
	jmp.w ExitCreatePlayer3
.2:									; if a $0800 bit set go to .5, if a $0400 bit set go to .6, ...
	bit.w #$0800
	bne .5
	bit.w #$0400
	bne .6
	bit.w #$0200
	beq .3
	jmp.w EditRatingLeft
.3:									; if $0100 bits clear go to .4, go to EditRatingRight
	bit.w #$0100
	beq .4
	jmp.w EditRatingRight
.4:									; if a $1000 bit set go to SaveCreatedPlayer, return
	bit.w #$1000
	bne SaveCreatedPlayer
	rts
.5:									; A = $0008, call RatingRowPalette3, d6 - 1, ...
	lda.w #$0008
	jsr.w RatingRowPalette3
	dec.b d6
	bpl .rts
	stz.b d6
.rts:								; return
	rts
.6:									; A = $0008, call RatingRowPalette3, A = d6, A + 1, ...
	lda.w #$0008
	jsr.w RatingRowPalette3
	lda.b d6
	inc a
	cmp.w #$0008
	bcs .rts
	sta.b d6
	rts
