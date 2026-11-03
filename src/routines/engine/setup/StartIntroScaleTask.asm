StartIntroScaleTask:				; starts the intro scale animation for sprite A with flash flag X
	sta.b d0
	lda.w #$0001
	trb.b d0+2
	txa
	tsb.b d0+2
	lda.w #$0011
	sta.w introTM
	lda.w #$4000
	sta.w introM7Scale
	lda.w #IntroScaleToFlash
	ldx.w #IntroScaleToFlash>>16
	ldy.w #$1000
	jsl.l AddTask
	rts
