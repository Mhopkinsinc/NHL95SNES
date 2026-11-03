EditRatingRight:					; rating d6 one step up while below 15 and d2 has 5 points to give, then
									; the value printed (RatingText) and the overall (PrintCreatedOverall)
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
	cmp.w #$000F
	bcs .2
	asl a
	tax
	lda.b d2
	sec
	sbc.w #$0005
	bmi .2
	sta.b d2
	lda.b d6
	asl a
	tax
	inc.w CreateRatings,x
.2:									; A = d6, A * 2, X = A, A = CreateRatings,x, ...
	lda.b d6
	asl a
	tax
	lda.w CreateRatings,x
	jsr.w RatingText
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
