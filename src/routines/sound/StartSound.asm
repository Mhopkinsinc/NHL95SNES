StartSound:							; starts sound A: sound driver command 1 with X = A (the effects $01-$16,
									; the songs $A2-$A7 once LoadSounds has loaded them)
	phx
	phy
	tax
	lda.w #$0001
	jsl.l QueueSoundCmd
	ply
	plx
	rtl
