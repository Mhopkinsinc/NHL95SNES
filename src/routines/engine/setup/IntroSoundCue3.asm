IntroSoundCue3:						; starts the third pair of intro sounds after 90 ticks
	lda.w $0008,x
	cmp.w #$005A
	bcc IntroSoundCueReturn
	lda.w #IntroSoundCue4
	sta.w $0002,x
	lda.w #$0016
	jsl.l StartSound
	lda.w #$0009
	bra StartSoundJump
