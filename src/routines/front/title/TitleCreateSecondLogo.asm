TitleCreateSecondLogo:				; creates the second title logo sprite and starts its palette fade
	lda.w #$000A
	sta.b $18
	lda.w #$0090
	sta.b $1A
	lda.w #$0027
	jsr.w CreateTitleFadingSprite
	ldx.b d1
	lda.w #TitleFadeSecondLogo
	sta.w $0002,x
TitleFadeSecondLogo:				; fades the second title logo palette, then resets the task delay
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
	stz.w $0008,x
	lda.w #TitleStartWhiteFade
	sta.w $0002,x
TitleStartWhiteFade:				; waits for the task delay, then starts a white fade for the title palette
	lda.w $0008,x
	cmp.w #$003C
	bne TitleFadeFirstLogoReturn
	lda.w #$0010
	sta.b $7D
	sta.b d3
	lda.b d4
	ldy.w #$7FFF
	jsl.l FillWords7E
	ldx.w #$00C2
	stx.b a3+2
	lda.w #$0AB8
	sta.b a3
	clc
	adc.b [a3]
	bcc .1
	inx
	clc
.1:									; A + $0002, if carry clear go to .2, X + 1
	adc.w #$0002
	bcc .2
	inx
	clc
.2:									; a3 = A, A + [a3], if carry clear go to .3, X + 1, ...
	sta.b a3
	adc.b [a3]
	bcc .3
	inx
	clc
.3:									; A + $0009, if carry clear go to .4, X + 1
	adc.w #$0009
	bcc .4
	inx
.4:									; a3+2 = X, a3 = A, X = $007E, A = d4, ...
	stx.b a3+2
	sta.b a3
	ldx.w #$007E
	lda.b d4
	ldy.b d5
	jsl.l StartColourFade
	ldx.b d1
	lda.w #TitleFinishWhiteFade
	sta.w $0002,x
TitleFinishWhiteFade:				; completes the title palette fade and enables the start key task
	lda.w #$0020
	jsr.w QueueFadeStep
	bne TitleFinishWhiteFadeReturn
	stz.b d5+2
	jsl.l AddStartKeyTask
	ldx.b d1
	lda.w #TitleStartTextPage
	sta.w $0002,x
TitleFinishWhiteFadeReturn:			; the rtl TitleFinishWhiteFade ends with, shared by TitleFadeTextIn
	rtl
