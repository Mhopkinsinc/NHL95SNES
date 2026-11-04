SkaterRatingsInput:					; the skater ratings page's keys: the cursor on rating d6, up / down among
									; the 11 ratings, left / right EditRatingLeft / EditRatingRight, start
									; SaveCreatedPlayer, X cancels
	ldx.b a0
	lda.b d6
	asl a
	asl a
	asl a
	adc.w #$003E
	sta.b $08,x
	lda.w #$0010
	sta.b $05,x
	lda.w repeatdelayframes
	beq .1
	cmp.w #$0014
	bcc RatingRowPalette3Return
	lda.w #$0010
	sta.w repeatdelayframes
.1:									; A = padchangeany, if $0040 bits clear go to .2, go to ExitCreatePlayer3
	lda.w padchangeany
	bit.w #$0040
	beq .2
	jmp.w ExitCreatePlayer3
.2:									; if $0800 bits clear go to .3, go to SkaterRatingRowUp
	bit.w #$0800
	beq .3
	jmp.w SkaterRatingRowUp
.3:									; if $0400 bits clear go to .4, go to SkaterRatingRowDown
	bit.w #$0400
	beq .4
	jmp.w SkaterRatingRowDown
.4:									; if a $0200 bit set go to EditRatingLeft, ...
	bit.w #$0200
	bne EditRatingLeft
	bit.w #$0100
	bne EditRatingRight
	bit.w #$1000
	beq .rts
	jmp.w SaveCreatedPlayer
.rts:								; return
	rts
