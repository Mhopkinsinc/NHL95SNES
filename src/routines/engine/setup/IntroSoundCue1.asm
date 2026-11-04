IntroSoundCue1:						; starts the first pair of intro sounds after 30 ticks
	lda.w $0008,x
	cmp.w #$001E
	bcc IntroSoundCueReturn
	lda.w #IntroSoundCue2
	sta.w $0002,x
	lda.w #$0014
	jsl.l StartSound
	lda.w #$0011
	bra StartSoundJump
