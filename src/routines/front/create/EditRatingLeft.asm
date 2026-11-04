EditRatingLeft:						; rating d6 (CreateRatings + 2 * d6) one step down to at least 0, its 5
									; points back in d2, then the value printed (RatingText) and the overall
									; (PrintCreatedOverall)
	lda.b d6
	xba
	lsr a
	lsr a
	adc.b $D3
	adc.w #$01F2
	ldx.b d0
	bne .1
	adc.w #$0040
.1:									; X = A, $0000,x = 0, $0002,x = 0, $0004,x = 0, ...
	tax
	stz.w $0000,x
	stz.w $0002,x
	stz.w $0004,x
	stz.w $0006,x
	jsl.l SendTextMap
	jsl.l WaitTransfers
	lda.b d6
	asl a
	tax
	lda.w CreateRatings,x
	dec a
	bpl .2
	sec
	lda.b d2
	sbc.w #$0005
	sta.b d2
	lda.w #$0000
.2:									; CreateRatings,x = A, push A, call RatingText, pull A, ...
	sta.w CreateRatings,x
	pha
	jsr.w RatingText
	pla
	asl a
	tax
	clc
	lda.b d2
	adc.w #$0005
	sta.b d2
	lda.b d6
	clc
	adc.w #$0007
	tay
	lda.b d0
	bne .3
	iny
.3:									; X = mesarea, call PrintBoldRightStr, go to PrintCreatedOverall
	ldx.w #mesarea
	jsl.l PrintBoldRightStr
	jmp.w PrintCreatedOverall
	rts								; unreached: no code branches, falls or points here
