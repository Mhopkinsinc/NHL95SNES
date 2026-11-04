IntroScaleToSprite:					; reduces scale to unity, reveals the sprite and removes the task
	jsr.w StepIntroScale
	cmp.w #$0100
	bcs IntroScaleToFlashReturn
	lda.w #$0100
	sta.w introM7Scale
	lda.w #$0010
	sta.w introTM
	ldx.b d0
	jsr.w ShowIntroSprite
	jmp.w RemoveTask
