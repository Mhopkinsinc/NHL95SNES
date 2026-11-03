IntroScaleToFlash:					; reduces the intro scale and starts the colour flash at its threshold
	jsr.w StepIntroScale
	cmp.w #$0280
	bcs IntroScaleToFlashReturn
	lda.w #IntroScaleToSprite
	sta.w $0002,x
	lda.b d0+2
	lsr a
	bcc IntroScaleToFlashReturn
	lda.w #IntroColourFlashTask
	ldx.w #IntroColourFlashTask>>16
	ldy.w #$0500
	jmp.w AddTask
