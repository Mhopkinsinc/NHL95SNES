RatingsInput:						; ModifyRatings' keys: SkaterRatingsInput (d0 not 0), else the cursor on
									; goalie rating d6 and GoalieRatingsInput; then palette 0 on the current
									; rating's row
	lda.b d0
	beq .1
	jsr.w SkaterRatingsInput
	lda.w #$0007
	bra .2
.1:									; X = a0, A = d6, A * 2, A * 2, ...
	ldx.b a0
	lda.b d6
	asl a
	asl a
	asl a
	adc.w #$0046
	sta.b $08,x
	lda.w #$0010
	sta.b $05,x
	jsr.w GoalieRatingsInput
	lda.w #$0008
.2:									; A + d6, A / 2, A / 2, A + $D3, ...
	clc
	adc.b d6
	xba
	lsr a
	lsr a
	adc.b $D3
	tax
	ldy.w #$001F
.loop:								; loop: A = $7E0000,x, A and $E3FF, $7E0000,x = A, X + 1, ...
	lda.l $7E0000,x
	and.w #$E3FF
	sta.l $7E0000,x
	inx
	inx
	dey
	bpl .loop
	rts
