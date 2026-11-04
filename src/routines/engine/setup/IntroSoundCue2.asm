IntroSoundCue2:						; starts the second pair of intro sounds after 60 ticks
	lda.w $0008,x
	cmp.w #$003C
	bcc IntroSoundCueReturn
	lda.w #IntroSoundCue3
	sta.w $0002,x
	lda.w #$0013
	jsl.l StartSound
	lda.w #$0010
	bra StartSoundJump
