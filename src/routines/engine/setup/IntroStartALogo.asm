IntroStartALogo:					; waits for unit scale, then starts the A logo animation
	lda.w introM7Scale
	cmp.w #$0100
	beq .1
	jmp.w IntroEndDelayReturn
.1:									; X = a1, Y = a1+2, call PrepareIntroMode7Sprite, A = a1, ...
	ldx.b a1
	ldy.b a1+2
	jsr.w PrepareIntroMode7Sprite
	lda.b a1
	ldx.w #$0001
	jsr.w StartIntroScaleTask
	ldx.b d1
	lda.w #IntroStartSportsWord
	sta.w $0002,x
IntroStartSportsWord:				; waits for unit scale, then starts the Sports word animation
	lda.w introM7Scale
	cmp.w #$0100
	beq .1
	jmp.w IntroEndDelayReturn
.1:									; X = a2, Y = a2+2, call PrepareIntroMode7Sprite, A = a2, ...
	ldx.b a2
	ldy.b a2+2
	jsr.w PrepareIntroMode7Sprite
	lda.b a2
	ldx.w #$0000
	jsr.w StartIntroScaleTask
	ldx.b d1
	lda.w #IntroStartElectronicWord
	sta.w $0002,x
IntroStartElectronicWord:			; waits for unit scale, then starts the Electronic word animation
	lda.w introM7Scale
	cmp.w #$0100
	bne IntroEndDelayReturn
	ldx.b a3
	ldy.b a3+2
	jsr.w PrepareIntroMode7Sprite
	lda.b a3
	ldx.w #$0000
	jsr.w StartIntroScaleTask
	ldx.b d1
	lda.w #IntroWaitForUnitScale
	sta.w $0002,x
IntroWaitForUnitScale:				; waits for unit scale and resets the intro task delay
	lda.w introM7Scale
	cmp.w #$0100
	bne IntroEndDelayReturn
	ldx.b d1
	stz.w $0008,x
	lda.w #IntroShowFinalWord
	sta.w $0002,x
IntroShowFinalWord:					; waits 30 task ticks, reveals the final word sprite and resets the delay
	lda.w $0008,x
	cmp.w #$001E
	bne IntroEndDelayReturn
	ldx.b $7B
	jsr.w ShowIntroSprite
	ldx.b d1
	stz.w $0008,x
	lda.w #IntroEndDelay
	sta.w $0002,x
IntroEndDelay:						; ends the intro task sequence after its final hold
	lda.w $0008,x
	cmp.w #$0258
	bne IntroEndDelayReturn
	lda.w #$8000
	trb.b d1+2
IntroEndDelayReturn:				; IntroEndDelay's rtl, shared by the intro task routines
	rtl
