TitleSlideBothBGs:					; scrolls BG1 and BG2 apart, then creates the first fading logo sprite
	lda.w BG1HScroll
	dec a
	dec a
	dec a
	dec a
	sta.w BG1HScroll
	lda.w BG2HScroll
	inc a
	inc a
	sta.w BG2HScroll
	cmp.w #$0100
	bcc TitleSlideBG2Return
	lda.w #$00CB
	sta.b $18
	lda.w #$0093
	sta.b $1A
	lda.w #$0028
	jsr.w CreateTitleFadingSprite
	ldx.b d1
	lda.w #TitleFadeFirstLogo
	sta.w $0002,x
TitleFadeFirstLogo:					; fades the first title logo palette before creating the second logo
	ldx.b d4+2
	lda.w $0034,x
	and.w #$FF00
	xba
	clc
	adc.w #$0008
	asl a
	asl a
	asl a
	asl a
	jsr.w QueueFadeStep
	bne TitleFadeFirstLogoReturn
	ldx.b d1
	lda.w #TitleCreateSecondLogo
	sta.w $0002,x
TitleFadeFirstLogoReturn:			; the rtl TitleFadeFirstLogo ends with, shared by TitleFadeSecondLogo and
									; TitleStartWhiteFade
	rtl
