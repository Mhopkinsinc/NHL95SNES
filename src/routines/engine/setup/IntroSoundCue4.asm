IntroSoundCue4:						; starts the last intro sound after 150 ticks and disables this task
	lda.w $0008,x
	cmp.w #$0096
	bcc IntroSoundCueReturn
	lda.w #IntroSoundCueReturn
	sta.w $0002,x
	lda.w #$0015
StartSoundJump:						; jumps to StartSound: the intro sound cues' shared tail
	jml.l StartSound
