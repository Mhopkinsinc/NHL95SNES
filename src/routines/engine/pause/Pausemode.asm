Pausemode:							; the game loop's pause (the sflags pause bit): the game state saved,
									; Pausemode_menu, the state back
	lda.w sfhormode
	pha
	jsl.l SetHor
	pei ($7F)
	pei ($81)
	pei ($83)
	pei ($85)
	pei ($87)
	pei ($89)
	pei ($8B)
	pei ($8D)
	pei ($8F)
	pei ($91)
	pei ($93)
	pei ($95)
	pei ($97)
	pei ($99)
	pei ($9B)
	pei ($9D)
	pei ($63)
	pei ($65)
	pei ($67)
	pei ($69)
	pei ($6B)
	pei ($6D)
	pei ($6F)
	pei ($71)
	pei ($73)
	pei ($75)
	pei ($77)
	pei ($79)
	pei ($7B)
	pei ($7D)
	jsl.l Pausemode_menu
	pla
	sta.b $7D
	pla
	sta.b $7B
	pla
	sta.b $79
	pla
	sta.b $77
	pla
	sta.b $75
	pla
	sta.b a4
	pla
	sta.b a3+2
	pla
	sta.b a3
	pla
	sta.b a2+2
	pla
	sta.b a2
	pla
	sta.b a1+2
	pla
	sta.b a1
	pla
	sta.b a0+2
	pla
	sta.b a0
	pla
	sta.b d7+2
	pla
	sta.b d7
	pla
	sta.b d6+2
	pla
	sta.b d6
	pla
	sta.b d5+2
	pla
	sta.b d5
	pla
	sta.b d4+2
	pla
	sta.b d4
	pla
	sta.b d3+2
	pla
	sta.b d3
	pla
	sta.b d2+2
	pla
	sta.b d2
	pla
	sta.b d1+2
	pla
	sta.b d1
	pla
	sta.b d0+2
	pla
	sta.b d0
	jsl.l FreePauseBuffers
	jsl.l QueueSavedTextMap
	pla
	sta.w sfhormode
	bne .1
	jsl.l ClrHor
.1:									; Vcount = 0, OldVcount = 0, call WaitTransfers, pausemenuon = 0, ...
	stz.b Vcount
	stz.w OldVcount
	jsl.l WaitTransfers
	stz.w pausemenuon
	stz.w PauseUnused
	jsl.l forceblack
	stz.w textdirtylo
	lda.w #$0001
	trb.w sflags
	lda.w pregamepause
	bne .2
	jsl.l FadeIn
.2:									; pregamepause = 0, A = $0006, call StartSound, call StartCrowdSound, ...
	stz.w pregamepause
	lda.w #$0006
	jsl.l StartSound
	jsl.l StartCrowdSound
	jsl.l SoundVolumeUp
	lda.w #$FFFF
	sta.w recsfx
	sta.w recsfx2
	lda.b Vcount
	sta.w lastframevc
	sta.w OldVcount
	rtl
