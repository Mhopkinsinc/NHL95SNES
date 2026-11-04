StartCrowdSound:					; starts the crowd sound (sound 2) unless it is on (CrowdSoundOn)
	lda.w CrowdSoundOn
	bne .rtl
	lda.w #$0002
	sta.w CrowdSoundOn
	jml.l StartSound
.rtl:								; return
	rtl
